# Must run within its DIRECTORY

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

# Removes image.json file after being parsed
rm image.json

# Run image latest build
sh build.sh

# Checks for an existing old version image before deleting
if [ -z "$oldest" ] || [ "$oldest" == "None" ]
then
    echo "Is equal to None"
else
    # Removes old image verion
    docker image rm $oldest
fi

# Tags newly built image to latest and new version number
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version

# Push Latest & New Version
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version