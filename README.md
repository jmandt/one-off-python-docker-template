docker build -t ${SERVICE_NAME}:${IMAGE_TAG} .

docker run -e ENVIRONMENT=local_docker \
           --network="host" \
           -it -t ${SERVICE_NAME}:${IMAGE_TAG} 
