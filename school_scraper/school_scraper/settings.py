# Scrapy settings for school_scraper project

# For simplicity, this file contains only settings considered important or
# commonly used. You can find more settings consulting the documentation:
#     https://docs.scrapy.org/en/latest/topics/settings.html
#     https://docs.scrapy.org/en/latest/topics/downloader-middleware.html
#     https://docs.scrapy.org/en/latest/topics/spider-middleware.html

BOT_NAME = "school_scraper"

SPIDER_MODULES = ["school_scraper.spiders"]
NEWSPIDER_MODULE = "school_scraper.spiders"

ROBOTSTXT_OBEY = False

# Configure maximum concurrent requests performed by Scrapy (default: 16)
CONCURRENT_REQUESTS = 10

# Configure a delay for requests for the same website (default: 0)
# See https://docs.scrapy.org/en/latest/topics/settings.html#download-delay
# See also autothrottle settings and docs
DOWNLOAD_DELAY = 0
# The download delay setting will honor only one of:
CONCURRENT_REQUESTS_PER_DOMAIN = 10
CONCURRENT_REQUESTS_PER_IP = 100

# Enable and configure the AutoThrottle extension (disabled by default)
# See https://docs.scrapy.org/en/latest/topics/autothrottle.html
AUTOTHROTTLE_ENABLED = True
# The initial download delay
AUTOTHROTTLE_START_DELAY = 0.1
# The maximum download delay to be set in case of high latencies
AUTOTHROTTLE_MAX_DELAY = 5
# The average number of requests Scrapy should be sending in parallel to
# each remote server
AUTOTHROTTLE_TARGET_CONCURRENCY = 1.0
# Enable showing throttling stats for every response received:
AUTOTHROTTLE_DEBUG = False

# Set settings whose default value is deprecated to a future-proof value
REQUEST_FINGERPRINTER_IMPLEMENTATION = "2.7"
TWISTED_REACTOR = "twisted.internet.asyncioreactor.AsyncioSelectorReactor"
FEED_EXPORT_ENCODING = "utf-8"

# Enable JSON export
FEED_FORMAT = 'json'
FEED_URI = 'output.json'

LOG_LEVEL = 'INFO'
LOG_FILE = './scrape_results/scrapy_log.txt'

RETRY_ENABLED = False
RETRY_TIMES = 0

DOWNLOADER_MIDDLEWARES = {
    # 'scrapy_selenium.SeleniumMiddleware': 800,
    'school_scraper.middlewares.RotatingUserAgentMiddleware': 400, # Custom midleware rotating user agents per request
    'scrapy.downloadermiddlewares.useragent.UserAgentMiddleware': None, # Turns off built in user agent middleware
}

from dotenv import load_dotenv
import os
load_dotenv()

DOWNLOAD_HANDLERS = {
    'http': 'scrapy_playwright.handler.ScrapyPlaywrightDownloadHandler',
    'https': 'scrapy_playwright.handler.ScrapyPlaywrightDownloadHandler',
}

TWISTED_REACTOR = "twisted.internet.asyncioreactor.AsyncioSelectorReactor"

PLAYWRIGHT_BROWSER_TYPE = 'chromium'  # You can also use 'firefox' or 'webkit'
PLAYWRIGHT_LAUNCH_OPTIONS = {'headless': True}

HTTPCACHE_ENABLED = True
DOWNLOAD_DELAY = 2

# Enable or disable spider middlewares
# See https://docs.scrapy.org/en/latest/topics/spider-middleware.html
#SPIDER_MIDDLEWARES = {
#    "school_scraper.middlewares.NewSpiderSpiderMiddleware": 543,
#}

# Enable or disable downloader middlewares
# See https://docs.scrapy.org/en/latest/topics/downloader-middleware.html
#DOWNLOADER_MIDDLEWARES = {
#    "school_scraper.middlewares.NewSpiderDownloaderMiddleware": 543,
#}

# Configure item pipelines
# See https://docs.scrapy.org/en/latest/topics/item-pipeline.html
#ITEM_PIPELINES = {
#    "school_scraper.pipelines.NewSpiderPipeline": 300,
#}
