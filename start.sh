#!/bin/bash
# Iniciar o LavaLink em segundo plano
java -jar /usr/src/app/Lavalink.jar &

# Iniciar o bot em Python
python /usr/src/app/main.py
