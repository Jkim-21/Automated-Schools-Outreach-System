import mysql.connector

def get_db_connection(config):
    try: 
        conn = mysql.connector.connect(**config)
        return conn
    except mysql.connector.Error as err:
        return None
    
def update_links_in_db(conn, id, links):
    try:
        cursor = conn.cursor()
        cursor.callproc('SetWebsiteTestLinks', (id, *links))
        conn.commit()
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()