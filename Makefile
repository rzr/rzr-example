#!/usr/bin/make -f
# -*- makefile -*-
# ex: set tabstop=4 noexpandtab:
# -*- coding: utf-8 -*
#

image?=tmp

run:
	DOCKER_BUILDKIT=1 docker build -t ${image} .
	docker image save ${image} -o ${image} # 4.4M
	du -hsc ${image}

clean:
	rm -fv -- "${image}"
