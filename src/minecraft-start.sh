#!/bin/sh

cd server

if ([ -f fabric-server-launch.jar ] && [ -f persistence.null ])
then
	java -jar fabric-server-launch.jar
else
	if ([ ! -f persistence.null ])
	then
		rm -r *
		echo !!! remove to invoke a clean install of the minecraft server !!! > persistence.null
	fi
	
	echo eula=true > eula.txt

	curl -o installer.jar https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.9.0/fabric-installer-0.9.0.jar
	java -jar installer.jar server -mcversion 1.17.1 -downloadMinecraft
	rm installer.jar

	mkdir mods
	cd mods
	curl -o fabric-api-1.17.1-0.42.1.jar https://media.forgecdn.net/files/3517/689/fabric-api-0.42.1%2B1.17.jar
	curl -o voicechat-fabric-1.17.1-2.1.6.jar https://media.forgecdn.net/files/3518/456/voicechat-fabric-1.17.1-2.1.6.jar
	
	java -jar fabric-server-launch.jar
fi
