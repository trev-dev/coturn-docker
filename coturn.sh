#! /bin/bash

if [[ ! -v KILL_FREQUENCY ]]; then
  echo "Coturn container started"
  turnserver -c /coturn/coturn.conf -X $(dig @resolver1.opendns.com ANY myip.opendns.com +short)
else
  echo "${KILL_FREQUENCY} pkill turnserver
  # Kill the server to allow docker restarts" > /coturn/coturn.cron
  crontab coturn.cron
  echo "Coturn container launched with process killer. Don't forget to set your restart condition!"
  cron -f & turnserver -c /coturn/coturn.conf -X $(dig @resolver1.opendns.com ANY myip.opendns.com +short)
fi
