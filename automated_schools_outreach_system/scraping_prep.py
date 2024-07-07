#scraping_prep.py

import pandas as pd
import random

def array_of_schools(db_connection, state_name):
    state_query = "SELECT * FROM search_engine_prep WHERE STATENAME = %s"
    state_df = pd.read_sql(state_query, db_connection, params=(state_name,))
    
    school_array = []
    try:
        for index, row in state_df.iterrows():
            id_school_pair = []
            id_school_pair.append(str(row.iloc[0]))
            
            initial_string = f"{str(row.iloc[1])} website"
            rest_of_string = " ".join([str(item) for item in row.iloc[2:]])
            concatenated_row = f"{initial_string} {rest_of_string}"
            
            id_school_pair.append(concatenated_row)
            school_array.append(id_school_pair)
        return school_array
    
    except Exception as e:
        print(f"Error reading dataframe: {e}")
        return []
    
def array_of_remaining_schools(db_connection, state_name):
    state_query = "SELECT * FROM search_engine_test WHERE STATENAME = %s AND SCRAPED_WEBSITE_1 IS NULL"
    state_df = pd.read_sql(state_query, db_connection, params=(state_name,))
    
    school_array = []
    try:
        for index, row in state_df.iterrows():
            id_school_pair = []
            id_school_pair.append(str(row[0]))
            
            initial_string = f"{str(row[1])} website"
            rest_of_string = " ".join([str(item) for item in row[2:]])
            concatenated_row = f"{initial_string} {rest_of_string}"
            
            id_school_pair.append(concatenated_row)
            school_array.append(id_school_pair)
        return school_array
    
    except Exception as e:
        print(f"Error reading dataframe: {e}")
        return []

def array_of_schools_sample(db_connection, sample_size):
    full_school_array = array_of_schools(db_connection, 'Alabama')
    
    if sample_size > len(full_school_array):
        raise ValueError()
    
    return random.sample(full_school_array, sample_size)