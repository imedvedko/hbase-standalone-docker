FROM openjdk:8-jre-slim

ARG HBASE_VERSION=2.0.1

ADD http://archive.apache.org/dist/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz /tmp
RUN tar -xvf /tmp/hbase-${HBASE_VERSION}-bin.tar.gz --directory=/opt
RUN mv /opt/hbase-${HBASE_VERSION} /opt/hbase
ADD hbase-site.xml /opt/hbase/conf/hbase-site.xml

# Folders for data
RUN mkdir -p /data/hbase
RUN mkdir -p /data/zookeeper

ENV PATH=$PATH:/opt/hbase/bin

CMD ["hbase", "master", "start"]