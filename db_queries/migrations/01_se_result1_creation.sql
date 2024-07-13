START TRANSACTION;

CREATE TABLE search_engine_results (
    INDEX_NUMBER INT,
    SCH_NAME VARCHAR(255),
    LSTREET1 VARCHAR(255),
    LCITY VARCHAR(255),
    STATENAME VARCHAR(255),
    WEBSITE VARCHAR(255),
    SCRAPED_WEBSITE_1 VARCHAR(255),
    SCRAPED_WEBSITE_2 VARCHAR(255),
    SCRAPED_WEBSITE_3 VARCHAR(255)
);

DROP TABLE IF EXISTS search_engine_results_backup;
CREATE TABLE search_engine_results_backup LIKE search_engine_results;
INSERT INTO search_engine_results_backup SELECT * from search_engine_results;

COMMIT;

START TRANSACTION:

DROP TABLE IF EXISTS search_engine_test;
CREATE TABLE search_engine_test LIKE search_engine_results;
INSERT INTO search_engine_test SELECT * from search_engine_results;

COMMIT;