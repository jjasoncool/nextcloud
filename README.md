## REF ##
- https://hub.docker.com/_/nextcloud

## Setup ##
```
cp ./.env.template ./.env
docker-compose up -d
```
### init ###
- Please create data path folders before setup.
- windows use virtualbox's sharefolder don't preinstall apps in folder because of permission.

### update ###
- Please backup database(/data/mariadb) before update container
- Please reboot vm after `docker-compose down` (mount folder issue)
- VM's shareFolder mount to host always display `drwxrwx---. 1 root vboxsf`

e.g.
- windows(D:\nextcloud) => vm linux(/data/nextcloud) => docker(/var/www/html)
- windows(X) => vm linux(/data/mariadb) => docker(/var/lib/mysql)
