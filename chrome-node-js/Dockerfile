FROM alpeware/chrome-headless-stable

MAINTAINER Jørgen Sivesind <jsi@enoic.com>

USER root

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

# Checking Chrome
RUN ln -s /usr/bin/google-chrome-stable /usr/local/bin/chrome
#RUN chrome --version

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
  && sudo ln -fs /opt/selenium/chromedriver-$CD_VERSION /usr/bin/chromedriver

# Set locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Accept Oracle license before installing java
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

# Install java
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN apt-get -y install oracle-java8-installer oracle-java8-set-default
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment
