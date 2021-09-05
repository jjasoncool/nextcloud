## REF ##
- https://hub.docker.com/_/nextcloud

## Setup ##
```
cp ./.env.template ./.env
docker-compose up -d
```

- if you using haproxy, add `http-request add-header X-Forwarded-Proto https` in backend

- Please create data path folders before setup.
