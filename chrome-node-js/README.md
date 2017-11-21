## UI testing container

This image is made to include all resources necessary to run Selenium based UI tests, written with JavaScript, in Concourse.  Added software includes.
 * NodeJS (for running UI tests written in JavaScript)
 * Java8 (full JDK with javac)
 * Chromedriver (for running Selenium tests)
 * Linx client for uploading screenshots and report-files after the completion of the tests (https://github.com/andreimarcu/linx-client)

# Version history:
 * *0.5* : First attempt, based on alpeware/chrome-headless-stable
 * *0.6* : Integrated Chrome into this image, based on Ubuntu 16.04

Inspired by: [the National Library of Norway](https://github.com/nlnwa/docker-chrome-headless)
