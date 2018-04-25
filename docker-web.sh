#!/bin/bash

is_win=$(echo $OS | grep -i "win")

docker_run="docker run --name docker-web --restart always -d -v /var/run/docker.sock:/var/run/docker.sock -p 9000:9000 uifd/ui-for-docker"

if [ $is_win ]; then
	docker-machine start
	docker-machine ssh default "$docker_run"
else
	$docker_run
fi