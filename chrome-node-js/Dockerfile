FROM selenium/standalone-chrome

USER root

RUN apt-get update
RUN apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y git

#RUN npm install --global gulp-cli
#RUN npm install --global gulp

