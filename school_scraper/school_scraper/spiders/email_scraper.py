import scrapy
import re
from urllib.parse import urlparse
from automated_schools_outreach_system.school_website import check_scraped, store_emails, debug
from automated_schools_outreach_system import config
import logging

class email_scraper(scrapy.Spider):
    name = 'email_scraper'
    MAX_VISITED_URLS = 10000
    
    # CALL:
    # cd to spiders
    # scrapy crawl email_scraper -a max_depth=1 (any int or whole float)

    def __init__(self, max_depth=2, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        self.dataset_protocol = 'setEmailsTest'
        self.dataset = 'scraped_school_emails_backup'
        self.filtering_key = 120
        
        self.start_urls = self.read_urls()

        self.visited_urls = set()
        self.max_depth = int(max_depth)
        
        self.key_websites = ['directory','activities','music','handbook','administration','faculty','staff','contact','about','departments','art','band','orchestra','fine-arts','instrument','performing-arts','performance']
        self.keywords = ['admin@','music@','band@','choir@','@orchestra','art@','arts@','deansoffice@','dean@','principal@', 'schooloffice@']
        self.blacklist_keywords = ['news','archive','transport','sports','publication','javascript','tel','forum','calendar','alumni','student','gallery','blog','shop','store','domate','donations','careers','recruitment','event','merch, mailto:']
        self.blacklist_start_keywords = ['news','archive','transport','sports','publication','javascript','tel','forum','calendar','alumni','student','gallery','blog','shop','store','domate','donations','careers','recruitment','event','merch', 'mailto:', '#']
        self.excluded_extensions = ('.pdf', '.doc', '.docx', '.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', 'pptx', 'ppt', 'webm')
        
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
        return check_scraped.get_remaining_unparsed(self.dataset, self.filtering_key)

    def parse(self, response):
        content_type = response.headers.get('Content-Type', b'').decode('utf-8')
        if 'text' not in content_type:
            self.logger.warning(f"Skipping non-text response: {response.url}")
            return

        # Retrieve the current depth and then ensure that the maximum depth has not been reached / passed
        current_depth = response.meta['depth']
        base_url = response.meta['base_url']

        if (response.url in self.start_urls and current_depth != 0) or current_depth > self.max_depth:
            return
        
        if len(self.visited_urls) > self.MAX_VISITED_URLS:
            self.visited_urls = set()
            
        self.visited_urls.add(response.url)
        
        # Set up to determine whether a good enough email has been found in this domain
        # domain_url = urlparse(response.url).netloc

        # Email regex of the form {any string} + {@} + {any string} + . + {any common email tail}
        emails = set(re.findall(r'[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.(?:com|net|edu|org)|[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.us', response.text, re.IGNORECASE))

        # Needs to be a url in the domain or will fail
        if emails:
            store_emails.store_emails(base_url, emails, response.url, self.dataset, self.dataset_protocol)
            
        # Adds the domain name to the set of completed domains so that we don't have to parse the same website in the scraper since we've alread found a keyword
        
        # if any(keyword in emails for keyword in self.keywords):
        #     self.completed_domain_url.add(domain_url)
        
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
            parsed_link = urlparse(link)
            domain_link = parsed_link.netloc
            base_domain_url = urlparse(base_url).netloc

            if (domain_link in base_domain_url and
                link not in self.visited_urls and
                # domain_url not in self.completed_domain_url and
                not any (word in link for word in self.blacklist_keywords) and 
                not link.endswith(self.excluded_extensions)):
                self.visited_urls.add(link)
                print(link)
                yield scrapy.Request(
                    url = link,
                    callback=self.parse,
                    meta={
                        'depth': current_depth + 1,
                        'base_url': base_url,
                        'link': link,
                        'playwright': True,
                        })