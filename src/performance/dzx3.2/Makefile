name=$(shell pwd | perl -lne 'print "openrasp/$$1:$$2" if /([^\/]+)\/([^\/]+)$$/')
deps=../../base/$(shell head -1 Dockerfile | sed 's~FROM openrasp/~~; s~:~~')

default: build run

build:
	$(MAKE) -C $(deps) build
	docker build -t $(name) .

run: build
	ifdef CONTAINER_NAME
	docker run --name=CONTAINER_NAME --cap-add=SYS_PTRACE --rm -i -t -d -p 8787:80 $(name)
	endif