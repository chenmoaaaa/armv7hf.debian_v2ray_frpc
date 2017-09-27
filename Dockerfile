FROM resin/armv7hf-debian
MAINTAINER Eloco <elogicocal@gmail.com>

RUN apt-get update
RUN apt-get install wget

RUN wget https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/install-release.sh
RUN sudo chmod +x install-release.sh
RUN sudo ./install-release.sh
RUN rm install-release.sh

RUN apt-get install  nano
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

run apt-get install git
run git clone https://github.com/Eloco/frp_0.13.0_linux_arm.git
run apt remove git
run apt-get autoremove
run cd frp_0.13.0_linux_arm && tar -zxvf frp_0.13.0_linux_arm.tar.gz
run cd frp_0.13.0_linux_arm && rm frp_0.13.0_linux_arm.tar.gz

copy frpc.ini /frp_0.13.0_linux_arm/frp_0.13.0_linux_arm/frpc.ini
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config.json /etc/v2ray/config.json

CMD ["/usr/bin/supervisord"]
