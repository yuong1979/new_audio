#!/bin/sh

redis-server --bind 0.0.0.0 --port 6379 & python3 manage.py runserver 0.0.0.0:8000 & celery -A core worker -B -l INFO