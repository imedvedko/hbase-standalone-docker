FROM openjdk:8-jre-slim

ARG HBASE_VERSION=2.0.1
ARG HBASE_FILE=hbase-${HBASE_VERSION}-bin.tar.gz

ADD http://archive.apache.org/dist/hbase/${HBASE_VERSION}/${HBASE_FILE} /tmp
RUN mkdir /tmp/hbase \
    && tar -xvf /tmp/${HBASE_FILE} --directory=/tmp/hbase \
    && rm /tmp/${HBASE_FILE} \
    && mv /tmp/hbase/hbase-${HBASE_VERSION} /opt/hbase \
    && rm -r /tmp/hbase

ADD hbase-site.xml /opt/hbase/conf/hbase-site.xml

# Folders for data
RUN mkdir -p /data/hbase /data/zookeeper

ENV PATH=$PATH:/opt/hbase/bin

CMD ["hbase", "master", "start"]