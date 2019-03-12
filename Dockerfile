FROM debian:stretch-slim
MAINTAINER alateas

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
RUN apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install --no-install-recommends --yes \
    gnupg \
    dirmngr
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install --no-install-recommends --yes \
    telnet \
    mongodb-org-shell \
    mongodb-org-tools \
    mutt

RUN echo "Europe/Moscow" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

CMD ["/usr/bin/bash"]
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6