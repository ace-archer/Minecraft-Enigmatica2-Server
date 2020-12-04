# Minecraft-Enigmatica2-Server

## Install

Set any enviroment variables as described below (you can force a specific server version via the `VERSION` **_AND_** the `FILE_ID` variables, but both need to be set/correct
to work. They can be determined via the curseforge page/URL described below).

If you want to run Enigmatica 2 Expert or Exper Skyblock, change `latest` in `acearcher/mc-enigmatica2-server:latest` to `expert` or `skyblock` for E2 Expert or E2 Expert Skyblock respectively, `latest` defaults to regular Enigmatica 2

Then install via Docker run or Docker Compose:
### Install via Docker Run
```
$ docker run --name enigmatica2 -e MAX_RAM=4G -d -v 25565:25565 -v "/minecraft/e2data:/enigmatica2" acearcher/mc-enigmatica2-server:latest
```

### Install via Docker Compose
create a file named `docker-compose.yml` with the contents of:
```
version: '3.3'
services:
    mc-enigmatica2-server:
        container_name: enigmatica2
        environment:
            - MAX_RAM=4G
        volumes:
            - '25565:25565'
            - '/minecraft/e2data:/enigmatica2'
        image: 'acearcher/mc-enigmatica2-server:latest'
```
Updating any enviroment as you see fit. 


## Enviorment Variables:
```
VERSION : Version of the Mod (Defaults to 1.77)
FILE_ID: FileID of the mod version, https://www.curseforge.com/minecraft/modpacks/enigmatica2/files/NNNNNNN where NNNNNNN = FILE_ID for a specific version (defaults to 2888191)
MOTD: Message of the day for the server (defaults to "Minecraft Server: Enigmatica2")
MAP: Map to use (defaults to world)
DIFFICULTY: Minecraft difficultly setting (Defaults to 1)
GAMEMODE: Minecraft gamemode (defaults to 0)
MAXPLAYERS: Max players of the server (defaults to 20)
PVP: PVP Enabled/disabled, set to true or false (defaults to true)
VIEWDISTANCE: Minecraft view distance in chunks (defaults to 10)
HARDCORE: Hardcore mode enabled/disabled, set to true or false (defaults to false)
MAX_RAM: Max ram for the server to use, set as 4G for 4 Gigabytes, 8G for 8 Gigabytes, 1024M for 1024 Megabytes, etc. (defaults to 4G)
```
