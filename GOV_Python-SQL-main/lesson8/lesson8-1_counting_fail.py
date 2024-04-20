import streamlit as st

#變數值一直被消滅，+1會失敗
st.title("計數器")
count = 0
increment = st.button("+1",key="plus1")
if increment:
    count +=1

st.write("計數器",count)
