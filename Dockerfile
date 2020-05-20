FROM ubuntu

# Create app directory
WORKDIR /home

RUN export TZ=US/Eastern

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git curl wget openjdk-8-jre

#NodeJS
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

#Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y google-chrome-stable

COPY ./agent.jar .

CMD ["bash"]