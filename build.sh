#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_PATH=`dirname $SCRIPT`
BASE_PATH=`dirname $SCRIPT_PATH`

RETVAL=0

case "$1" in

	docker)
		docker build ./ -t bayrell/core --file stages/Dockerfile
		cd ..
	;;

	stage0)
		docker build ./ -t bayrell/core:stage0 --file stages/Dockerfile0
		cd ..
	;;

	stage1)
		docker build ./ -t bayrell/core:stage1 --file stages/Dockerfile1
		cd ..
	;;

	
	*)
		echo "Usage: $0 {docker|stage0|stage1}"
		RETVAL=1

esac

exit $RETVAL		