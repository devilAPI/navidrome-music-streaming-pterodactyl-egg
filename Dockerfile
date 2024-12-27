# Use deluan/navidrome base image
FROM deluan/navidrome:latest

# Install necessary utilities for adding users/groups
USER root
RUN apk add --no-cache shadow

# Create a user and group for Navidrome (if needed for other operations, but not switching to it)
RUN groupadd -g 1000 navidrome && useradd -u 1000 -g navidrome -m -s /bin/bash navidrome

# Set environment variable for host data directory
ARG HOST_DATA_DIR=/home/navidrome/navidrome/data

# Create necessary directories and set ownership
RUN mkdir -p ${HOST_DATA_DIR}/cache ${HOST_DATA_DIR}/music ${HOST_DATA_DIR}/config && \
    chown -R navidrome:navidrome ${HOST_DATA_DIR}

# Set working directory
WORKDIR ${HOST_DATA_DIR}

# use Pterodactyl environment variables
ENV ND_DATABASE_URL=${ND_DATABASE_URL}
ENV ND_MUSICFOLDER=${ND_MUSICFOLDER}
ENV ND_DATAFOLDER=${ND_DATAFOLDER}




# Expose port (optional, in case you need to expose a port)
EXPOSE 4533
