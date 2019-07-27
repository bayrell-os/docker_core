#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_PATH=`dirname $SCRIPT`
BASE_PATH=`dirname $SCRIPT_PATH`

RETVAL=0

case "$1" in
	
	stage0)
		docker build ./ -t bayrell/core:stage0 --file stages/Dockerfile0
		cd ..
	;;

	stage1)
		docker build ./ -t bayrell/core:stage1 --file stages/Dockerfile1
		cd ..
	;;
	
	stage2)
		docker build ./ -t bayrell/core:stage2 --file stages/Dockerfile2
		cd ..
	;;
	
	final)
		docker tag bayrell/core:stage2 172.20.10.25/bayrell_core:latest
		cd ..
	;;
	
	*)
		echo "Usage: $0 {stage0|stage1|stage2|final}"
		RETVAL=1

esac

exit $RETVAL		