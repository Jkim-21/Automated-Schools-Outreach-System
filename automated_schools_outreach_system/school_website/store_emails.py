#store_emails.py
#this file not only needs to store emails but it also needs to eliminate the duplicate emails
#it will write JSONs of emails to the C4C_ASOS DB table with_emails

from automated_schools_outreach_system import config
import mysql.connector
import json

def store_emails(school_website, emails, url, dataset, dataset_protocol):
    try:        
        email_list = {email: url for email in set(emails)}
        
        # Establish connection and create cursor
        connection = mysql.connector.connect(**config.DATABASE_CONFIG)
        cursor = connection.cursor()

        # If there already are emails in the DB then pull them
        cursor.execute(f"SELECT * FROM {dataset} WHERE SCRAPED_WEBSITE = %s", (school_website,))
        # Returns the row of result and returns it as a tuple. If no more rows are available it returns `None`
        result = cursor.fetchone()
        if result[10] is not None:
            existing_emails_from_row = json.loads(result[10])
            for email, url in email_list.items():
                if email not in existing_emails_from_row:
                    existing_emails_from_row[email] = url
            # Does not allow duplicates
            complete_email_list = json.dumps(existing_emails_from_row)

            # Update the set of emails in the SCRAPED_EMAILS column 
            cursor.execute(f"UPDATE {dataset} SET SCRAPED_EMAILS = %s WHERE SCRAPED_WEBSITE = %s", (complete_email_list, school_website))
        else:
            # Insert new record with emails field set to the current unique_emails
            cursor.callproc(dataset_protocol, [json.dumps(email_list), school_website])
            
        connection.commit()
        
    except mysql.connector.Error as error:
        print(f"Error: {error}")
        return
    
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()
        return
            
            
