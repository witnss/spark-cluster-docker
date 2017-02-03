FROM openjdk:8

RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.6.tgz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s spark-2.1.0-bin-hadoop2.6 spark
ENV SPARK_HOME /usr/local/spark
ENV PATH $SPARK_HOME/bin:$PATH

RUN rm $SPARK_HOME/conf/*
COPY ./conf/* $SPARK_HOME/conf/

WORKDIR /usr/local/spark
