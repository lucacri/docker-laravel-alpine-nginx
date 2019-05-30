TAG=$1

echo "$DOCKER_HUB_PASSWORD" | docker login -u "$DOCKER_HUB_USERNAME" --password-stdin

IMAGE_TAG_PATCH=$(/tmp/semver get patch ${TAG})
IMAGE_TAG_MINOR=$(/tmp/semver get minor ${TAG})
IMAGE_TAG_MAJOR=$(/tmp/semver get major ${TAG})

docker tag "$IMAGE_NAME" "${IMAGE_NAME}:latest" && \
docker tag "$IMAGE_NAME" "${IMAGE_NAME}:${IMAGE_TAG_PATCH}" && \
docker tag "$IMAGE_NAME" "${IMAGE_NAME}:${IMAGE_TAG_MINOR}" && \
docker tag "$IMAGE_NAME" "${IMAGE_NAME}:${IMAGE_TAG_MAJOR}"

echo "${IMAGE_NAME}:${IMAGE_TAG_PATCH}"
echo "${IMAGE_NAME}:${IMAGE_TAG_MINOR}"
echo "${IMAGE_NAME}:${IMAGE_TAG_MAJOR}"

docker images

docker push "${IMAGE_NAME}:latest"
docker push "${IMAGE_NAME}:${IMAGE_TAG_PATCH}"
docker push "${IMAGE_NAME}:${IMAGE_TAG_MINOR}"
docker push "${IMAGE_NAME}:${IMAGE_TAG_MAJOR}"