# Set the base image to Ubuntu
FROM node:16-buster

# File Author / Maintainer
LABEL maintainer="Jona Koudijs"

# Set environment variables
ENV TIMEZONE=Europe/Amsterdam
ENV DEBIAN_FRONTEND=noninteractive
ENV USER screeps
ENV HOME /data/screeps

################## BEGIN INSTALLATION ######################

# Create the application user
RUN adduser --disabled-password --gecos "" --home $HOME $USER

# Update and install prerequisites
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends build-essential curl git tcl \
 && rm -rf /var/lib/apt/lists/*

# Set working directory and user
WORKDIR $HOME
USER    $USER

# Setup Screeps server
RUN npm install screeps \
 && npx screeps init

# Install Screeps mods
RUN npm install \
 screepsmod-mongo \
 screepsmod-auth \
 screepsmod-tickrate \
 screepsmod-admin-utils \
 screepsmod-features

##################### INSTALLATION END #####################

# Expose the default ports
EXPOSE 8080/udp 8080/tcp

# Set default container command
ENTRYPOINT ["npx", "screeps"]
CMD ["start"]
