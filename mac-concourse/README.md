# Enonic Concourse Server

This server sets up Concourse CI server. It consists of
the following docker containers:

* apache - Apache HTTPD server.
* web - Concourse Web Interface.
* worker - Concourse Worker.
* storage - Storage container for database.

## Building

To build all containers you can run the following command:

    docker-compose build

## Starting    

Start all containers with the following command:

    docker-compose up -d

The server is mapped to port 38080 on localhost, so go to:

    http://localhost:38080
