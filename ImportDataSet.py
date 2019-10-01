import pandas as pd
import numpy as np
from sqlalchemy import create_engine
import pyodbc

# Import data set to the dataframe
df = pd.read_csv('EmployeeSampleDataset.csv')

# Create credentials
server = 'server-name'
database = 'database-name'
username = 'username'
password = 'password'
driver= 'ODBC Driver 17 for SQL Server'

# Create connection
connection = f'mssql+pyodbc://{username}:{password}@{server}:1433/{database}?driver={driver}'

# Create engine to connect to database
engine = create_engine(connection)

# Import dataframe to database
df.to_sql('Employee', engine, if_exists='append')