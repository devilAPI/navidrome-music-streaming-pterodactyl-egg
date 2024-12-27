#!/bin/bash

echo "Starting Navidrome setup..."

# Create necessary directories if they don't exist
mkdir -p /home/container/data /home/container/cache /home/container/music

# Ensure permissions are correct
chown -R root:root /home/container
chmod -R 755 /home/container

# Start Navidrome
echo "Starting Navidrome..."
exec /navidrome --data /home/container/data --cache /home/container/cache --music /home/container/music
