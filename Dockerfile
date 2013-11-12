FROM base
MAINTAINER Juan Patten (jr@juanpatten.com)

RUN echo "deb http://archive.ubuntu.com/ubuntu quantal main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-6-jre wget
ENV JAVA_HOME /usr/lib/jvm/java-6-openjdk-amd64
RUN (cd /tmp && wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.1.tar.gz -O pkg.tar.gz && tar zxf pkg.tar.gz && mv elasticsearch-* /opt/elasticsearch)

ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

RUN rm -rf /tmp/*

EXPOSE 9200:9200
EXPOSE 9300:9300

CMD ["/usr/local/bin/run"]
