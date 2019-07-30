#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_PATH=`dirname $SCRIPT`
BASE_PATH=`dirname $SCRIPT_PATH`

RETVAL=0

case "$1" in
	
	stage_os_install)
		docker build ./ -t bayrell/core:stage_os_install --file stages/Dockerfile0
		cd ..
	;;

	stage_os_update)
		docker build ./ -t bayrell/core:stage_os_update --file stages/Dockerfile1
		cd ..
	;;
	
	stage_os_packages)
		docker build ./ -t bayrell/core:stage_os_packages --file stages/Dockerfile2
		cd ..
	;;
	
	stage_os_etc)
		docker build ./ -t bayrell/core:stage_os_etc --file stages/Dockerfile3
		cd ..
	;;
	
	stage_project)
		docker build ./ -t bayrell/core:stage_project --file stages/Dockerfile4
		docker tag bayrell/core:stage_project 172.20.10.25/bayrell_core:latest
		cd ..
	;;
	
	final)
		docker tag bayrell/core:stage_project 172.20.10.25/bayrell_core:latest
		cd ..
	;;
	
	*)
		echo "Usage: $0 {stage_os_install|stage_os_update|stage_os_packages|stage_os_etc|stage_project|final}"
		RETVAL=1

esac

exit $RETVAL		