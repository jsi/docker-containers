FROM alpeware/chrome-headless-stable

MAINTAINER Jørgen Sivesind <jsi@enoic.com>

USER root

RUN ln -s /usr/bin/google-chrome-stable /usr/local/bin/chrome
RUN chrome --version

# NodeJS
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

#RUN apt-get install -y git

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
