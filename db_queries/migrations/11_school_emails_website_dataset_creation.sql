
START TRANSACTION;

DROP TABLE IF EXISTS school_emails_website;
CREATE TABLE school_emails_website LIKE scraped_school_emails;
INSERT INTO school_emails_website SELECT * from scraped_school_emails;

ALTER TABLE school_emails_website
ADD COLUMN REPORT TEXT;


DROP TABLE IF EXISTS school_emails_website_backup;
CREATE TABLE school_emails_website_backup LIKE school_emails_website;
INSERT INTO school_emails_website_backup SELECT * from school_emails_website;


COMMIT;