FROM debian:latest
RUN apt-get update && apt-get install -y nodejs git wget build-essential python npm chromium && rm -rf /var/lib/apt/lists/*
RUN npm install npm@latest -g
RUN git clone https://github.com/wikimedia/mediawiki-services-chromium-render.git /opt/service
WORKDIR /opt/service
RUN npm install && npm dedupe
ENV HOME=/root/ LINK=g++
ENV IN_DOCKER=1
CMD npm start
