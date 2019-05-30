TAG=$1

echo "$DOCKER_HUB_PASSWORD" | docker login -u "$DOCKER_HUB_USERNAME" --password-stdin


IMAGE_TAG_PATCH=$(docker run --rm alpine/semver semver -c patch ${TAG})
IMAGE_TAG_MINOR=$(docker run --rm alpine/semver semver -c minor ${TAG})
IMAGE_TAG_MAJOR=$(docker run --rm alpine/semver semver -c major ${TAG})
docker tag "$IMAGE_NAME" "${IMAGE_NAME}:latest"
docker tag "$IMAGE_NAME" "${IMAGE_NAME}:${IMAGE_TAG_PATCH}"
docker tag "$IMAGE_NAME" "${IMAGE_NAME}:${IMAGE_TAG_MINOR}"
docker tag "$IMAGE_NAME" "${IMAGE_NAME}:${IMAGE_TAG_MAJOR}"
docker images
docker push "${IMAGE_NAME}:latest"
docker push "${IMAGE_NAME}:${IMAGE_TAG_PATCH}"
docker push "${IMAGE_NAME}:${IMAGE_TAG_MINOR}"
docker push "${IMAGE_NAME}:${IMAGE_TAG_MAJOR}"