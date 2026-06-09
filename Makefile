include ../../.env.template
CONTAINER_NAME := unofficial-ciphermail
TAG := $(REGISTRY_FOLDER)/$(CONTAINER_NAME)
VERSION := $(IMAGE_VERSION_CIPHERMAIL)

build:
	docker build . -t "$(REMOTE_REGISTRY)/$(TAG):$(VERSION)" -t "$(REMOTE_REGISTRY)/$(TAG):latest"

push:
	docker push "$(REMOTE_REGISTRY)/$(TAG):$(VERSION)"
	docker push "$(REMOTE_REGISTRY)/$(TAG):latest"

all:
	docker exec -it $(CONTAINER_NAME) /bin/sh
bash:
	docker exec -it $(CONTAINER_NAME) /bin/sh
