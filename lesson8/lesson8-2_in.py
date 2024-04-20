import streamlit as st

#建立初始化的 session_state 的 key
if 'a1' not in st.session_state:
    st.session_state['a1'] = 100
if 'a2' not in st.session_state:
    st.session_state['a2'] = 200
if 'a3' not in st.session_state:
    st.session_state['a3'] = 300

st.write(st.session_state)