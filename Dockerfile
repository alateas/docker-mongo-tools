FROM debian:stable-slim
MAINTAINER alateas

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.4 main" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install --no-install-recommends --yes \
    telnet \
    mongodb-org-shell \
    mongodb-org-tools \
    mutt

RUN echo "Europe/Moscow" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

CMD ["/usr/bin/bash"]
