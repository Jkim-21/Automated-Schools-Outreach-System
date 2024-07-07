import scrapy
import re
from urllib.parse import urlparse
import mysql.connector
import json
from automated_schools_outreach_system import config, check_scraped, store_emails

class EmailScraper(scrapy.Spider):
    name = 'email_scraper'
    
    # CALL:
    # cd to spiders
    # scrapy crawl email_scraper -a max_depth=1 (any int or whole float)

    def __init__(self, max_depth=2, *args, **kwargs):

        super().__init__(*args, **kwargs)

        self.start_urls = self.read_urls()
        self.visited_urls = set()
        self.max_depth = int(max_depth)
        self.basedomains = [urlparse(url).netloc for url in self.start_urls]
        self.keywebsites = ['directory','activities','music','handbook']
        self.keywords = ['admin@','music@','band@','choir@','deansoffice@','dean@',]
        self.blacklist_keywords = ['news','archive','transport','sports','publication']
        self.completed_domains = set()

        self.db_connection = mysql.connector.connect(
                **config.DATABASE_CONFIG
            )
        

    #check_scraped can be found in ASOS folder
    def read_urls(self):
        return(
            check_scraped.get_unparsed(self.db_connection)
        )


    def start_requests(self):

        for url in self.start_urls:
            yield scrapy.Request(url,
                callback=self.parse,
                meta={
                    'depth': 0,
                    'base_url': url
                    }) 


    def parse(self, response):

        #retrieve the current depth and then ensure that the maximum depth has not been reached / passed
        current_depth = response.meta['depth']
        if current_depth > self.max_depth:
            return #terminate thread
        
        #determine whether a good enough email has been found
        cur_domain = urlparse(response.url).netloc
        if cur_domain in self.completed_domains:
            return #terminate thread
        
        self.visited_urls.add(response.url)

        #email regex of the form {any string} + {@} + {any string} + . + {any common email tail}
        emails = re.findall(r'[a-zA-Z0-9._+-]+@[a-zA-Z0-9-]+\.(?:com|net|edu|org|biz|info|gov)', response.text, re.IGNORECASE)
        
        if emails:
            
            #needs to be the original url or will fail
            emails = store_emails.store_emails(self.db_connection, response.meta['base_url'], emails)

        for email in set(emails):

            if any(keyword in email for keyword in self.keywords):
                self.completed_domains.add(cur_domain)
                return #terminate thread if keyword match

        links = response.css('a::attr(href)').getall()

        keyword_website_matches = set()

        for link in links:
            if (word in link for word in self.keywebsites):
                keyword_website_matches.add(link)
        
        if keyword_website_matches:
            links = keyword_website_matches

        for link in links:
            absolute_url = response.urljoin(link)
            parsed_url = urlparse(absolute_url)
            if parsed_url.netloc in self.basedomains and absolute_url not in self.visited_urls:
                self.visited_urls.add(absolute_url)

                if (word not in absolute_url for word in self.blacklist_keywords):
                    #blacklist
                    yield scrapy.Request(absolute_url, callback=self.parse,
                                         meta={
                                             'depth': current_depth + 1,
                                            'base_url': response.meta['base_url']
                                            })

        
        

