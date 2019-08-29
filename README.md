# Docker-Image-Versioning

Automatically builds and pushes new versions of Docker images to Docker Hub. Helps to maintain version numbers for tags on the Docker image. Will rebuild a Docker image to the latest tag and new version tag while also removing the old version image from your machine.

___

## Files

Files needed in your Project directory.

```sh
project
│   Dockerfile
│   docker-compose.yml
│   release.sh
│   parse.py
│   VERSION
```

- release.sh  > Start script file, manages the build, remove, and upload of an image.
- parse.py  > Gets image id number of old version image.
- VERSION  > Current working version number - must set yourself.

___

## Run

```sh
>$ sh release.sh
```

___

## License

Docker-Image-Versioning is released under the [MIT](https://opensource.org/licenses/MIT) license.

___
