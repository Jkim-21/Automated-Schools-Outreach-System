CREATE DATABASE USER_INFO;
USE USER_INFO;

CREATE TABLE users (
  USER_ID VARCHAR(255) PRIMARY KEY,
  EMAIL varchar(255) UNIQUE NOT NULL,
  DISPLAY_NAME TEXT NOT NULL,
  PHOTO_URL TEXT,
  SAVED_SCHOOLS TEXT
);

DROP TABLE IF EXISTS USER_INFO.users_backup;
CREATE TABLE USER_INFO.users_backup LIKE USER_INFO.users;
INSERT INTO USER_INFO.users_backup SELECT * FROM USER_INFO.users;


DROP TABLE IF EXISTS USER_INFO.school_emails_website;
CREATE TABLE USER_INFO.school_emails_website LIKE C4C_ASOS.school_emails_website;
INSERT INTO USER_INFO.school_emails_website SELECT * FROM C4C_ASOS.school_emails_website;


DROP TABLE IF EXISTS USER_INFO.school_emails_website_backup;
CREATE TABLE USER_INFO.school_emails_website_backup LIKE C4C_ASOS.school_emails_website;
INSERT INTO USER_INFO.school_emails_website_backup SELECT * FROM C4C_ASOS.school_emails_website;


CREATE TABLE user_saved_schools (
  USER_ID VARCHAR(255),
  SCHOOL_ID INT, 
  SAVED_STATUS BOOLEAN DEFAULT TRUE,
  PRIMARY KEY (USER_ID, SCHOOL_ID),
  FOREIGN KEY (USER_ID) REFERENCES users(USER_ID),
  FOREIGN KEY (SCHOOL_ID) REFERENCES school_emails_website(INDEX_NUMBER)
  ON DELETE CASCADE
);

DROP TABLE IF EXISTS USER_INFO.user_saved_schools_backup;
CREATE TABLE USER_INFO.user_saved_schools_backup LIKE USER_INFO.user_saved_tables;
INSERT INTO USER_INFO.user_saved_schools_backup SELECT * FROM USER_INFO.user_saved_tables;


USE C4C_ASOS;