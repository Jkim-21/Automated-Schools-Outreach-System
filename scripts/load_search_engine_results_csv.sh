#!/bin/bash

read -r -p "Enter the directory path to your data: " DIR_PATH
read -r -p "Enter the database name: " DATABASE_NAME
read -r -p "Enter your MySQL username: " SQL_USERNAME

echo "ENTER your MySQL password: "
read -r -s SQL_PASSWORD

mysql --local-infile=1 -u "$SQL_USERNAME" -p"$SQL_PASSWORD" -e\
"USE ${DATABASE_NAME};
LOAD DATA LOCAL INFILE '${DIR_PATH}'
INTO TABLE search_engine_results
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(INDEX_NUMBER, STATENAME, SCH_NAME, WEBSITE);
"