FROM openjdk:16

ENV CONTAINER_HOME=/usr/minecraft

RUN mkdir $CONTAINER_HOME
COPY ./src $CONTAINER_HOME
WORKDIR $CONTAINER_HOME

RUN mkdir /server
ENTRYPOINT ["./minecraft-start.sh"]