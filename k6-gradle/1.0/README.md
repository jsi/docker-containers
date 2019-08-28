## k6 testing container

This image is made to include all resources necessary to run k6 performance tests in a single Docker image for use in Concourse.  K6 is a developer-centric, open source, load testing tool by Load Impact.  In order for it to be used in the cloud, the K6_CLOUD_TOKEN env variable must be passed to the container, for instance like this:
``` docker run --env K6_CLOUD_TOKEN=$K6_CLOUD_TOKEN -it sivesind/k6-gradle:1.0 bash``` 

Based on:
 * openjdk:jdk-11.0.4

Includes:
 * k6 
 * Gradle

Versions:
 * 0.5: Initial attempt with OpenJDK 11, Gradle 4.9 and k6 v0.22.1
 * 0.6: (2019-08-05): Upgrade to OpenJDK 11.0.4, Gradle 5.2.1 and k6 v0.25
 * 1.0: Gradle 5.6
