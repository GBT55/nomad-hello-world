# Hello World Server

This is a light-weight and simple docker image that runs a simple file
server and returns the MESSAGE environment variable.

## Usage

To build and run:

```bash
docker buildx build . \
  --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
  --tag gbt55/nomad-hello-world \
  --push

docker run -p 8008:8008 --env MESSAGE="¡Hola Mundo!" gbt55/nomad-hello-world
```

This image is hosted by DockerHub as [`gbt55/nomad-hello-world`](https://hub.docker.com/repository/docker/gbt55/nomad-hello-world).

## Inspiration

This repo was inspired by [crccheck/docker-hello-world](https://github.com/crccheck/docker-hello-world).
