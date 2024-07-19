import scrapy
import re
from urllib.parse import urlparse
from automated_schools_outreach_system.school_website import check_scraped, store_emails, debug
from automated_schools_outreach_system import config

class email_scraper(scrapy.Spider):
    name = 'email_scraper'
    MAX_VISITED_URLS = 25000

    def __init__(self, max_depth=2, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        self.dataset_protocol = 'setEmails'
        self.dataset = 'scraped_school_emails'
        self.id_floor = 1
        self.id_ceiling = 1
        
        self.start_urls = self.read_urls()

        self.visited_urls = set()
        self.max_depth = int(max_depth)
        
        self.key_websites = ['directory','activities','music','handbook','administration','faculty','staff','contact','about','departments','art','band','orchestra','fine-arts','instrument','performing-arts','performance']
        self.keywords = ['admin@','music@','band@','choir@','@orchestra','art@','arts@','deansoffice@','dean@','principal@', 'schooloffice@']
        self.blacklist_keywords = ['news','archive','transport','sports','publication','javascript','tel','forum','calendar','alumni','student','gallery','blog','shop','store','donate','donations','careers','recruitment','event','merch', 'mailto:', 'javascript:', 'tel:']
        self.blacklist_start_keywords = ['news','archive','transport','sports','publication','javascript','tel','forum','calendar','alumni','student','gallery','blog','shop','store','domate','donations','careers','recruitment','event','merch', 'mailto:', '#']
        self.excluded_extensions = ['.pdf', '.doc', '.docx', '.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', '.pptx', '.ppt', '.webm']
        
        self.completed_domain_url = set()
            
    def start_requests(self):
        for start_url in self.start_urls:
            yield scrapy.Request(
                url = start_url,
                callback=self.parse,
                meta={
                    'depth': 0,
                    'base_url': start_url,
                    'link': None,
                    'playwright': True,
                    })
            
    # Call check_scraped to retrieve a list of unparsed links
    def read_urls(self):
        return check_scraped.get_remaining_unparsed(self.dataset, self.id_floor, self.id_ceiling)

    def parse(self, response):
        current_url = response.url
        current_domain_url = urlparse(current_url).netloc
        base_url = response.meta['base_url']
        base_domain_url = urlparse(base_url).netloc
        current_depth = response.meta['depth']
        
        if base_domain_url not in current_domain_url:
            self.logger.warning(f"Skipping redirected response outside domain: {response.url}")
            return
        
        content_type = response.headers.get('Content-Type', b'').decode('utf-8')
        if 'text' not in content_type:
            self.logger.warning(f"Skipping non-text response: {current_url}")
            return        

        if (current_url in self.start_urls and current_depth != 0) or current_depth > self.max_depth:
            return
        
        if len(self.visited_urls) > self.MAX_VISITED_URLS:
            self.visited_urls = set()
            
        self.visited_urls.add(current_url)

        # Email regex of the form {any string} + {@} + {any string} + . + {any common email tail}
        emails = set(re.findall(r'[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.(?:com|net|edu|org|gov|us)', response.text, re.IGNORECASE))
            
        if emails:
            store_emails.store_emails(base_url, emails, current_url, self.dataset, self.dataset_protocol)
        
        links = response.css('a::attr(href)').getall()
        filtered_links = [response.urljoin(link) for link in links if not link.startswith(tuple(self.blacklist_start_keywords))]
        
        keyword_website_matches = set()
        
        # If a link contains a keyword, add it to the set of website with keyword matches
        for link in filtered_links:
            if (word in link for word in self.key_websites):
                keyword_website_matches.add(link)
        
        if keyword_website_matches:
            filtered_links = list(keyword_website_matches)
        
        # Loop through the links 
        for link in filtered_links:
            domain_link = urlparse(link).netloc

            if (base_domain_url in domain_link and
                link not in self.visited_urls and
                not any (word in link for word in self.blacklist_keywords) and 
                not any (link.endswith(ext) for ext in (self.excluded_extensions))):
                self.visited_urls.add(link)
                yield scrapy.Request(
                    url = link,
                    callback=self.parse,
                    meta={
                        'depth': current_depth + 1,
                        'base_url': base_url,
                        'link': link,
                        'playwright': True,
                        })