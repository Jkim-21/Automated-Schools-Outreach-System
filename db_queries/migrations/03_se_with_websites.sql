START TRANSACTION;

CREATE TABLE search_engine_results2 (
    INDEX_NUMBER INT,
    SCH_NAME VARCHAR(255),
    LSTREET1 VARCHAR(255),
    LCITY VARCHAR(255),
    STATENAME VARCHAR(255),
    WEBSITE VARCHAR(255),
    SCRAPED_WEBSITE_1 TEXT,
    SCRAPED_WEBSITE_2 TEXT,
    SCRAPED_WEBSITE_3 TEXT
);

DROP TABLE IF EXISTS search_engine_results2_backup;
CREATE TABLE search_engine_results2_backup LIKE search_engine_results2;
INSERT INTO search_engine_results2_backup SELECT * from search_engine_results2;

COMMIT;
