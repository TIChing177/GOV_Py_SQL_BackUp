import streamlit as st

with st.sidebar:
    st.header('PRD1')
    st.header('PRD2')

st.markdown('Department：PDD')
st.title('PRD1')
st.caption('for study')
st.header('Problems and Needs')
st.subheader('What')
st.write('What the backlog talks about? / What stakeholders want?')

st.subheader('Who are stakeholders?')

col1, col2, col3 = st.columns(3)

with col1:
   st.header("A cat")
   st.image("https://static.streamlit.io/examples/cat.jpg")

with col2:
   st.header("A dog")
   st.image("https://static.streamlit.io/examples/dog.jpg")

with col3:
   st.header("An owl")
   st.image("https://static.streamlit.io/examples/owl.jpg")

st.subheader('Status')