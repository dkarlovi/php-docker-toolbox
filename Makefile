IMAGE=dkarlovi/php-toolbox
TAG=latest

build:
	docker build --pull -t "${IMAGE}:${TAG}" .
.PHONY=build

push:
	docker push "${IMAGE}:${TAG}"
.PHONY=exec
