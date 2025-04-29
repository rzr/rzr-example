image?=tmp

run:
	DOCKER_BUILDKIT=1 docker build -t ${image} .
	docker image save ${image} -o ${image} # 4.4M
	du -hsc ${image}

