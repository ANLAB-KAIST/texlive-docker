.PHONY: base base-push extra extra-push push

IMAGE_NAME=anlabkaist/texlive
VERSION=2020


all: base extra

base:
	docker build -t $(IMAGE_NAME):$(VERSION)-base -f Dockerfile.base .
	docker tag $(IMAGE_NAME):$(VERSION)-base $(IMAGE_NAME):base

base-push: base
	docker push $(IMAGE_NAME):$(VERSION)-base
	docker push $(IMAGE_NAME):base

extra: base
	docker build -t $(IMAGE_NAME):$(VERSION)-extra -f Dockerfile.extra .
	docker tag $(IMAGE_NAME):$(VERSION)-extra $(IMAGE_NAME):extra

extra-push: extra
	docker push $(IMAGE_NAME):$(VERSION)-extra
	docker push $(IMAGE_NAME):extra

push: base-push extra-push
