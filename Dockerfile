# Set the base image to Ubuntu
FROM ubuntu:18.04

# File Author / Maintainer
LABEL maintainer="Jona Koudijs"

# Set environment variables
ENV TIMEZONE=Europe/Amsterdam
ENV DEBIAN_FRONTEND=noninteractive
ENV USER screeps
ENV HOME /data/screeps

################## BEGIN INSTALLATION ######################

# Update and install prerequisites
RUN apt update \
 && apt upgrade -y \
 && apt install -y --no-install-recommends \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    dirmngr \
    g++ \
    gcc \
    git \
    tcl \
    make \
    lsb-release \
 && apt clean

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash \
 && apt update \
 && apt install -y nodejs \
 && apt clean

# Create Screeps user
RUN adduser --disabled-password --gecos "" --home $HOME $USER

# Set working directory
WORKDIR $HOME

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
