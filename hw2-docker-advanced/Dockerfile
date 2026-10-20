FROM python:3.14-slim

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install --no-cache-dir -r requirements.txt

RUN groupadd -r webservice && useradd --no-log-init -r -g webservice webservice

COPY . .

USER webservice:webservice

EXPOSE 8050

ENTRYPOINT ["streamlit", "run", "main.py"]
CMD ["--server.address=0.0.0.0", "--server.port=8050"]
