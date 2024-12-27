# Use deluan/navidrome base image
FROM deluan/navidrome:latest

# Install necessary utilities for adding users/groups
USER root
RUN apk add --no-cache shadow

# Create a user and group for Navidrome
RUN groupadd -g 1000 navidrome && useradd -u 1000 -g navidrome -m -s /bin/bash navidrome

# Create necessary directories and give proper permissions
RUN mkdir -p /data/cache /data/music /data/config && \
    chown -R navidrome:navidrome /data

# Set working directory
WORKDIR /data

# Set environment variables for database configuration
ENV ND_DATABASE_URL="sqlite3:///home/container/navidrome.db"

# Switch to the created non-root user
USER navidrome

# Start Navidrome as the non-root user
#CMD ["navidrome"]
