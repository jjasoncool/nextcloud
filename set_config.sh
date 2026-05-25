#!/bin/bash

set -x

if [ ! -f .env ]
then
  export $(cat .env | xargs)
fi

docker exec -u www-data nextcloud php occ --no-warnings config:system:set allow_local_remote_servers --value=true
