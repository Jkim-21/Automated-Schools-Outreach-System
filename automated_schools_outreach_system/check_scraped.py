#check_scraped.py
#used by email_scraper
#finds all the emails that have not yet been used

from automated_schools_outreach_system import config
import mysql.connector
from urllib.parse import urlparse

def get_unparsed():

    cursor = None
    connection = None

    try:

        connection = mysql.connector.connect(**config.DATABASE_CONFIG,auth_plugin='mysql_native_password')

        cursor = connection.cursor()

        #get all the links from the raw crawling results
        cursor.execute("SELECT WEBSITE FROM search_engine_results")
        master_list = cursor.fetchall()
        master_list = [item[0] for item in master_list]


        #get all the links from the schools who's emails have already been checked

        cursor.execute("SELECT WEBSITE FROM with_emails WHERE JSON_LENGTH(emails) > 0")
        already_parsed_list = cursor.fetchall()
        already_parsed_list = [item[0] for item in already_parsed_list]
                

        #create a new list of raw links that have not yet been parsed
        unparsed_links = list(set(master_list) - set(already_parsed_list))

        unparsed_links = [link if urlparse(link).scheme else 'http://' + link for link in unparsed_links]


        return unparsed_links
    

    
    except mysql.connector.Error as error:

        print(f"Error: {error}")
        return []
    
    finally:

        #housekeeping
        if cursor:
            cursor.close()
        if connection:
            connection.close()




