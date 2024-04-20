import streamlit as st

st.title('Session_state and Call_back')

col1, buff, col2 = st.columns([2, 1, 2])

def lbs_to_kg():
    st.session_state.kg = st.session_state.lbs / 2.2046

def kg_to_lbs():
    st.session_state.lbs = st.session_state.kg * 2.2046

with col1:
    st.number_input('pounds:', key='lbs', on_change=lbs_to_kg)

with col2:
    st.number_input('kilograms', key='kg', on_change=kg_to_lbs)