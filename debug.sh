#!/bin/bash

# Exit if something fails
set -e

# Ensure virtual environment exists
if [ ! -d ".venv" ]; then
    echo "Virtual environment not found. Run install.sh first."
    exit 1
fi

# Install to the correct location
mkdir -p ~/.local/share/krunner/dbusplugins/
mkdir -p ~/.local/share/dbus-1/services/
cp plasma-runner-KRunnerSpotify.desktop ~/.local/share/krunner/dbusplugins/
sed -e "s|%{PROJECTDIR}|${PWD}|g" "org.kde.KRunnerSpotify.service" > ~/.local/share/dbus-1/services/org.kde.KRunnerSpotify.service

if systemctl --user is-active dbus-broker.service &>/dev/null; then
    systemctl --user reload dbus-broker.service
fi

# Kill existing processes
echo "Stopping existing KRunner and plugin processes..."
pkill -9 -f KRunnerSpotify.py 2>/dev/null || true
kquitapp6 krunner 2>/dev/null || true
sleep 1

# Run in debug mode with virtual environment
echo "Starting KRunner Spotify in debug mode..."
echo "Press Ctrl+C to stop."
source .venv/bin/activate
python3 src/KRunnerSpotify.py