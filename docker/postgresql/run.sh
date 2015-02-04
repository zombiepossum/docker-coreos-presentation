#!/bin/sh

echo "Starting docker.....\n"
boot2docker up

echo "\nStarting joeServerDb docker instance\nType following command to connnect to db"
echo "psql -h localhost -p 5432 -d joe -U joe_dev --password\n\n"


docker start joeServerDb
