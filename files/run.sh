#!/bin/bash

rm -f /var/run/supervisor/supervisor.sock
/usr/bin/supervisord -c /etc/supervisord.conf

/bin/bash