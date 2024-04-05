# COATi Dockerfile
This is a dockerfile to make an image for the tool COATi (https://github.com/CartwrightLab/coati). 

This dockerfile ensures that the final image only contains the compiled COATi tool, rather than all the source code, documentation and build dependencies. 

To build, ensure you are in the DockerFile directory:

```
docker build -t <image_name> .
```

To run:

```
docker run [args] <image_name> coati [coati_args]
```

The image is pushed to dockerhub:

https://hub.docker.com/r/dlejeune/coati/tags