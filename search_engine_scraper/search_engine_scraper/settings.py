# Scrapy settings for search_engine_spider project
from dotenv import load_dotenv
import os

import logging

load_dotenv()

logging.getLogger('faker').setLevel(logging.ERROR)

BOT_NAME = "search_engine_scraper"

SPIDER_MODULES = ["search_engine_scraper.spiders"]
NEWSPIDER_MODULE = "search_engine_scraper.spiders"

SPLASH_URL = 'http://localhost:8050'

DOWNLOADER_MIDDLEWARES = {
    'scrapy_splash.SplashCookiesMiddleware': 723, # Manages cookies for Splash requests
    'scrapy_splash.SplashMiddleware': 725, # Handles the actual request and response processing for Splash
    'scrapy.downloadermiddlewares.httpcompression.HttpCompressionMiddleware': 810, # Ensure the HTTP responses are properly decompressed
    
    'search_engine_scraper.middlewares.RotatingUserAgentMiddleware': 400, # Custom midleware rotating user agents per request
    'scrapy.downloadermiddlewares.useragent.UserAgentMiddleware': None, # Turns off built in user agent middleware
    
    # 'search_engine_scraper.middlewares.RequestTimingMiddleware': 543,
    'scrapy_zyte_api.ScrapyZyteAPIDownloaderMiddleware': 543,
}

ZYTE_API_ENABLED = True
ZYTE_API_KEY = os.getenv('ZYTE_API_KEY')
ADDONS = {
    "scrapy_zyte_api.Addon": 500,
}


AUTOTHROTTLE_ENABLED = True
AUTOTHROTTLE_START_DELAY = 1.0
AUTOTHROTTLE_MAX_DELAY = 10.0

DOWNLOAD_DELAY = 0.5
RANDOMIZE_DOWNLOAD_DELAY = True

CONCURRENT_REQUESTS = 16
AUTOTHROTTLE_TARGET_CONCURRENCY = 3

EXTENSIONS = {
    'scrapy.extensions.logstats.LogStats': 500,
    'scrapy.extensions.corestats.CoreStats': 500,
}

LOG_FILE = './crawl_results/scrapy_log.txt'
LOG_LEVEL = 'ERROR'

ROBOTSTXT_OBEY = False

REQUEST_FINGERPRINTER_IMPLEMENTATION = "2.7"
TWISTED_REACTOR = "twisted.internet.asyncioreactor.AsyncioSelectorReactor"
FEED_EXPORT_ENCODING = "utf-8"


SPIDER_MIDDLEWARES = {
    'scrapy_splash.SplashDeduplicateArgsMiddleware': 100, # Supports the `cache_args` feature saving disk space by not storing duplicate Splash arguments multiple times in a disk request queue
}

DUPEFILTER_CLASS = 'scrapy_splash.SplashAwareDupeFilter'
HTTPCACHE_STORAGE = 'scrapy_splash.SplashAwareFSCacheStorage' # Custom cache storage backend

