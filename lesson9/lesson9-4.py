import psycopg2
import os
import streamlit as st
from dotenv import load_dotenv
load_dotenv()

@st.cache_resource
def get_data()->tuple:
    conn = psycopg2.connect(os.environ['postgre_password_taipei'])
    with conn:
        with conn.cursor() as cursor:
            sql = '''
                SELECT 行政區
                FROM 站點資訊
                GROUP BY 行政區
            '''
            cursor.execute(sql)
            allData:tuple = cursor.fetchall()
            return allData
    conn.close()

data = [tuple1[0] for tuple1 in get_data()]
print(data)

st.radio('行政區',data,key='sarea',horizontal=True)