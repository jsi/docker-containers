FROM enonic/java8

MAINTAINER Jørgen Sivesind <jsi@enoic.com>

USER root

# Setup
EXPOSE 9222
ADD start.sh import_cert.sh /usr/bin/
RUN mkdir /data
VOLUME /data
ENV HOME=/data DEBUG_ADDRESS=0.0.0.0 DEBUG_PORT=9222

# Tools
RUN apt-get update \
    && apt-get install -y curl unzip

# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# Linx client
RUN curl -L -o /usr/local/bin/linx-client https://github.com/andreimarcu/linx-client/releases/download/v1.4.0/linx-client-v1.4_linux-amd64 \
  && chmod 755 /usr/local/bin/linx-client \
  && mkdir /data/.config
ADD linx-client.conf /data/.config/

# Chrome
RUN apt-get update -qqy \
  && apt-get -qqy install libnss3 libnss3-tools libfontconfig1 wget ca-certificates apt-transport-https inotify-tools \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

ENV CHROME_VERSION=62.0.3202.94

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update -qqy \
  && apt-get -qqy install google-chrome-stable=${CHROME_VERSION}-1 \
  && rm /etc/apt/sources.list.d/google-chrome.list \
  && sudo rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Checking Chrome
RUN ln -s /usr/bin/google-chrome-stable /usr/local/bin/chrome
RUN chrome --version
CMD ["/usr/bin/start.sh"]

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
  && ln -fs /opt/selenium/chromedriver-$CD_VERSION /usr/bin/chromedriver
