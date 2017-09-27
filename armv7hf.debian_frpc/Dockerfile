FROM resin/armv7hf-debian
MAINTAINER Eloco <elogicocal@gmail.com>

RUN apt-get update
RUN apt-get install git
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

RUN git clone https://github.com/Eloco/frp_0.13.0_linux_arm.git
RUN apt remove git
RUN cd frp_0.13.0_linux_arm && tar -zxvf frp_0.13.0_linux_arm.tar.gz
RUN cd frp_0.13.0_linux_arm && rm frp_0.13.0_linux_arm.tar.gz

RUN apt-get autoremove
RUN apt-get clean && apt-get autoclean


COPY frpc.ini /frp_0.13.0_linux_arm/frp_0.13.0_linux_arm/frpc.ini
COPY supervisord_frpc.conf /etc/supervisor/conf.d/supervisord.conf


CMD ["/usr/bin/supervisord"]
