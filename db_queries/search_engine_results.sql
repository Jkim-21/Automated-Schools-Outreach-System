START TRANSACTION:

DROP TABLE IF EXISTS search_engine_results;

CREATE TABLE search_engine_results (
    INDEX_NUMBER INT,
    STATENAME VARCHAR(255),
    SCH_NAME VARCHAR(255),
    WEBSITE VARCHAR(255),
    SCRAPED_WEBSITE_1 VARCHAR(255),
    SCRAPED_WEBSITE_2 VARCHAR(255),
    SCRAPED_WEBSITE_3 VARCHAR(255)
);
DROP TABLE IF EXISTS search_engine_test;
CREATE TABLE search_engine_test LIKE search_engine_results;
INSERT INTO search_engine_test SELECT * from search_engine_results;

COMMIT; 