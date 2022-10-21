[![Build Status](https://img.shields.io/github/workflow/status/jonakoudijs/docker-screeps/build.svg?logo=github)](https://github.com/jonakoudijs/docker-screeps/actions)
[![CodeFactor](https://www.codefactor.io/repository/github/jonakoudijs/docker-screeps/badge)](https://www.codefactor.io/repository/github/jonakoudijs/docker-screeps)
[![Docker Pulls](https://img.shields.io/docker/pulls/jonakoudijs/screeps.svg)](https://hub.docker.com/r/jonakoudijs/screeps)
[![Image Size](https://img.shields.io/docker/image-size/jonakoudijs/screeps/latest.svg)](https://hub.docker.com/r/jonakoudijs/screeps)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

# Screeps server Docker Image

Screeps server on Ubuntu. Some manual steps might be required when starting the
server for the first time. Besides the application container (Node.js) containing
the Screeps server code, Screeps requires MongoDB and Redis.

For quick setup you can use the `docker-compose` file included in this repo. See
the **Usage** block for more information on the manual steps and Docker compose.

## Tags

* [`latest`](Dockerfile)

## Usage

### Run with default configuration
```shell
docker run --name screeps -d \
  -p 8080:8080/tcp -p 8080:8080/udp \
  jonakoudijs/screeps:latest
```
### Run via compose with MongoDB and Redis containers
```shell
docker compose up -d
```
### Run interactively for debugging
```shell
docker run -it --entrypoint="" \
  jonakoudijs/screeps:latest /bin/bash
```

## Configuration

The configuration of the server can be done in the [`server.cfg`](config/server.cfg)
file. The settings can be overwritten by copying a custom version to
`/data/config/server.cfg` or changing the config file and rebuilding the image.

## Sources

* [https://github.com/screeps/screeps](https://github.com/screeps/screeps)
* [https://docs.screeps.com/community-servers.html](https://docs.screeps.com/community-servers.html)

## License

[MIT license](LICENSE)
