FROM ubuntu:14.04
MAINTAINER wlu wlu@linkernetworks.com

ENV REFRESHED_AT 2016.3.3

#copy files
RUN mkdir -p /opt/kafka-mesos
COPY build/* /opt/kafka-mesos/

#install add mesos repo
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E56151BF && \
  	echo deb http://repos.mesosphere.io/ubuntu trusty main > /etc/apt/sources.list.d/mesosphere.list

#install jdk,mesos
RUN	apt-get update && \
	apt-get install -yq openjdk-7-jre curl libc6 mesos=0.26.0-0.2.145.ubuntu1404

ENV	KAFKA_URL="http://mirrors.hust.edu.cn/apache/kafka/0.9.0.1/kafka_2.10-0.9.0.1.tgz"

# install and untar kafka
RUN curl -fL ${KAFKA_URL} | tar zxvf - -C /opt/kafka-mesos

RUN	apt-get remove && \
	apt-get clean

ENV KAFKA_VERSION=0.9.0.1 \
	JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
ENV PATH=${JAVA_HOME}:$PATH

WORKDIR /opt/kafka-mesos

EXPOSE 7000
