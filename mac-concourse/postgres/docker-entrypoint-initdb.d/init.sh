#!/bin/bash
echo "Copying postgresql.conf to /var/lib/postgresql/data/postgresql.conf"
cp /docker-entrypoint-initdb.d/postgresql.conf /var/lib/postgresql/data/postgresql.conf
