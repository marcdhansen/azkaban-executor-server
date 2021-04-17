FROM java:8

WORKDIR /

RUN git clone https://github.com/azkaban/azkaban.git
WORKDIR /azkaban
RUN git checkout 4.0.0
RUN bash gradlew build installDist -x test

WORKDIR /azkaban/azkaban-executor-server/build/install/azkaban-executor-server
#COPY bin ./bin/
#RUN chmod +x bin/*.sh

EXPOSE 8443 8081 5005
CMD bin/start-executor.sh
