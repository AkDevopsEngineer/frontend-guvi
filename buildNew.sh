#!/bin/sh

IMAGE_NAME="ajithaws02/frontend-guvi-dev"
DATE=`date +%Y.%m.%d.%H.%M`
IMAGE_TAG=$DATE 


echo "Remove Exisiting none tag images"
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

echo "Remove All Exisitng Images"
docker rmi -f $(docker images -aq)

echo "Building Docker image ${IMAGE_NAME}:${IMAGE_TAG}, and tagging as latest"

docker build -t "${IMAGE_NAME}:${IMAGE_TAG}" .

result=$(docker images -q $IMAGE_NAME)
if [[ -n "$result" ]]; then
  echo 'Build image Present.'
else
  echo 'No such Build image!'
fi

echo "Authenticating and pushing image to Docker Hub"

docker push "${IMAGE_NAME}:${IMAGE_TAG}"



