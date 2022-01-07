FROM ubuntu:focal

RUN apt-get update

RUN apt-get install -y \
    apt-utils \
    build-essential \
    locales \
    software-properties-common \
 && add-apt-repository -y ppa:ethereum/ethereum


RUN apt update \
 && apt install 'ethereum'
 
# NODEJS is a server-side javaScript platform to create application that will interact with our Ethereum node. So we need to install NodeJS and NPM that is required to set up most of the tools and     # libraries required to develop for Ethereum.

RUN apt-get update \
 && apt-get install -y \
    python3 \
    python3-pip \
    python3-setuptools \
    nodejs \
    npm

RUN apt-get install -y \
    solc \
    libssl-dev \
    python3-dev \    
 && ln -s /usr/bin/python3 /usr/local/bin/python
     
COPY ./requirements.txt ./requirements.txt


RUN  pip3 install -r requirements.txt

RUn  myth version

RUN mkdir -p /home/mythril

WORKDIR /home/mythril

ENTRYPOINT ["/usr/local/bin/myth"]
