#!/bin/bash

# Exit if something fails
set -e

mkdir -p ~/.local/share/krunner/dbusplugins/
mkdir -p ~/.local/share/dbus-1/services/
mkdir -p ~/.config/KRunner-Spotify
mkdir -p ~/.local/share/pixmaps
cp icons/* ~/.local/share/pixmaps

cp KRunner-Spotify.config ~/.config/KRunner-Spotify/
cp plasma-runner-KRunnerSpotify.desktop ~/.local/share/krunner/dbusplugins/
sed -e "s|%{PROJECTDIR}|${PWD}|g" "org.kde.KRunnerSpotify.service" > ~/.local/share/dbus-1/services/org.kde.KRunnerSpotify.service

kquitapp6 krunner