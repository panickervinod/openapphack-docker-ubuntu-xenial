all: build

build:
	@docker build --tag=openapphack/ubuntu-xenial:latest .

release: build
	@docker build --tag=openapphack/ubuntu-xenial:$(shell cat VERSION) .
