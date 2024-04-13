#sidebar+database

import streamlit as st
from dotenv import load_dotenv
import psycopg2
import os
load_dotenv()

@st.cache_resource #增加效能
def get_names()->list:
    with psycopg2.connect(os.environ['postgre_password']) as conn:
        with conn.cursor()  as cursor:
            sql = '''
            SELECT DISTINCT 客戶名稱
            FROM 聯絡人 LEFT JOIN 客戶 ON 聯絡人.客戶id = 客戶.客戶_id
            '''
            cursor.execute(sql)
            datas:list[tuple] = cursor.fetchmany(10)
            names=[]
            for item in datas:
                names.append(item[0])
            return names

source_data = get_names()

with st.sidebar:
    option = st.selectbox(
        'Clients Name',
        get_names(),
        index=None,
        placeholder='Choose a Clinet'
        )
    st.write('當前客戶資料',option)