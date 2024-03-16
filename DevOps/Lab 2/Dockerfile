FROM python:3.9-alpine

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk update && apk add --no-cache bash && rm -rf /var/cache/apk/*
RUN python -m pip install --upgrade pip

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY example example

COPY entrypoint.sh .
RUN chmod +x /app/entrypoint.sh

RUN adduser -D django
USER django

EXPOSE 8000
ENTRYPOINT ["/app/entrypoint.sh"]