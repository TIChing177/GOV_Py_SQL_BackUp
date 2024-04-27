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

@st.cache_resource
def info_sarea(areaname:str):
    conn = psycopg2.connect(os.environ['postgre_password_taipei'])
    with conn:
        with conn.cursor() as cursor:
            sql = '''
                 SELECT 日期,站點資訊.站點名稱,行政區,站點地址,lat,lng,總車輛,可借,可還,活動
                FROM youbike
                JOIN 站點資訊 ON youbike.編號 = 站點資訊.站點編號
                WHERE (日期,編號) IN (
	            SELECT MAX(日期),編號
	            FROM youbike
	            GROUP BY 編號
                ) AND 行政區 = %s;
            '''
            cursor.execute(sql,(areaname,))
            return cursor.fetchall()
    conn.close()


data = [tuple1[0] for tuple1 in get_data()]
print(data)

st.radio('行政區',data,key='sarea',horizontal=True)

area = st.session_state.sarea
data = info_sarea(areaname=area)

data1 = [{'日期':item[0],'站點':item[1],'總車輛':item[6],'可借':item[7],'可還':item[8],'活動':item[9]} for item in data]
st.dataframe(data1)