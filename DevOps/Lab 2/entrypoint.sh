#!/bin/bash

echo "Waiting for postgres..."
while ! nc -z $DB_HOST $DB_PORT; do
    sleep 0.1
done
echo "PostgreSQL started"

python example/manage.py flush --no-input
python example/manage.py migrate

python example/manage.py runserver 0.0.0.0:8000