FROM python:3.7-alpine
LABEL MAINTAINER "Canada App Developer Ltd"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /App
WORKDIR /App
COPY ./app /app

RUN adduser -D dockuser
RUN chown dockuser:dockuser -R /app/
USER dockuser
