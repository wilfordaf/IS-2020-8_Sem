#!/bin/bash

echo "Waiting for database connection..."
until nc -z $DB_HOST $DB_PORT; do
	sleep 0.1
done
echo "Connected! Starting app..."

java -jar springboot-backend-0.0.1-SNAPSHOT.jar