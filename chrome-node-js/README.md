## UI testing container

This image is made to include all resources necessary to run Selenium based UI tests, written with JavaScript, in Concourse.  To accomplish this, the image have included the following software (for version information, see version history below):
 * Java11 (full JDK with javac, since 2.0)
 * NodeJS (for running UI tests written in JavaScript)
 * Chrome (Headless version for testing)
 * ChromeDriver
 * Gradle

Versions prior to 2.0.0 used Java8.

# Version history:
 * *0.5* : First attempt, based on alpeware/chrome-headless-stable
 * *0.6* : Integrated Chrome v62.0.3202.94 into this image, based on Ubuntu 14.04 via enonic/java8
 * *1.0* : A clean version that works for Enonic. (
 * *1.1* : Included the Chrome WebDriver, "latest" version = 2.33
 * *1.1.2* : Updated Chrome to version 63.0.3239.132, ChromeDriver = 2.35
 * *1.1.3* : Manually set ChromeDriver = 2.34, due to problems with 2.35
 * *1.2.0* : Added make to be used for testing our Applications App
 * *1.3.0* : Chrome 65.0.3325.0, ChromeDriver 2.37
 * *1.4.0* : Added gradle 4.6 after the recipe of "frekele/gradle".  Removed the Linx client, which we have not used at all.
 * *1.4.1* : Trying ChromeDriver 2.36
 * *1.5.0* : Chrome 67.0.3396.87, ChromeDriver 2.40
 * *2.0.0* : Updated JDK to Java 11. Also in this version: 
 ** Chrome 69.0.3497.100
 ** ChromeDriver 2.42
 ** Gradle 4.9
 ** Cleaned up several of the tools that used to be installed, but were not used.
 * *2.0.1* : Added npm in a separate install.
