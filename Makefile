help:
	@echo "Options"
	@echo
	@echo "build-image: docker image"

build-image:
	docker build --rm -t mportela/rconfig .