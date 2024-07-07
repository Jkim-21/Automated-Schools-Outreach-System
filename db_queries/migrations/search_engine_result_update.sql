START TRANSACTION;

ALTER TABLE search_engine_results
ADD COLUMN LSTREET1 VARCHAR(255) AFTER SCH_NAME,
ADD COLUMN LCITY VARCHAR(255) AFTER LSTREET1;

UPDATE search_engine_results
JOIN search_engine_prep ON search_engine_results.INDEX_NUMBER = search_engine_prep.INDEX_NUMBER
SET search_engine_results.LSTREET1 = search_engine_prep.LSTREET1,
    search_engine_results.LCITY = search_engine_prep.LCITY;


COMMIT;




CREATE TABLE search_engine_results_backup LIKE search_engine_results;
INSERT INTO search_engine_results_backup SELECT * from search_engine_results;