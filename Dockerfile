# Use Navidrome as the base image
FROM deluan/navidrome:latest

# Set the working directory
WORKDIR /home/container

# Copy the custom start.sh script to the container
COPY start.sh /home/container/start.sh

# Set permissions for the start.sh script
RUN chmod +x /home/container/start.sh

# Expose the default Navidrome port
EXPOSE 4533
