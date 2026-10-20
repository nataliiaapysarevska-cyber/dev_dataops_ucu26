FROM python:3.14-slim AS build

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install --no-cache-dir --prefix=/install -r requirements.txt


FROM python:3.14-slim AS runtime

WORKDIR /app

RUN groupadd -r webservice && useradd --no-log-init -r -g webservice webservice

COPY --from=build /install /usr/local

COPY . .

USER webservice:webservice

EXPOSE 8501

ENTRYPOINT ["streamlit", "run", "main.py", "--"]

CMD ["data/ingredients.csv"]