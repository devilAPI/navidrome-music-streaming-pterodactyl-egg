# Use Navidrome as the base image
FROM deluan/navidrome:latest

# Install necessary package to create a user (for Alpine, use apk)
RUN apk update && apk add --no-cache shadow

# Create a non-root user
RUN useradd -ms /bin/bash navidromeuser

# Set the working directory
WORKDIR /home/container

# Create cache and data directories and set permissions for the user
RUN mkdir -p /home/container/cache /home/container/data /home/container/music \
    && chown -R navidromeuser:navidromeuser /home/container

# Expose the default Navidrome port
EXPOSE 4533

# Set the user for running the container
USER navidromeuser

# Set the default command to run Navidrome with arguments (this will be overridden in Pterodactyl)
#CMD ["navidrome", "--max-memory", "{{SERVER_MEMORY}}", "-port", "{{SERVER_PORT}}", "--music", "/home/container/music", "--cache", "/home/container/cache", "--data", "/home/container/data"]
