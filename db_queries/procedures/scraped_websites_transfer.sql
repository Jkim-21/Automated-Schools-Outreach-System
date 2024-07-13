DELIMITER //
DROP PROCEDURE IF EXISTS SetWebsiteLinks

CREATE PROCEDURE SetWebsiteLinks(
    IN p_id INT,
    IN p_link1 TEXT,
    IN p_link2 TEXT,
    IN p_link3 TEXT
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
DROP PROCEDURE IF EXISTS SetWebsiteLinks2

CREATE PROCEDURE SetWebsiteLinks2(
    IN p_id INT,
    IN p_link1 TEXT,
    IN p_link2 TEXT,
    IN p_link3 TEXT
)

BEGIN
    UPDATE search_engine_results2
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