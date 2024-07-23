START TRANSACTION;

CREATE TABLE full_school_information (
    INDEX_NUMBER INT,
    STATENAME TEXT,
    SCH_NAME TEXT,
    ST_SCHID TEXT,
    NCESSCH INT,
    MSTREET1 TEXT,
    MCITY TEXT,
    MSTATE TEXT,
    MZIP INT,
    LSTREET1 TEXT,
    LCITY TEXT,
    LSTATE TEXT,
    LZIP INT,
    PHONE TEXT,
    WEBSITE TEXT,
    SY_STATUS_TEXT TEXT,
    UPDATED_STATUS_TEXT TEXT,
    SCH_TYPE_TEXT TEXT,
    LEVEL TEXT,
    LAT DECIMAL(10, 7),
    LON DECIMAL(10, 7),
    CBSA TEXT,
    NMCBSA TEXT,
    CSA TEXT,
    NMCSA TEXT
);

ALTER TABLE full_school_information
ADD SCRAPED_WEBSITE TEXT;


DROP TABLE IF EXISTS full_school_information_backup;
CREATE TABLE full_school_information_backup LIKE full_school_information;
INSERT INTO full_school_information_backup SELECT * from full_school_information;

COMMIT;