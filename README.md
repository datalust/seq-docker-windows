# Seq Windows Dockerfile

The `datalust/seq-windows` container is based on the `microsoft/windowsservercore` base image.

**This container is not currently suitable for production use.** While it's possible this container will be updated in the future, it's currently in an experimental state, and does not host the latest-and-greatest version of Seq. Use [the MSI](https://getseq.net/download) for Windows production workloads, or [`datalust/seq`](https://hub.docker.com/r/datalust/seq) for Linux servers.

### Running

To run the container, the Seq EULA must be accepted by passing `ACCEPT_EULA=Y` in the environment:

```shell
docker run -p 5341:5341 -e ACCEPT_EULA=Y datalust/seq-windows
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

### Building

To build the `seq-windows` image:

```shell
cd ./seq-windows
docker build -t seq-windows --build-arg SEQ_VERSION=4.1.17 .
```
