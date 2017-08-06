FROM ubuntu:xenial
MAINTAINER Qiang Li

ENV DEBIAN_FRONTEND noninteractive
ENV HOME=/root

RUN apt-get update && apt-get -y install apt-utils wget sudo curl

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get update && apt-get -y install \
    nodejs \
    build-essential

#Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

RUN apt-get update && apt-get -y install \
    xvfb \
    google-chrome-stable \
    default-jre

RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN rm -fr /root/tmp

RUN npm install --unsafe-perm -g protractor \
  && npm update \
  && webdriver-manager update

WORKDIR /test/

COPY test.sh /test.sh
CMD ["/test.sh"]
#
