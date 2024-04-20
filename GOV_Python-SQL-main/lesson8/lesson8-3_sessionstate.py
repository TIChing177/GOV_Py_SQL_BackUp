import streamlit as st

st.title('Session_state Basic')
st.write(st.session_state)

#使用 input widget
numbers:int = st.slider('value',min_value=1,max_value=10,key='myslider')
st.write('加入sidebar後的session_state',st.session_state)

col1, buff, col2 = st.columns([1, 0.2,3])
with col1:
    option_name = ['wolf','bird','ox']
    option = st.radio('choose one animal',option_name,key='radio_option')
    st.write('加入radio後的session_state',st.session_state)

with col2:
    if option == 'wolf':
        st.write(':wolf:')
    if option == 'bird':
        st.write(':bird:')
    if option == 'ox':
        st.write(':ox:')