DELIMITER //

CREATE PROCEDURE SetWebsiteLinks(
    IN p_id INT,
    IN p_link1 VARCHAR(255),
    IN p_link2 VARCHAR(255),
    IN p_link3 VARCHAR(255)
)

BEGIN
    UPDATE search_engine_results
    SET SCRAPED_WEBSITE_1 = p_link1, 
        SCRAPED_WEBSITE_2 = p_link2, 
        SCRAPED_WEBSITE_3 = p_link3
    WHERE INDEX_NUMBER = p_id;
END //
DELIMITER;


DELIMITER //
CREATE PROCEDURE SetWebsiteTestLinks(
    IN p_id INT,
    IN p_link1 VARCHAR(255),
    IN p_link2 VARCHAR(255),
    IN p_link3 VARCHAR(255)
)

BEGIN
    UPDATE search_engine_test
    SET SCRAPED_WEBSITE_1 = p_link1, 
        SCRAPED_WEBSITE_2 = p_link2, 
        SCRAPED_WEBSITE_3 = p_link3
    WHERE INDEX_NUMBER = p_id;
END //
DELIMITER;