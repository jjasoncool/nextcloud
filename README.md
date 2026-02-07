# Nextcloud Deployment and Disaster Recovery Manual

## References
[Official Image](https://hub.docker.com/_/nextcloud)

## Deployment
```bash
cp ./.env.template ./.env
docker-compose up -d
```
### init
- Please create data path folders before setup.
- windows use virtualbox's sharefolder don't preinstall apps in folder because of permission.

- **Data separation**: Keep Nextcloud code in Docker volume and only mount `/var/www/html/data` to host for better performance and stability. 

### update
- Please backup database(/data/mariadb) before update container
- Please reboot vm after `docker-compose down` (mount folder issue)
- VM's shareFolder mount to host always display `drwxrwx---. 1 root vboxsf`

---

## Recovery Strategy

In the event of environment corruption or the need to re-link existing data, follow this standardized recovery procedure:

1. **Environment Sanitization**:
Temporarily move the contents of the Windows data directory (e.g., `D:\nextcloud`) to a backup location, ensuring the source directory is completely empty.
2. **System Initialization**:
Execute `docker-compose up -d`. Access the web interface and create a temporary administrative account (e.g., `temp_admin`). This allows Nextcloud to generate critical system files, including `.ocdata` and the `appdata_xxx` cache structure, with the correct environment signatures.
3. **Data Restoration**:
Transfer the original user data folders (e.g., `TrueUser/`) from your backup back into the Windows shared directory, which maps to `/var/www/html/data/` inside the container.


4. **Synchronization and Cleanup**:
    - Authenticate with the **original** administrative account.
    - Navigate to the User Management panel and decommission the `temp_admin` account created in Step 2.
    - Force a re-indexing of the filesystem to register the restored data by executing:

    ```bash
    docker exec -u www-data -it ${NC_NAME} php occ files:scan --all
    ```

## Mount Topographies

- **User Data**: Windows (`D:\nextcloud`) ➔ VM Linux (`/data/nextcloud/data`) ➔ Docker (`/var/www/html/data`) 

- **Database**: Windows (`No mount point`) ➔ VM Linux Local (`/data/mariadb`) ➔ Docker (`/var/lib/mysql`) 
