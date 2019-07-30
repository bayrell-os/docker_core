#!/bin/bash


# Run consul loop service register
/root/consul.sh &

if [ ! -z "$ROUTE_PREFIX" ];
then
	mkdir -p /var/www/app/web$ROUTE_PREFIX
	ln -s /var/www/app/web/assets /var/www/app/web$ROUTE_PREFIX/assets

	pushd /var/www/app
	bayrell-lang-nodejs make_symlinks
	popd
fi

rm -f /var/run/supervisor/supervisor.sock
/usr/bin/supervisord -c /etc/supervisord.conf -n
