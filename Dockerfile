# Base image for the container
FROM ubuntu:20.04

# Update package lists and install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    cowsay \
    fortune \
    netcat-traditional

# Set working directory
WORKDIR /app

# Copy the Wisecow script and response file
COPY wisecow.sh .
COPY response .

# Grant executable permissions to the script
RUN chmod +x wisecow.sh

# Expose the server port (ensure SRVPORT is set correctly)
EXPOSE 8080

# Define the default command to run
CMD ["./wisecow.sh"]
