# Use Navidrome as the base image
FROM deluan/navidrome:latest

# Set the working directory
WORKDIR /home/container

# Expose the default Navidrome port
EXPOSE 4533

# Remove any default entrypoint (optional)
# ENTRYPOINT []

# Set the default command to run Navidrome with arguments (this will be overridden in Pterodactyl)
#CMD ["navidrome --max-memory {{SERVER_MEMORY}} -port {{SERVER_PORT}} --music /home/container/music --cache /home/container/cache --data /home/container/data"]
#CMD ["navidrome --help"]
