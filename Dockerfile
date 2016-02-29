FROM ubuntu:14.04
MAINTAINER wlu wlu@linkernetworks.com

#install openjdk
RUN apt-get update && \
	apt-get install -y openjdk-7-jre curl

ENV	DOWNLOAD_URL="http://mirrors.hust.edu.cn/apache/kafka/0.9.0.1/kafka_2.10-0.9.0.1.tgz"

# install and unzip kafka
RUN curl -fL ${DOWNLOAD_URL} | tar zxvf - -C /usr/local
#	mv /usr/local/kafka /usr/local/kafka

RUN apt-get remove curl && \
	apt-get clean

ENV KAFKA_VERSION=0.9.0.1 \
	JAVA_HOME=/usr/lib/jvm

#reference http://askubuntu.com/questions/175514/how-to-set-java-home-for-java

