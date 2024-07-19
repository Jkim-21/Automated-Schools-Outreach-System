START TRANSACTION;

WITH RankedRows AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY SCRAPED_WEBSITE ORDER BY INDEX_NUMBER) as row_num
    FROM search_engine_results_combined
)
DELETE FROM search_engine_results_combined
WHERE INDEX_NUMBER IN (
    SELECT INDEX_NUMBER
    FROM RankedRows
    WHERE row_num > 1
)

DROP TABLE IF EXISTS search_engine_results_combined_backup;
CREATE TABLE search_engine_results_combined_backup LIKE search_engine_results_combined;
INSERT INTO search_engine_results_combined_backup SELECT * from search_engine_results_combined;
COMMIT;