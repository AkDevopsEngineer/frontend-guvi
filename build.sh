#!/bin/sh

IMAGE_NAME="ajithaws02/frontend-guvi-$1"
DATE=`date +%Y.%m.%d.%H.%M`
IMAGE_TAG=$DATE 

echo "Remove Exisiting none tag images"
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

echo "Remove All Exisitng Images"
docker rmi -f $(docker images -aq)

echo "Building Docker image ${IMAGE_NAME}:${IMAGE_TAG}, and tagging as latest"

docker build -t "${IMAGE_NAME}:${IMAGE_TAG}" .

echo 'Build image Present.'
docker images -q ${IMAGE_NAME}:${IMAGE_TAG}

echo "Authenticating and pushing image to Docker Hub"
docker login -u "ajithaws02" -p "Welcomeajith@1997" docker.io
docker push "${IMAGE_NAME}:${IMAGE_TAG}"
sleep 20