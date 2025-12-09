"""
Load Swiss Job Market dataset into MySQL database
Author: Vijai varma
Date: 29/09/2025
Purpose: Automate loading of cleaned CSV into MySQL
"""

import pandas as pd
import mysql.connector
from mysql.connector import Error

# CONFIG
DB_CONFIG = {
    "host": "localhost",
    "user": "root",    
    "password": "Root",
    "database": "swiss_jobs"
}

CSV_PATH = r"C:/Data Analyst/Swiss_Projects/Swiss-job-market-demand-analysis/data/Swiss-jobs-cleaned-final.csv"
TABLE_NAME = "jobs"

def create_table(cursor):
    """Create jobs table if it doesn't exist"""
    cursor.execute(f"""
        CREATE TABLE IF NOT EXISTS {TABLE_NAME} (
            job_id VARCHAR(50) PRIMARY KEY,
            title_en TEXT,
            company_clean VARCHAR(255),
            city VARCHAR(100),
            canton VARCHAR(10),
            remote_type VARCHAR(50),
            is_remote BOOLEAN,
            seniority_level VARCHAR(50)
        );
    """)

def load_data():
    conn = None
    cursor = None
    try:
        # Connect
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()

        # Create table
        create_table(cursor)

        # Load CSV
        df = pd.read_csv(CSV_PATH, encoding="utf-8")

        # Insert rows
        for _, row in df.iterrows():
            cursor.execute(f"""
                INSERT IGNORE INTO {TABLE_NAME}
                (job_id, title_en, company_clean, city, canton, remote_type, is_remote, seniority_level)
                VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
            """, (
                row["job_id"],
                row["title_en"],
                row["company_clean"],
                row["city"],
                row["canton"],
                row["remote_type"],
                bool(row["is_remote"]),
                row["seniority_level"]
            ))

        conn.commit()
        print(f"{len(df)} records successfully loaded into {TABLE_NAME}")

    except Error as e:
        print("Error:", e)

    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    load_data()
