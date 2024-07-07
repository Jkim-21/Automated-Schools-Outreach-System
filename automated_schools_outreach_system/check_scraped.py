#check_scraped.py
#used by email_scraper
#finds all the emails that have not yet been used

from automated_schools_outreach_system import config
import mysql.connector

def get_unparsed():

    cursor = None
    connection = None

    try:

        connection = mysql.connector.connect(**config.DATABASE_CONFIG,auth_plugin='mysql_native_password')

        cursor = connection.cursor()

        #get all the links from the raw crawling results
        cursor.execute("SELECT WEBSITE FROM search_engine_results")
        master_list = cursor.fetchall()
        master_list = [str(item[0]) for item in master_list]


        #get all the links from the schools who's emails have already been checked

        cursor.execute("SELECT WEBSITE FROM with_emails WHERE JSON_LENGTH(emails) > 0")
        already_parsed_list = cursor.fetchall()
        already_parsed_list = [str(item[0]) for item in already_parsed_list]
                

        #create a new list of raw links that have not yet been parsed
        unparsed_links = list(set(master_list) - set(already_parsed_list))

        unparsed_links = [url if url.startswith('http://') or url.startswith('https://') else f"http://{url}" for url in unparsed_links]


        print('\n\n\n\n\n\ntry\n\n\n\n\n')



        if unparsed_links:

            print("yippee\n\n\n\n\n\nyippee")

        return unparsed_links
    
    except mysql.connector.error:

        print('\n\n\n\n\n\nexcept\n\n\n\n\n')

        print(f"Error")
        return []
    
    finally:

        #housekeeping
        if cursor:
            cursor.close()
        if connection:
            connection.close()



