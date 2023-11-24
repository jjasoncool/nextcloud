#!/bin/bash

set -x

if [ ! -f .env ]
then
  export $(cat .env | xargs)
fi

docker exec -u www-data nextcloud php occ --no-warnings app:install onlyoffice

docker exec -u www-data nextcloud php occ --no-warnings config:system:set onlyoffice DocumentServerUrl --value="/ds-vpath/"
docker exec -u www-data nextcloud php occ --no-warnings config:system:set onlyoffice DocumentServerInternalUrl --value="http://onlyoffice/"
docker exec -u www-data nextcloud php occ --no-warnings config:system:set onlyoffice StorageUrl --value="http://nginx-server/"
docker exec -u www-data nextcloud php occ --no-warnings config:system:set onlyoffice jwt_secret --value="$OFFICE_PASS"

docker exec -u www-data nextcloud php occ --no-warnings app:install drawio
docker exec -u www-data nextcloud php occ --no-warnings config:system:set drawio DrawioUrl --value="http://$HOST_DOMAIN/drawio/"

docker exec -u www-data nextcloud php occ --no-warnings config:system:set allow_local_remote_servers --value=true
