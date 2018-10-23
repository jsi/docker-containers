## k6 testing container

This image is made to include all resources necessary to run k6 performance tests in a single Docker image for use in Concourse.  K6 is a developer-centric, open source, load testing tool by Load Impact.  In order for it to be used in the cloud, the K6_CLOUD_TOKEN env variable must be passed to the container, for instance like this:
``` docker run --env K6_CLOUD_TOKEN=$K6_CLOUD_TOKEN -it sivesind/k6-gradle:0.5 bash``` 

WARNING: This image is purely experimental.  It is only moved to Docker Hub in order to enable Concourse to access it.

 * Based on: openjdk:jdk-11 
 * Includes:
 ** k6 
 ** Gradle 4.9

Versions:
 * 0.5: Initial attempt