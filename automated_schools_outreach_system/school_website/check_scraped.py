# Used by email_scraper to find all the links that have not yet been scraped
from automated_schools_outreach_system import config
import mysql.connector

def get_unparsed(dataset, id_floor, id_ceiling):
    try:
        connection = mysql.connector.connect(**config.DATABASE_CONFIG, auth_plugin='mysql_native_password')
        cursor = connection.cursor()
        
        #get all the links from the raw crawling results
        cursor.execute(f"SELECT SCRAPED_WEBSITE FROM {dataset} WHERE INDEX_NUMBER >= %s AND INDEX_NUMBER <= %s", (id_floor, id_ceiling))
        list_of_website_tuples = cursor.fetchall()
        master_list = [item[0] for item in list_of_website_tuples]      
        return master_list
    
    except mysql.connector.Error as error:
        print(f"Error: {error}")
        return []
    
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()
            
def get_remaining_unparsed(dataset, id_floor, id_ceiling):
    try:
        connection = mysql.connector.connect(**config.DATABASE_CONFIG, auth_plugin='mysql_native_password')
        cursor = connection.cursor()
        
        #get all the links from the raw crawling results
        cursor.execute(f"SELECT SCRAPED_WEBSITE FROM {dataset} WHERE SCRAPED_EMAILS IS NULL AND INDEX_NUMBER >= %s AND INDEX_NUMBER <= %s", (id_floor, id_ceiling))
        list_of_website_tuples = cursor.fetchall()
        master_list = [item[0] for item in list_of_website_tuples]           
        return master_list
    
    except mysql.connector.Error as error:
        print(f"Error: {error}")
        return []
    
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()
            
def get_specific_unparsed(dataset, id):
    try:
        connection = mysql.connector.connect(**config.DATABASE_CONFIG, auth_plugin='mysql_native_password')
        cursor = connection.cursor()
        
        cursor.execute(f"SELECT SCRAPED_WEBSITE FROM {dataset} WHERE INDEX_NUMBER = %s", (id,))
        list_of_website_tuples = cursor.fetchall()
        master_list = [item[0] for item in list_of_website_tuples]           
        return master_list
    
    except mysql.connector.Error as error:
        print(f"Error: {error}")
        return []
    
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()