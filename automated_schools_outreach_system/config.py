#config.py

import os
from dotenv import load_dotenv

load_dotenv() 

DATABASE_CONFIG = {
    'user': os.getenv('DB_USER'),
    'password': os.getenv('PASSWORD'),
    'host': os.getenv('HOST'),
    'database': os.getenv('DB_NAME')
}