import scrapy
from scrapy_splash import SplashRequest
from automated_schools_outreach_system import scraping_prep, db_manager, config

class SearchEngineSpider(scrapy.Spider):
    name = "search_engine_spider"
    allowed_domains = ["startpage.com"]
    
    def __init__(self, *args, **kwargs):
        super().__init__()
        self.search_queries = scraping_prep.csv_to_array_of_strings_sample("../../data/website_no_website_schools/search_engine_prep.csv", 5)
    
    def start_requests(self):
        for id_query_pair in self.search_queries:
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
        db_connection = db_manager.get_db_connection(config.DATABASE_CONFIG)
        
        if db_connection is None:
            self.logger.error("Failed to connect to database.")
            return
        
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
            db_manager.update_links_in_db(db_connection, id, links)
        except Exception as err:
            self.logger.error(f"Error updating database: {err}")
        finally:
            db_connection.close()

            