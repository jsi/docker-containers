#!/bin/bash

echo "Dumping concourse db"
export PGPASSWORD=$CONCOURSE_POSTGRES_PASSWORD
pg_dump -h localhost -U concourse -Fc -f /backup/concourse.psql
