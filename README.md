# Seq Dockerfiles

Dockerfiles to assist with the deployment of [Seq](https://getseq.net); images will eventually be available from Docker Hub. These are currently work-in-progress and not suitable for production use.

## `seq-windows`

The `seq-windows` container is based on the `microsoft/windowsservercore` base image. **This container is not currently suitable for production use.**

### Building

To build the `seq-windows` image:

```shell
cd ./seq-windows
docker build -t seq-windows --build-arg SEQ_VERSION=4.1.17 .
```

### Running

To run the container, the Seq EULA must be accepted by passing `ACCEPT_EULA=Y` in the environment:

```shell
docker run -p 5341:5341 -e ACCEPT_EULA=Y seq-windows
```

### License

By passing the value `Y` in the `ACCEPT_EULA` environment variable, you are expressing that your use of the
Seq software running in a Docker image will be subject to the terms of the Seq End User License Agreement,
a copy of which can be viewed via the installer MSI for that Seq version.

Source code in this repository (build scripts and Dockerfiles) are licensed under the Apache 2.0 License. This
does not include the Seq installer or executable/content files that will be embedded into built Docker images.

### Storage

Data will be stored in the running container. This will not survive restarts. **Persistent volume mounts are not yet supported.**

### Ports and protocols

The image exposes the Seq web UI on port 5341. **HTTPS is not yet supported.**
