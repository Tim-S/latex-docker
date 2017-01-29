FROM blang/latex
MAINTAINER Tim Schneider
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q
RUN apt-get install -qy biber

WORKDIR /data
VOLUME ["/data"]
