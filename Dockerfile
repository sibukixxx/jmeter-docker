# Use Java 8 slim JRE
FROM openjdk:8-jre-slim
MAINTAINER Yuichi Takada

# JMeter and Plugin versions
ARG JMETER_VERSION=5.3

# Install few utilities
RUN apt-get clean && \
	apt-get update && \
	apt-get -qy install \
				wget \
				telnet \
				iputils-ping \
				unzip

# Install JMeter
RUN   mkdir /jm \
      && cd /jm/ \
      && wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz \
      && tar -xzf apache-jmeter-$JMETER_VERSION.tgz \
      && rm apache-jmeter-$JMETER_VERSION.tgz

# ADD all the plugins
ADD jmeter-plugins/lib /jm/apache-jmeter-$JMETER_VERSION/lib

# ADD the sample test
ADD sample-test sample-test

# Set JMeter Home
ENV JMETER_HOME /jm/apache-jmeter-$JMETER_VERSION/

# Add JMeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH