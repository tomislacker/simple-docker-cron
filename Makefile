CONTAINER_REPO := btomasik/tse-cron
CONTAINER_TAG := testing


container:
	docker build \
		--rm \
		-t $(CONTAINER_REPO):$(CONTAINER_TAG) \
		.

enter-container: container
	docker run \
		-it \
		--entrypoint=/bin/bash \
		--rm \
		$(CONTAINER_REPO):$(CONTAINER_TAG) \
			-i

run-container: container
	docker run \
		-it \
		--rm \
		$(CONTAINER_REPO):$(CONTAINER_TAG) \
		|| true
