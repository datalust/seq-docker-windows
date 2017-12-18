# Seq Dockerfiles

Dockerfiles to assist with the deployment of [Seq](https://getseq.net).

**Status:** this repository is work-in-progress and should not be used for mission-critical deployments.

### Building

Images built from these dockerfiles will be published under the `/datalust` organization on Docker Hub (TBD).

To build an image:

```shell
cd ./seq-windows
docker build -t seq-windows --build-arg SEQ_VERSION=4.1.17 .
```

### Running

To run the container, the Seq EULA must be accepted by passing `ACCEPT_EULA=Y` in the environment:

```shell
docker run -p 5341:5341 -e ACCEPT_EULA=Y seq-windows
```

### Storage

By default, data will be stored in the running container. This will not survive restarts.

To use a persistent folder on the host machine instead, mount it into `C:\ProgramData\Seq`:

**Note, this currently fails, TBD.**

```shell
docker run -p 5341:5341 -e ACCEPT_EULA=Y -v C:/Users/nblumhardt/Desktop/data:C:/ProgramData/Seq seq-windows
```

### Ports and protocols

The image exposes the Seq web UI on port 5341. **HTTPS is not yet supported.**

### License

By passing the value `Y` in the `ACCEPT_EULA` environment variable, you are expressing that your use of the
Seq software running in a Docker image will be subject to the terms of the Seq End User License Agreement,
a copy of which can be viewed via the installer MSI for that Seq version.

Source code in this repository (build scripts and Dockerfiles) are licensed under the Apache 2.0 License. This
does not include the Seq installer or executable/content files that will be embedded into built Docker images.
