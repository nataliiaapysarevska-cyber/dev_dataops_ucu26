from openai import OpenAI
import streamlit as st
import os

MODEL_RUNNER_URL = os.getenv(
    "LLAMA_URL",
    "http://localhost:12434/engines/v1"
)

MODEL_NAME = os.getenv(
    "LLAMA_MODEL",
    "ai/llama3.2:3B-Q4_K_M"
)

client = OpenAI(
    base_url=MODEL_RUNNER_URL,
    api_key="not-needed"
)
st.title("Chatbot")

if "messages" not in st.session_state:
    st.session_state.messages = []

for message in st.session_state.messages:
    with st.chat_message(message["role"]):
        st.write(message["content"])

prompt = st.chat_input("Ask me something...")

if prompt:
    st.session_state.messages.append({
        "role": "user",
        "content": prompt
    })

    with st.chat_message("user"):
        st.write(prompt)

    response = client.chat.completions.create(
        model=MODEL_NAME,
        messages=st.session_state.messages)

    response_content = response.choices[0].message.content

    st.session_state.messages.append({
        "role": "assistant",
        "content": response_content
    })
    with st.chat_message("assistant"):
        st.write(response_content)
