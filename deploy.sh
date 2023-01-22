echo "Deploying via remote SSH"
ssh -i ssh_key "root@${SERVER_IP}" \
  "docker pull ${IMAGE_NAME}:${IMAGE_TAG} \
  && docker stop live-container \
  && docker rm live-container \
  && docker run --init -d --name live-container -p 80:3000 ${IMAGE_NAME}:${IMAGE_TAG} \
  && docker system prune -af" 

echo "Successfully deployed, hooray!"