#check_scraped.py
#used by email_scraper
#finds all the emails that have not yet been used

from automated_schools_outreach_system import config
import mysql.connector

def get_unparsed(DB):
    try:

        connection = mysql.connector.connect(DB)

        cursor = connection.cursor()

        #get all the links from the raw crawling results
        cursor.execute("SELECT WEBSITE FROM search_engine_results")
        master_list = { row[0] for row in cursor.fetchall() }

        #get all the links from the schools who's emails have already been checked
        "SELECT WEBSITE FROM with_emails"
        already_parsed_list = { row[0] for row in cursor.fetchall() }

        #create a new list of raw links that have not yet been parsed
        unparsed_links = master_list - already_parsed_list

        return list(unparsed_links)
    
    except mysql.connector.Error as error:
        
        print(f"Error: {error}")

        return
    
    finally:

        #housekeeping
        try:
            cursor.close()
            connection.close()
        except mysql.connection.Error as error:
            print(f"Error: {error}")
