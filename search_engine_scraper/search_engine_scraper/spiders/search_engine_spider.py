import scrapy
import os

from automated_schools_outreach_system.search_engine import db_manager, scraping_prep

class SearchEngineSpider(scrapy.Spider):
    name = "search_engine_spider"
    allowed_domains = ["startpage.com"]
    
    def __init__(self, *args, **kwargs):
        super().__init__()
        self.db_connection = ''
        self.dataset_protocol = 'setWebsiteLinks2'
        self.state_names = []
        
    def start_requests(self):
        self.db_connection = db_manager.get_db_connection()
        search_queries = scraping_prep.array_of_specific_school(self.db_connection, self.state_names)
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
        # filename = os.path.join(directory, 'respo1nse.html')
        
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
                db_manager.update_links_in_db(id, links, self.dataset_protocol)
        except Exception as err:
            self.logger.error(f"Error updating database: {err}")
        finally:
            self.db_connection.close()