#!/bin/bash
sudo -E copy_file.sh
#Check OCTAVIA_START Env variable
if [ -z ${OCTAVIA_START+x} ]; then
  echo "ENV START_OCTAVIA is unset"
  /bin/bash
elif [ "$OCTAVIA_START" = "BOOTSTRAP" ]; then
  #if bootstrap
  octavia-db-manage upgrade head
elif [ "$OCTAVIA_START" = "START_OCTAVIA_API" ]; then
  octavia-api --config-file /etc/octavia/octavia.conf --log-file /var/log/octavia/octavia-api.log
elif [ "$OCTAVIA_START" = "START_OCTAVIA_HEALTH_MANAGER" ]; then
  octavia-health-manager --config-file /etc/octavia/octavia.conf --log-file /var/log/octavia/octavia-health-manager.log
elif [ "$OCTAVIA_START" = "START_OCTAVIA_HOUSEKEEPING" ]; then
  octavia-housekeeping --config-file /etc/octavia/octavia.conf --log-file /var/log/octavia/octavia-housekeeping.log
elif [ "$OCTAVIA_START" = "START_OCTAVIA_WORKER" ]; then
  octavia-worker --config-file /etc/octavia/octavia.conf --log-file /var/log/octavia/octavia-worker.log
else
 echo "OCTAVIA_START is set to '$OCTAVIA_START'"
fi
