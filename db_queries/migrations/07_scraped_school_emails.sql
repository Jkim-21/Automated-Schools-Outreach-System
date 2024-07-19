START TRANSACTION;

CREATE TABLE scraped_school_emails AS SELECT * FROM search_engine_results_combined;
ALTER TABLE scraped_school_emails ADD SCRAPED_EMAILS JSON;


UPDATE scraped_school_emails
SET `WEBSITE` = CASE
    WHEN `WEBSITE` LIKE 'http:%' THEN REPLACE(WEBSITE, 'http', 'https')
    ELSE WEBSITE
END;

DROP TABLE IF EXISTS scraped_school_emails_backup;
CREATE TABLE scraped_school_emails_backup LIKE scraped_school_emails;
INSERT INTO scraped_school_emails_backup SELECT * from scraped_school_emails;
COMMIT;
