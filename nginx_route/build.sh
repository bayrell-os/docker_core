#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_PATH=`dirname $SCRIPT`
BASE_PATH=`dirname $SCRIPT_PATH`

RETVAL=0

case "$1" in
	
	download)
		mkdir $SCRIPT_PATH/download
		pushd $SCRIPT_PATH/download
		wget https://releases.hashicorp.com/consul-template/0.20.0/consul-template_0.20.0_linux_amd64.tgz
		tar xvf consul-template_0.20.0_linux_amd64.tgz
		rm consul-template_0.20.0_linux_amd64.tgz
		popd
	;;
	
	stage0)
		docker build ./ -t bayrell/nginx_route:latest --file stages/Dockerfile0
		docker tag bayrell/nginx_route:latest 172.20.10.25/bayrell_nginx_route:latest
		cd ..
	;;
	
	final)
		docker tag bayrell/nginx_route:latest 172.20.10.25/bayrell_nginx_route:latest
		cd ..
	;;
	
	*)
		echo "Usage: $0 {download|stage0|final}"
		RETVAL=1

esac

exit $RETVAL		