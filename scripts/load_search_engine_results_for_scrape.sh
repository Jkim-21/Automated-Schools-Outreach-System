#!/bin/bash

read -r -p "Enter the directory path to your data: " DIR_PATH
read -r -p "Enter the database name: " DATABASE_NAME
read -r -p "Enter your MySQL username: " SQL_USERNAME

echo "ENTER your MySQL password: "
read -r -s SQL_PASSWORD

mysql --local-infile=1 -u "$SQL_USERNAME" -p"$SQL_PASSWORD" -e \
"CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};
USE ${DATABASE_NAME};
CREATE TABLE IF NOT EXISTS search_engine_results (
    INDEX_NUMBER INT,
    STATENAME VARCHAR(255),
    SCH_NAME VARCHAR(255),
    WEBSITE VARCHAR(255)
);
SET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE '${DIR_PATH}'
INTO TABLE search_engine_results
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(INDEX_NUMBER, STATENAME, SCH_NAME, WEBSITE);
"
