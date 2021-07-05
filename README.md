# Minecraft-Enigmatica2-Server
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/acearcher/mc-enigmatica2-server?link=https://hub.docker.com/r/acearcher/mc-enigmatica2-server/builds)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/acearcher/mc-enigmatica2-server?link=https://hub.docker.com/r/acearcher/mc-enigmatica2-server/builds)
![Docker Pulls](https://img.shields.io/docker/pulls/acearcher/mc-enigmatica2-server?link=https://hub.docker.com/r/acearcher/mc-enigmatica2-server)

## Install

Figure out any environment variables as described below (you can force a specific server version via the `VERSION` **_AND_** the `FILE_ID` variables, but both need to be set/correct
to work. They can be determined via the curseforge page/URL described below).

If you want to run Enigmatica 2 Expert, Expert Skyblock, or Light, change `latest` in `acearcher/mc-enigmatica2-server:latest` to `expert`, `skyblock`, or `light` for E2 Expert, E2 Expert Skyblock, or Light respectively, `latest` defaults to regular Enigmatica 2.

5GB of RAM is the official recommendation for a 5-7 player server, and is the default specified in the image. You can change this value by changing the `MAX_RAM` environment variable to the desired amount of RAM for your server. 

Then install via Docker run or Docker Compose:
### Install via Docker Run
Add any additional environment variables by adding `-e VARIABLENAME=Value` to the run command _before_ `acearcher/mc-enigmatica2-server:latest`

If you're okay with the modpack data (world, etc.) being stored in the new directory you made, create a new directory called `enigmatica2_data` **inside the directory
you run the `docker run` command before running it.** Otherwise, change `./enigmatica2_data` in `'./enigmatica2_data:/enigmatica2'` to the path to whatever directory you'd like to storethe data in (making sure it exists before starting the server) 

Modify the following command to represent/add the options you've chosen, then run: 
```
$ docker run --name enigmatica2 -e MAX_RAM=5G -d -p 25565:25565 -v "./enigmatica2_data:/enigmatica2" acearcher/mc-enigmatica2-server:latest
```


### Install via Docker Compose
in a new directory, file named `docker-compose.yml` with the following contents:
```
version: '3.3'
services:
    mc-enigmatica2-server:
        image: 'acearcher/mc-enigmatica2-server:latest'
        container_name: mc-enigmatica2-server
        environment:
            - MAX_RAM=5G
        volumes:
            - './enigmatica2_data:/enigmatica2'
        ports:
            - '25565:25565'
```
If you're okay with the modpack data (world, etc.) being stored in the new directory you made, create a new directory called `enigmatica2_data` **inside the directory
containing `docker-compose.yml`**. Otherwise, change `./enigmatica2_data` in `'./enigmatica2_data:/enigmatica2'` to the path to whatever directory you'd like to store
the data in (making sure it exists before starting the server) 

Set any additional environment variables by adding a line under the `enviroment:` header like

` - VARIABLENAME=Value`

then in the directory you created, run

`docker-compose up -d`

to start the server. 

### Troubleshooting
If it seems broken or not working, check the logs by running

`docker logs enigmatica2`

If you have an issue and/or the image is broken, please open an issue with the contents of the above command

## Environment Variables:
```
VERSION : Version of the Mod (Defaults to 1.78)
FILE_ID: FileID of the mod version, **must be the server file's ID, not the client files**, https://www.curseforge.com/minecraft/modpacks/enigmatica2/files/NNNNNNN where NNNNNNN = FILE_ID for a specific version (defaults to 3228838)
MOTD: Message of the day for the server (defaults to "Minecraft Server: Enigmatica2")
MAP: Map to use (defaults to world)
DIFFICULTY: Minecraft difficultly setting (Defaults to 1)
GAMEMODE: Minecraft gamemode (defaults to 0)
MAXPLAYERS: Max players of the server (defaults to 20)
PVP: PVP Enabled/disabled, set to true or false (defaults to true)
VIEWDISTANCE: Minecraft view distance in chunks (defaults to 10)
HARDCORE: Hardcore mode enabled/disabled, set to true or false (defaults to false)
MAX_RAM: Max ram for the server to use, set as 4G for 4 Gigabytes, 8G for 8 Gigabytes, 1024M for 1024 Megabytes, etc. (defaults to 5G)
```
