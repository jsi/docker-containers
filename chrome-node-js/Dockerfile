FROM openjdk:11-jdk

MAINTAINER Jørgen Sivesind <jsi@enonic.com>

USER root

# Setup
RUN mkdir /data
VOLUME /data
ENV HOME=/data

# Tools
RUN apt update 

# NodeJS
RUN apt install -y nodejs
RUN curl -L https://www.npmjs.com/install.sh | sh
RUN apt clean

# Gradle
ENV GRADLE_VERSION=4.9
ENV GRADLE_HOME=/opt/gradle
RUN wget --no-check-certificate --no-cookies https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
    && ln -s /opt/gradle-${GRADLE_VERSION} /opt/gradle \
    && rm -f gradle-${GRADLE_VERSION}-bin.zip
RUN update-alternatives --install "/usr/bin/gradle" "gradle" "/opt/gradle/bin/gradle" 1 && \
    update-alternatives --set "gradle" "/opt/gradle/bin/gradle"

# Chrome
ENV CHROME_VERSION=69.0.3497.100

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt update -qqy \
  && apt -qqy install google-chrome-stable=${CHROME_VERSION}-1 \
  && rm /etc/apt/sources.list.d/google-chrome.list \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Preparing Chrome to be used by tests.
RUN ln -s /usr/bin/google-chrome-stable /usr/local/bin/chrome

# Chrome webdriver
ARG CHROME_DRIVER_VERSION="2.42"
RUN CD_VERSION=$(if [ ${CHROME_DRIVER_VERSION:-latest} = "latest" ]; then echo $(wget -qO- https://chromedriver.storage.googleapis.com/LATEST_RELEASE); else echo $CHROME_DRIVER_VERSION; fi) \
  && echo "Using chromedriver version: "$CD_VERSION \
  && wget --no-verbose -O /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/$CD_VERSION/chromedriver_linux64.zip \
  && rm -rf /opt/selenium/chromedriver \
  && unzip /tmp/chromedriver_linux64.zip -d /opt/selenium \
  && rm /tmp/chromedriver_linux64.zip \
  && mv /opt/selenium/chromedriver /opt/selenium/chromedriver-$CD_VERSION \
  && chmod 755 /opt/selenium/chromedriver-$CD_VERSION \
  && ln -fs /opt/selenium/chromedriver-$CD_VERSION /usr/local/bin/chromedriver
