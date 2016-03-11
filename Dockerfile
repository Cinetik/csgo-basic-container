FROM ubuntu:14.04
MAINTAINER Florian Meskens <florian.meskens@gmail.com>
RUN apt-get -y update &&\
	apt-get -y install lib32gcc1 curl
RUN useradd -m steam
USER steam
RUN mkdir /home/steam/steamcmd
WORKDIR /home/steam/steamcmd
RUN curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz
RUN ./steamcmd.sh \
	+login anonymous \
	+force_install_dir ../csgo \
	+app_update 740 validate \
	+quit

EXPOSE 27015

WORKDIR /home/steam/csgo
ENTRYPOINT ["./srcds_run"]
