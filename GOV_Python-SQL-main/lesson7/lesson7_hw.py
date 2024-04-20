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
            SELECT DISTINCT stationname
            FROM station
            '''
            cursor.execute(sql)
            datas:list[tuple] = cursor.fetchmany(1000)
            names=[]
            for item in datas:
                names.append(item[0])
            return names

source_data = get_names()

with st.sidebar:
    option = st.selectbox(
        'Station Name',
        get_names(),
        index=None,
        placeholder='Choose a station'
        )
    st.write('當前站點',option)
