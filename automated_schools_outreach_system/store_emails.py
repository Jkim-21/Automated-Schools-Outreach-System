#store_emails.py
#this file not only needs to store emails but it also needs to eliminate the duplicate emails
#it will write JSONs of emails to the C4C_ASOS DB table with_emails

from automated_schools_outreach_system import config, debug
import mysql.connector
import json

def store_emails(school_website, emails, url):

    cursor = None
    connection = None

    try:

        #the emails should already be a set but this is a failsafe incase the code is changed 
        

        unique_emails = {email: url for email in set(emails)}

        #establish connection and create cursor
        connection = mysql.connector.connect(**config.DATABASE_CONFIG)
        cursor = connection.cursor()

        #If there already are emails in the DB then pull them
            #there will be emails from other threads in the entry basically every time

        cursor.execute("SELECT * FROM with_emails WHERE WEBSITE = %s",(school_website,))
        
        result = cursor.fetchone()
        #it is okay for this ^^^ to return nothing


        if result:

            debug.debug("try-if.1")

            #if there are already emails in the 
            if result[4]:
                existing_emails_from_database = json.loads(result[4])
                existing_emails_from_database.update(unique_emails)
                unique_emails = (existing_emails_from_database)

            debug.debug("try-if.2")

            #update the set of emails in the 5th column
            #add new emails and do not allow duplcates

            query = "UPDATE with_emails SET emails = %s WHERE WEBSITE = %s"
            debug.debug("try-if.3")
            cursor.execute(query, (json.dumps(unique_emails), school_website))
            
            debug.debug("try-if.end")


        else:
            
            debug.debug("try-else.1")

            # Insert new record with emails field set to the current unique_emails
            query = ("INSERT INTO with_emails (INDEX_NUMBER, STATENAME, SCH_NAME, WEBSITE, emails) "
                     "SELECT INDEX_NUMBER, STATENAME, SCH_NAME, WEBSITE, %s FROM search_engine_results "
                     "WHERE WEBSITE = %s")
            cursor.execute(query, (json.dumps(unique_emails), school_website))
            debug.debug("try-else.2")
        
        #housekeeping pt 1
        debug.debug("try-end-start")

        connection.commit()

        debug.debug("try-end-end")
        

    except mysql.connector.Error as error:

        debug.debug("except")

        print(f"Error: {error}")

        return []


    finally:
        
        #housekeeping pt 2
        if cursor:
            cursor.close()
        if connection:
            connection.close()