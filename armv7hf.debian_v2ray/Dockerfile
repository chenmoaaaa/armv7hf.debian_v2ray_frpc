FROM resin/armv7hf-debian
MAINTAINER Eloco <elogicocal@gmail.com>

RUN apt-get update
RUN apt-get install wget
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

RUN wget https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/install-release.sh
RUN chmod +x install-release.sh
RUN ./install-release.sh
RUN rm install-release.sh
RUN apt-get remove wget unzip
RUN apt-get autoremove
RUN apt-get clean && apt-get autoclean


COPY config.json /etc/v2ray/config.json
COPY supervisord_v2ray.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
