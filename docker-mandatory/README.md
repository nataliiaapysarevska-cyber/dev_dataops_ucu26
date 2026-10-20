# Recipe Finder

Simple Streamlit application for finding recipes by available ingredients.

## Docker

Multi-stage build:

```bash

docker build -t recipe-finder:multistage .

docker run -p 8501:8501 recipe-finder:multistage

```
The application is available at http://localhost:8501.

## DockerHub

Docker image: [link will be added after push]