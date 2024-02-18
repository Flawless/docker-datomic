FROM eclipse-temurin:21

RUN apt-get update && apt-get install -qq unzip

ARG DATOMIC_VERSION
ENV DATOMIC_VERSION ${DATOMIC_VERSION}

RUN curl -SL https://datomic-pro-downloads.s3.amazonaws.com/$DATOMIC_VERSION/datomic-pro-$DATOMIC_VERSION.zip -o /tmp/datomic.zip \
    && unzip /tmp/datomic.zip -d /opt \
    && mv /opt/datomic-pro-$DATOMIC_VERSION /opt/datomic \
    && rm -f /tmp/datomic.zip

WORKDIR /opt/datomic/bin
