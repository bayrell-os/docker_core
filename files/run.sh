#!/bin/bash

rm -f /var/run/supervisor/supervisor.sock
/usr/bin/supervisord -c /etc/supervisord.conf


/bin/bash

# Run backend
#while [ 1 ]; do
#    echo "Ok"
#    sleep 60
#done