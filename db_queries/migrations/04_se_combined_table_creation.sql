START TRANSACTION;

DELETE FROM search_engine_results_combined;

CREATE TABLE search_engine_results_combined (
    INDEX_NUMBER INT,
    SCH_NAME VARCHAR(255),
    LSTREET1 VARCHAR(255),
    LCITY VARCHAR(255),
    STATENAME VARCHAR(255),
    WEBSITE VARCHAR(255),
    SCRAPED_WEBSITE_1 TEXT,
    SCRAPED_WEBSITE_2 TEXT,
    SCRAPED_WEBSITE_3 TEXT,
    SCRAPED_WEBSITE TEXT
    );

INSERT INTO search_engine_results_combined (
    INDEX_NUMBER,
    SCH_NAME, 
    LSTREET1, 
    LCITY, 
    STATENAME, 
    WEBSITE, 
    SCRAPED_WEBSITE_1, 
    SCRAPED_WEBSITE_2, 
    SCRAPED_WEBSITE_3,
    SCRAPED_WEBSITE)
SELECT * FROM search_engine_results
UNION ALL
SELECT * FROM search_engine_results2
ORDER BY INDEX_NUMBER;

DROP TABLE IF EXISTS search_engine_results_combined_backup;
CREATE TABLE search_engine_results_combined_backup LIKE search_engine_results_combined;
INSERT INTO search_engine_results_combined_backup SELECT * from search_engine_results_combined;

COMMIT;
