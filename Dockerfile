# Set the base image
FROM ubuntu:trusty
# Dockerfile author / maintainer 
MAINTAINER Lokesh <lokeshpahal2000@gmail.com> 

# Update the default application repository sources list
RUN apt-get update && apt-get -y upgrade && apt-get install -y libssl-dev libffi-dev python3-pip libmysqlclient-dev build-essential python3 python3-dev curl git libxml2 libxml2-dev libxslt1-dev libfreetype6-dev && apt-get clean

RUN pip3 install --upgrade pip
RUN apt-get install -y python-software-properties

# deps for selenium
RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y libxi6 libgconf-2-4

RUN apt-get install -y python-software-properties
# install node 6.latest
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install -y nodejs

# install ruby, gems
RUN apt-get install software-properties-common -y
RUN apt-add-repository ppa:brightbox/ruby-ng -y
RUN apt-get update
RUN apt-get install ruby2.4 ruby2.4-dev -y

# install chromedriver & xvfb (for headless chrome)
RUN apt-get install -y xvfb
RUN apt-get install -y chromium-chromedriver
RUN ln -s /usr/lib/chromium-browser/chromedriver /usr/bin/chromedriver
# RUN pip install virtualenv