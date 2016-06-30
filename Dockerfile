FROM ubuntu:14.04
MAINTAINER wlu wlu@linkernetworks.com

ENV REFRESHED_AT 2016.3.1

#install openjdk
RUN apt-get update && \
    apt-get install -yqq openjdk-7-jre curl

ENV DOWNLOAD_URL="http://mirrors.hust.edu.cn/apache/kafka/0.9.0.1/kafka_2.10-0.9.0.1.tgz"

# install and unzip kafka
RUN curl -fL ${DOWNLOAD_URL} | tar zxvf - -C /usr/local

RUN apt-get remove -y curl && \
    apt-get clean

ENV KAFKA_VERSION=0.9.0.1 \
    JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
ENV PATH=${JAVA_HOME}:$PATH

WORKDIR /usr/local/kafka_2.10-0.9.0.1
