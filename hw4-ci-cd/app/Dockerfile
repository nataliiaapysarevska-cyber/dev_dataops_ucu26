FROM python:3.13-slim

WORKDIR /app

RUN groupadd -r webservice && useradd --no-log-init -r -g webservice webservice

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

USER webservice:webservice

EXPOSE 8050

CMD ["python", "hello.py"]