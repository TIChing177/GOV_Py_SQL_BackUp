import streamlit as st

# input 變數值一直被消滅，+1會失敗
#st.title("計數器")
#count = 0
#increment = st.button("+1",key="plus1")
#if increment:
    #count +=1
#st.write("計數器",count)

#存 session_state 裡面可以保存+1值
if 'count' not in st.session_state:
    st.session_state.count = 0

st.title("計數器")

increment = st.button("+1",key="plus1")
if increment:
    st.session_state.count +=1

st.write("計數器",st.session_state.count)
