set -ex
# SET THE FOLLOWING VARIABLES
# Docker hub username
USERNAME=<Docker Username>
# Image name
IMAGE=<Image name>

# Builds lastest image
docker build -t $USERNAME/$IMAGE:latest .