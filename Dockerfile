FROM debian:stretch-slim
MAINTAINER alateas

RUN curl https://www.mongodb.org/static/pgp/server-4.0.asc | sudo apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install --no-install-recommends --yes \
    telnet \
    mongodb-org-shell \
    mongodb-org-tools \
    mutt

RUN echo "Europe/Moscow" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

CMD ["/usr/bin/bash"]
