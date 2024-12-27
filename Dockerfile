FROM deluan/navidrome:latest

# Copy the custom start.sh script to the container
COPY start.sh /home/container/start.sh

# Set permissions to allow user access
RUN chmod +x /home/container/start.sh && chown container:container /home/container/start.sh

# Set the entrypoint to use the custom start.sh
ENTRYPOINT ["/home/container/start.sh"]
