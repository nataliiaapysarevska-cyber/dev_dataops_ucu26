# Local AI Chatbot

A Streamlit chatbot powered by a local LLM using Docker Model Runner.

## Stack

- Python
- Streamlit
- Docker
- Docker Compose
- Docker Model Runner
- [Llama 3.2 3B](https://hub.docker.com/r/ai/llama3.2?tag=3B-Q4_K_M/)
## Run

```
docker compose up --build -d
```

Open application at:

```
http://localhost:8050
```

## Stop

```
docker compose down
```
Docker image: https://hub.docker.com/repository/docker/nataliiapysarevskaucu/local-ai-chatbot