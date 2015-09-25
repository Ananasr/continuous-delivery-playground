#! /bin/bash
# add 'source <pathToThisFile>/docker-util.sh' to ~/.bashrc. This makes this functions available in the current shell.
docker-remove-stopped(){
	#docker rm $(docker ps -a -q)
	docker ps -a -q | xargs docker rm
}
docker-nuke() {
	docker ps -q | xargs docker stop
	docker ps -q -a | xargs docker rm
}
docker-rmi-none() {
	docker images | grep '<none>' | \
	awk '{ print $3 }' | \
	xargs docker rmi
}
docker-go() {
	docker run --rm -t -i $@
}	
# append bash in a running container
docker-exec-bash(){
	if [ $# -lt 1 ] ; then
	  echo "Please provide a container id" 
	  echo "Usage: docker-exec-bash <containerId>"
	else
		docker exec -it $1 bash
	fi
}
# show running processes within a running container
docker-container-ps(){
	docker exec $1 ps -f
}

