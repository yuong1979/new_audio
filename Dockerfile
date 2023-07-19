#FROM python:3.10-alpine
#
#ENV PYTHONUNBUFFERED=1
#
#RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev git g++ ffmpeg
#
#WORKDIR /django_app
#
#COPY requirements.txt requirements.txt
#
#RUN pip install --upgrade pip
#
#RUN pip3 install -r requirements.txt
#
#COPY . .
#
#EXPOSE 8000
#
#CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

FROM        ubuntu:20.04

WORKDIR /app
COPY . .

ENV PYTHONUNBUFFERED=1
ARG DEBUG=1
ARG DJANGO_ALLOWED_HOSTS=localhost,127.0.0.1,[::1]
ARG CELERY_BROKER=redis://127.0.0.1:6379/0
ARG CELERY_BACKEND=redis://127.0.0.1:6379/0

ENV CELERY_BROKER=$CELERY_BROKER
ENV CELERY_BACKEND=$CELERY_BACKEND


#RUN apt update && apt install -y redis-server python3-pip python3-dev musl-dev git g++ ffmpeg postgresql-server-dev-all gcc
RUN apt update && apt install -y redis-server python3-pip
EXPOSE 6379

RUN pip3 install -r requirements.txt
EXPOSE 8000

ENTRYPOINT ["/bin/sh", "-c", "./entrypoint.sh"]

