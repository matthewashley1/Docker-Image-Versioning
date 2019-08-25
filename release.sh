# Must run within its DIRECTORY.

set -ex

# SET THE FOLLOWING VARIABLES
# Docker hub username
USERNAME=<Docker Username>
# Image name
IMAGE=<Image name>

version=`cat VERSION`
echo "version: $version"

# Pulls info data on current image and outputs to image.json file
docker image inspect $USERNAME/$IMAGE >image.json

# Gets old version number
oldest="$(python parse.py)"
echo "OLD VERSION: $oldest"

# Run image latest build
sh build.sh

# Removes old image verion 
docker image rm $oldest

# Tags newly built image to latest and new version number
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version

# Push Latest & New version
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version