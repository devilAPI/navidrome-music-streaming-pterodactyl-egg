# Use deluan/navidrome base image
FROM deluan/navidrome:latest

# Create a user and group for Navidrome
RUN groupadd -g 1000 navidrome && useradd -u 1000 -g navidrome -m -s /bin/bash navidrome

# Create necessary directories and give proper permissions
RUN mkdir -p /data/cache /data/music /data/config && chown -R navidrome:navidrome /data

# Set working directory
WORKDIR /data

# Switch to the created non-root user
USER navidrome

# Start Navidrome as the non-root user
CMD ["./navidrome"]
