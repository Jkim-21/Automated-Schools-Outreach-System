DELIMITER //

CREATE PROCEDURE setEmails (
    IN p_email_list TEXT,
    IN p_school_website TEXT
)
BEGIN
    UPDATE scraped_school_emails
    SET SCRAPED_EMAILS = p_email_list
    WHERE SCRAPED_WEBSITE = p_school_website AND SCRAPED_EMAILS IS NULL;

END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE setEmailsTest (
    IN p_email_list TEXT,
    IN p_school_website TEXT
)
BEGIN
    UPDATE scraped_school_emails_backup
    SET SCRAPED_EMAILS = p_email_list
    WHERE SCRAPED_WEBSITE = p_school_website AND SCRAPED_EMAILS IS NULL;

END //
DELIMITER;