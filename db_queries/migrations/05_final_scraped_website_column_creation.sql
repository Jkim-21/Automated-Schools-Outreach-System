START TRANSACTION;

ALTER TABLE search_engine_results2
ADD COLUMN SCRAPED_WEBSITE TEXT;

ALTER TABLE search_engine_results
ADD COLUMN SCRAPED_WEBSITE TEXT;

UPDATE search_engine_results
SET SCRAPED_WEBSITE = SCRAPED_WEBSITE_1;

# Duplicate of 04_se_combined_table_creation
DELETE FROM search_engine_results_combined;
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