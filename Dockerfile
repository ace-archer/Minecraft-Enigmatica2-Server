FROM openjdk:8-jre-buster

ENV VERSION=1.77
# https://www.curseforge.com/minecraft/modpacks/enigmatica2/files/NNNNNNN where NNNNNNN = FILE_ID for this version
ENV FILE_ID=2888196 
ENV MOTD="Minecraft Server: Enigmatica2"
ENV MAP=world
ENV DIFFICULTY=1
ENV GAMEMODE=0
ENV MAXPLAYERS=20
ENV PVP=true
ENV VIEWDISTANCE=10
ENV HARDCORE=false
ENV MAX_RAM=4G

#Cut FileID into format for ForgeCDN URL
RUN export ID1=$(echo $FILE_ID | cut -c 1-4)
RUN export ID2=$(echo $FILE_ID | cut -c 5-7)
RUN export URL="https://media.forgecdn.net/files/${ID_1}/${ID_2}/Enigmatica2Server-$VERSION.zip"

RUN apt-get update && apt-get install -y wget unzip
RUN addgroup --gid 1234 minecraft
RUN adduser --disabled-password --home=/home/minecraft/enigmatica2 --uid 1234 --gid 1234 --gecos "minecraft user" minecraft

RUN mkdir /tmp/enigmatica2 && cd /tmp/enigmatica2 && \
	wget -c ${URL} -O Enigmatica2Server.zip && \
	unzip Enigmatica2Server.zip && \
	rm Enigmatica2Server.zip && \
	echo "eula=true" > eula.txt && \
	chown -R minecraft:minecraft /tmp/enigmatica2 && \
    chmod +x /tmp/enigmatica2/ServerStartLinux.sh

ADD entrypoint.sh /entrypoint.sh
RUN chown minecraft:minecraft /entrypoint.sh

WORKDIR /home/minecraft/enigmatica2
USER minecraft
EXPOSE 25565
VOLUME /home/minecraft/enigmatica2

ENTRYPOINT ["/entrypoint.sh"]
