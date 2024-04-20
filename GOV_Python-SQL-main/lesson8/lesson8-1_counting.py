import streamlit as st

st.title("計數器")
count = 0
increment = st.button("+1")
if increment:
    count +=1

st.write("計數器",count)
