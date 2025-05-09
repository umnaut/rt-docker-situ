### rt-docker situated implementation
* Set DB Password in `docker-compose.yml`
* Fill out customize `var-lib-apps/rt/configs` with appropriate usernames, passwords, emails, etc
  * Update DatabasePassword in `RT_SiteConfig.pm`
  * Update MAILTO email in `crontab`
  * Fill out incoming imap info in `getmailrc`
  * Fill out outgoing smtp info in `msmtp.conf`
    * You may need to fiddle with other options in this config to get it working in your environment
    * If you end up needing a ca-bundle.crt file for this, put it in `var-lib-apps/rt/rt-data/msmtp` / `/var/lib/apps/rt/rt-data/msmtp`

  See https://github.com/firefart/rt-docker?tab=readme-ov-file#configuration for more info
* Generate a self-signed cert via `gen-cert.sh` or add service's existing `priv.pem` and `pub.pem` to `var-lib-apps/rt/certs` manually

* Place folders in appropriate locations

   The compose file is hardcoded to these paths

```shell
sudo mv ./apps/rt -t /home/apps
sudo mv ./var-lib-apps/rt -t /var/lib/apps
```

* cd to `/home/apps/rt`

   All your docker compose commands will be run from here
* Initialize the database for rt via `init-db.sh`

   You only need to run `init-db.sh` the first time you bring up the containers or after the data in `/var/lib/apps/rt/db-data` has been wiped
