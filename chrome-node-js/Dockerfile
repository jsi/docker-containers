FROM enonic/java8

MAINTAINER Jørgen Sivesind <jsi@enonic.com>

USER root

# Setup
RUN mkdir /data
VOLUME /data
ENV HOME=/data

# Tools
RUN apt-get update \
    && apt-get install -y curl zip \
    && apt-get install -y curl unzip \
    && apt-get install -y make

# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# Linx client
RUN curl -L -o /usr/local/bin/linx-client https://github.com/andreimarcu/linx-client/releases/download/v1.4.0/linx-client-v1.4_linux-amd64 \
  && chmod 755 /usr/local/bin/linx-client \
  && mkdir /data/.config
ADD linx-client.conf /data/.config/

# Chrome
ENV REV=532422

RUN apt-get update -qqy \
  && apt-get -qqy install libnss3 libnss3-tools libfontconfig1 wget ca-certificates apt-transport-https inotify-tools \
  libpangocairo-1.0-0 libx11-xcb-dev libxcomposite-dev libxcursor1 libxdamage1 libxi6 libgconf-2-4 libxtst6 libcups2-dev \
  libxss-dev libxrandr-dev libasound2-dev libatk1.0-dev libgtk-3-dev ttf-ancient-fonts chromium-codecs-ffmpeg-extra \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN wget -q -O chrome.zip https://commondatastorage.googleapis.com/chromium-browser-snapshots/Linux_x64/$REV/chrome-linux.zip \
  && unzip chrome.zip \
  && rm chrome.zip \
  && ln -s $PWD/chrome-linux/chrome /usr/local/bin/chrome

# ENV CHROME_VERSION=65.0.3322.3-1

# RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
#   && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
#   && apt-get update -qqy \
#   && apt-get -qqy install google-chrome-unstable=${CHROME_VERSION} \
#   && rm /etc/apt/sources.list.d/google-chrome.list \
#   && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Preparing Chrome to be used by tests.
# RUN ln -s /usr/bin/google-chrome-stable /usr/local/bin/chrome

# Chrome webdriver
ARG CHROME_DRIVER_VERSION="latest"
RUN CD_VERSION=$(if [ ${CHROME_DRIVER_VERSION:-latest} = "latest" ]; then echo $(wget -qO- https://chromedriver.storage.googleapis.com/LATEST_RELEASE); else echo $CHROME_DRIVER_VERSION; fi) \
  && echo "Using chromedriver version: "$CD_VERSION \
  && wget --no-verbose -O /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/$CD_VERSION/chromedriver_linux64.zip \
  && rm -rf /opt/selenium/chromedriver \
  && unzip /tmp/chromedriver_linux64.zip -d /opt/selenium \
  && rm /tmp/chromedriver_linux64.zip \
  && mv /opt/selenium/chromedriver /opt/selenium/chromedriver-$CD_VERSION \
  && chmod 755 /opt/selenium/chromedriver-$CD_VERSION \
  && ln -fs /opt/selenium/chromedriver-$CD_VERSION /usr/local/bin/chromedriver
