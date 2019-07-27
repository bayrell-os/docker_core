#!/bin/bash

rm -f /var/run/supervisor/supervisor.sock
/usr/bin/supervisord -c /etc/supervisord.conf

# Run consul loop service register
#/root/consul.sh &


/bin/bash
