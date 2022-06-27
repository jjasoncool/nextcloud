## REF ##
- https://hub.docker.com/_/nextcloud

## Setup ##
```
cp ./.env.template ./.env
docker-compose up -d
docker exec -it -u root nextcloud bash
usermod -aG root www-data
```

- Please create data path folders before setup.
- windows use virtualbox's sharefolder don't preinstall apps because of permission.

e.g. 
- windows(D:\nextcloud) => vm linux(/data/nextcloud) => docker(/var/www/html)
- windows(X) => vm linux(/data/mariadb) => docker(/var/lib/mysql)

