import mysql.connector
import logging
from automated_schools_outreach_system import config

def get_db_connection(config):
    try: 
        conn = mysql.connector.connect(**config)
        return conn
    except mysql.connector.Error as err:
        return None
    
def update_links_in_db(id, links, dataset_target):
    db_connection = get_db_connection(config.DATABASE_CONFIG)
    cursor = None
    try:
        cursor = db_connection.cursor()
        cursor.callproc(dataset_target, (id, *links))
        db_connection.commit()
    except mysql.connector.Error as err:
        logging.error(f"Error updating links for ID: {id}, Error: {err}")
        print(f"Error: {err}")
    finally:
        if cursor is not None:
            cursor.close()