import scrapy
from scrapy_splash import SplashRequest
from automated_schools_outreach_system import scraping_prep, db_manager, config
import os

class SearchEngineSpider(scrapy.Spider):
    name = "search_engine_spider"
    allowed_domains = ["startpage.com"]
    
    def __init__(self, *args, **kwargs):
        super().__init__()
        self.db_connection = ''
        self.dataset_target = 'setWebsiteTestLinks'
        
    def start_requests(self):
        self.db_connection = db_manager.get_db_connection(config.DATABASE_CONFIG)
        search_queries = scraping_prep.array_of_schools(self.db_connection, 'ALABAMA')
        self.db_connection.close()

        for id_query_pair in search_queries:
            id, query = id_query_pair
            url = f'https://www.startpage.com/do/search?cmd=process_search&query={query}'
            yield scrapy.Request(url,
                                 callback=self.parse,
                                 meta={'id': id},
                                 dont_filter=True)

    def parse(self, response):
        # directory = './crawl_results'
        # filename = os.path.join(directory, 'response.html')
        
        # if not os.path.exists(directory):
        #     os.makedirs(directory)
        
        # with open(filename, 'wb') as f:
        #     f.write(response.body)
            
        elements = response.css('div.result')[:3]
        id = response.meta.get('id')
        
        links = []
            
        for element in elements:
            link = element.css('span.link-text::text').get()
            if link:
                if 'http' in link:
                    link = link[link.index('http'):]
            links.append(link)
            yield {
                'id': id,
                'link': link
            }
        
        try:
            if len(links) > 0:
                db_manager.update_links_in_db(id, links, self.dataset_target)
        except Exception as err:
            self.logger.error(f"Error updating database: {err}")
        finally:
            self.db_connection.close()

            