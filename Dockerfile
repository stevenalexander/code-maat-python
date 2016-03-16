# Base docker image
FROM pandeiro/oracle-jdk8
MAINTAINER Peter Norrhall <peter.norrhall@movlin.se>

ENV LEIN_ROOT true

RUN wget -q -O /usr/bin/lein \
    https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
    && chmod +x /usr/bin/lein

RUN apt-get install -y git 

RUN mkdir /app
WORKDIR /app

RUN git clone https://github.com/adamtornhill/code-maat.git
WORKDIR code-maat

RUN /usr/bin/lein uberjar

WORKDIR target

ENTRYPOINT ["java","-jar","code-maat-0.9.2-SNAPSHOT-standalone.jar"]
CMD ["-h"]
    