.PHONY: build.docker

BINARY        ?= sqs-exporter
VERSION       ?= $(shell git describe --tags --always --dirty)
IMAGE         ?= docker-dc-micro-release.dr.corp.adobe.com/jmal98/$(BINARY)
TAG           ?= $(VERSION)
DOCKERFILE    ?= dc.Dockerfile

default: build.docker

build.docker:
	docker build --rm -t "$(IMAGE):$(TAG)" -f $(DOCKERFILE) --build-arg VERSION=$(VERSION) .
