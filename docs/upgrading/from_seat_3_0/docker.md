# SeAT 3.0 to 4.0 (Docker)

The upgrade path from SeAT 3.0 to SeAT 4.0 requires some manual work. This is primarily due to large amounts of refactoring that made it into SeAT 4.

!!! info
    Major changes have been made to the way packages workg together, especially the eveapi, web and services packages.

    The way jobs are queued and queues themselves have also changed, mostly to reduce resource usage and to improve fluency.
    
    Before starting the upgrade, pay check the plugins you may be using and ensure that they are compatible with SeAT 4. If you are unsure, join us on Slack so that we can tru and assist or redirect you to proper person.

!!! warning
    Before you do anything, read and understand this entire upgrade guide.
    
    Those instructions are valid for Docker deployment only.
    Please refer to [bare metal instructions] for a non-docker installation.

    **Remember** to do make a complete backup of your current database making a copy off the server where SeAT runs together with the `.env` file. Both of these are the only things required to rebuilt your instance in case of failure.

## Requirements

- Check [SeAT 4.0 requirements]
- A database backup is an absolute **must**. Everything in SeAT can be recovered in some way or form except *for your database*.
- Enough storage space to have SeAT 3, SeAT 4 and a backup of your SeAT 3 database.
- Ensure all your SeAT 3 packages are up-to-date (check this in **Settings > SeAT Settings**)

## Docker Upgrade Procedure

If you are currently using a docker installation for SeAT 3, you are in for a treat because upgrading is super easy. All we are going to do is bring the v4 stack up, connect your database and watch as the Docker entrypoint takes care of the rest.

This guide is going to step through some quick preparation steps, then perform the upgrade and finally, check that everything worked out as expected. Let's dive in.

### tl;dr upgrades

We highly reccomend that you read the details of this upgrade guide to get familiar with what has changed. But, if this is your nth upgrade, maybe you just want to get the summary of everything, so here it is:

- Make a [backup] of your database.
- `cd` to your install dir (which is probably `/opt/seat-docker`) and bring the stack down with `docker-compose down`
- Make a copy of your `.env` and `docker-compose.yml` files.
- Download the new `docker-compose.yml` file with `curl -L https://raw.githubusercontent.com/eveseat/seat-docker/master/docker-compose.yml -o docker-compose.yml`.
- Down the new `.env` file with `curl -L https://raw.githubusercontent.com/eveseat/seat-docker/master/.env -o .env`.
- Upgrade your `docker-compose` installation. It should be version `1.26` and up.
- Configure the new `.env` file. Important configs include the `TRAEFIK_` variables, the `SEAT_SUBDOMAIN` variable. Copy over existing values from your old `.env` file for the `EVE_CLIENT_` variables, the `APP_KEY` varaible and finally the `DB_` variables.
- Bring the stack back up with `docker-compose up -d` and watch the migration process.
- Finally, once the migration process is complete, update the EVE SDE to populate the tables with static data with: `docker-compose exec seat-web php artisan eve:update:sde --force -n`

🎉

### Docker changes since SeAT 3

A number of changes have been made how the docker-compose stack is glued together.

First, the docker repository for SeAT 4 has a new home [here](https://github.com/eveseat/seat-docker), and a new image [here](https://hub.docker.com/r/eveseat/seat).

In SeAT 3, services such as web, workers and cron were all using seperate images. For SeAT 4, we have consilidated all of that into a single image, with a service-aware entrypoint. The code for all of this lives in a new dedicated repository instead of being "hidden" away in the script repo [here](https://github.com/eveseat/scripts/tree/master/docker-compose). All of these changes also mean that we now have the ability to properly tag the docker images instead of relying on the `latest` tag like we did in SeAT 3. Finally.

Next, the default `nginx` web server has been replaced with [Traefik](https://containo.us/traefik/). For the majority of users this means little to no change to what you were used to. However, if you were fronting your instance with another reverse proxy, it is important to be aware of this change. The base image used for the SeAT docker image uses apache2 to serve the web UI, and Traefik reverse proxies to this, exposing it to the world. Advanced users can rip this out, expose the apache server directly and continue using the setup you have. The options are limitless.

### Preperation

Before you upgrade, you need to backup.

#### Backup your database

The single most important thing you need is a backup of your SeAT 3 database. Without a backup you will *not* be able to recover in case of a disaster. So, head on over to the [docker db backup section] and do that right now.

#### Backup your env file

The `.env` file is the one that has your SeAT installations' configuration. It contains things like your SSO Client ID and Secret (aka: credentials). By default, SeAT docker installations live in `/opt/seat-docker` meaning your `.env` file will be at `/opt/seat-docker/.env`. Make a copy of this file and store it somewhere safe.

#### Upgrade docker-compose

The `docker-compose` binary should be upgraded so that we can make use of `${VARIABLES}` inside `.env` files.

If you installed `docker-compose` using your OS' package manager, upgrade the tool using that. Otherwise, a `curl` invocation to download the latest version should also work.

```bash
curl -L https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

#### Stop SeAT 3

First, we need to stop the SeAT 3 stack. Assuming you have the default `/opt/seat-docker` location for your installation, cd to it first and then run:

```bash
docker-compose down
```

The output should be similar to this:

```text
root@seat:/opt/seat-docker# docker-compose down
Stopping seat-nginx   ... done
Stopping seat-cron    ... done
Stopping seat-worker  ... done
Stopping seat-app     ... done
Stopping seat-mariadb ... done
Stopping seat-redis   ... done
Removing seat-nginx   ... done
Removing seat-cron    ... done
Removing seat-worker  ... done
Removing seat-app     ... done
Removing seat-mariadb ... done
Removing seat-redis   ... done
Removing network seat-docker_seat-network
```

### Upgrading to SeAT 4

#### Get the new docker-compose file

!!! warning
    If you have made customisations to how you deployed SeAT with docker-compose, then you should probably **not** be replacing the compose file like we are about to do. Instead, have a look at the new one [here](https://github.com/eveseat/seat-docker/blob/master/docker-compose.yml) and adapt.

Next, we will download the new SeAT 4 docker-compose file. Do that with:

```bash
mv docker-compose.yml docker-compose.yml.back
curl -L https://raw.githubusercontent.com/eveseat/seat-docker/master/docker-compose.yml -o docker-compose.yml
```

With this we have created a copy of the older docker-compose file (just in case), and downloaded the new one.

#### Get the new .env file

The next step is to get a fresh copy of the new `.env` file to use together with the new docker-compose setup. There have been a number of changes to this file (primarily as a result of the web server swap out) which we will describe in the next section.

Get it with:

```bash
mv .env .env.back
curl -L https://raw.githubusercontent.com/eveseat/seat-docker/master/.env -o .env
```

#### Configure the new .env file

!!! info
    This is admitedly the hardest part of the migtation, so pay close attention. Take it slowly and think about what you are doing here.

There are four main settings categories that need to be updated in the new `.env` file. Those are:

- Traefik (webserver)
- EVE Online SSO Config
- The application key
- Database credentials

All of these categories will be described below in detail. For all of them, you have to open the newly downloaded `.env` file in a text editor and update the values. To be sure you are editing the correct file, check its header. It should say:

```text
# SeAT Docker Compose Configuration

# Web server configuration.
# SeAT running in a docker-compose setup ships with Traefik
# as the default web server. You only need to configure the
# parent domain and port where the web server will listen.
# In most cases, just configuring the domain will be all
# you need to do.
```

##### Traefik

As mentioned earlier. The web server has been swapped out in favour of Traefik. As a result, you need to set a few configuration options to get the web UI to work. If you have a setup where you have configured something like `nginx` outside of your Docker installation, we highly reccomend you just remove that and switch over to Traefik. Of anything, it's handling of TLS with Let's Encrypt is quite literally a one-time setup and forget thing.

Inside the `.env` file, Traefik specific configuration options are prefixed with `TRAEFIK_`. They are:

```text
TRAEFIK_DOMAIN=seat.local
TRAEFIK_HTTPS_PORT=443
TRAEFIK_HTTP_PORT=80
TRAEFIK_ACME_EMAIL=you@domain.com
```

These fields need to be updated as follows:

- `TRAEFIK_DOMAIN`: This is the base domain where your SeAT installation lives. For example, if your SeAT 3 installation lives at seat.domain.com, you enter domain.com here.
- `TRAEFIK_HTTPS_PORT`: This is the external port that will be open to the world. SeAT 4 in docker with Traefik will only listen on TLS as well. Since its configured to be `443`, it will most likely clash with your external web server. We reccomend that you just disable your external web server and use Traefik. TLS configuration with it is a breeze!
- `TRAEFIK_HTTPS_PORT`: This is the non-TLS port that Let's Encrypt (as part of the ACME protocol) will connect to during certificate renewals. SeAT will not be available here.
- `TRAEFIK_ACME_EMAIL`: The email address used for Let's Encrypt certificate renewals.

A `SEAT_SUBDOMAIN` value is also present, which sets the subdomain where the SeAT web UI lives. This value needs to match what your SeAT 3 installation used, especially so that the existing SSO application you have configured on the EVE SSO portal matches the configured callback url.

By default, most folks will only configure the domain, subdomain and email and be done. Of course, if you have custom configurations and needs, feel free to adapt.

###### Traefik - TLS

Traefik should handle all of the relevant configuration to get your site to listen with a valid TLS certificate. The secrets for the TLS configuration in Traefik relies on an `acme.json` file which you should mount into the Traefik container from the outside so that it persists restart.

Prepare the json file from within `/opt/seat-docker` with:

```bash
mkdir acme
touch acme/acme.json
chmod 600 acme/acme.json
```

Next, make sure you have the `TRAEFIK_ACME_EMAIL` variable set, and finally, uncomment the labels that will make use of the Let's Encrypt cert resolver in the `docker-compose.yml` file. By default, they will look like this, whereby you need to remove the `#` in front.

```text
#- "traefik.http.routers.seat-web.tls.certResolver=primary"
```

##### EVE Online SSO

Since SeAT's authentication relies on EVE's SSO, you need to configure the relevant client id and secret. You can find your old values in the backup you have made of the `.env` file. The values you need to set are:

- `EVE_CLIENT_ID`
- `EVE_CLIENT_SECRET`

For the callback URL, ensure that you have correctly configured the `SEAT_SUBDOMAIN` value in the previous step.

##### The SeAT Application Key

By default, the `APP_KEY` value for a fresh `.env` file will be `insecure`. This is a purposefully incorrectly formatted value. You can simply set this to the value you have for the same variable in your backup `.env` file.

##### Database details

This is one of the more important steps. The database configuration needs to match what your SeAT 3 installation used because the database data lives in a docker volume. When the stack will start up for the first time again, the SeAT 4 container will have access to the SeAT 3 database volume, and run migrations there. So, you need to copy the database credentials from the old `.env` file to the new one.

The variable names have remained unchanged, but for referece they are:

```text
DB_DATABASE=seat
DB_USERNAME=seat
DB_HOST=mariadb
DB_PASSWORD=i_should_be_changed
```

### Bringing SeAT 4 up

The only thing that is left to do is to start the stack up again. The first time we are goin to start SeAT 4 we wont use the `-d` flag. This is just so that you can see what's happening during the upgrade procedure. So, start SeAT with:

```text
docker-compose up
```

You should see something like this happen when you run the above command:

```text
root@seat:/opt/seat-docker# docker-compose up
Creating network "seat-docker_seat-network" with the default driver
Pulling mariadb (mariadb:10)...
10: Pulling from library/mariadb
3ff22d22a855: Already exists
e7cb79d19722: Already exists
323d0d660b6a: Already exists

...
```

After a while, migrations should start running:

```text
...

seat-web_1     | starting web service
seat-web_1     | Starting first run routines
seat-web_1     | Migrating: 2018_06_05_110000_drop_assets_from_outposts
seat-web_1     | Migrated:  2018_06_05_110000_drop_assets_from_outposts (0.02 seconds)
seat-web_1     | Migrating: 2019_02_09_110731_drop_type_from_notification_groups
seat-web_1     | Migrated:  2019_02_09_110731_drop_type_from_notification_groups (0.01 seconds)
seat-web_1     | Migrating: 2019_05_11_164831_add_permission_role_filter

...
```

!!! warning
    Do **not** interrupt the database migration phase. It will leave your database in a potentially corrupt state, meaning you are going to have to do some extra pluming to get a backup restored. Not a train smash, but not worth it.

Be patient, there are many, many database changes that need to apply.

Eventually, when everything is done you should start seeing the following output:

```text
seat-worker_1  | [2020-08-19 21:11:45][2] Processing: Seat\Eveapi\Jobs\Status\Status
seat-worker_1  | [2020-08-19 21:11:45][1] Processing: Seat\Eveapi\Jobs\Status\Esi
seat-worker_1  | [2020-08-19 21:11:46][2] Processed:  Seat\Eveapi\Jobs\Status\Status
seat-worker_1  | [2020-08-19 21:11:46][1] Processed:  Seat\Eveapi\Jobs\Status\Esi
```

This is a good sign, and means everything is now ready!

### Check your installation

The first obvious step will be to check that you can access the web UI. If not, something is probably weird with the web server configuration and needs some tweaking.

If everything seems to be working fine, you can hit `crtl + c` which will bring the stack down gracefully.

```text
^CGracefully stopping... (press Ctrl+C again to force)
Stopping seat-docker_seat-cron_1   ...
Stopping seat-docker_seat-worker_1 ...
Stopping seat-docker_seat-web_1    ...
Stopping seat-docker_traefik_1     ... done
Stopping seat-docker_redis_1       ...
```

Then, bring it back up with the `-d` flag.

```bash
docker-compose up -d
```

### Update EVE SDE

This is the final step, for real. You need to update the EVE SDE. With your stack up and running (after executing `docker-compose up -d`), you can now force an SDE update with:

```bash
docker-compose exec seat-web php artisan eve:update:sde --force -n
```

Congrats, and welcome to SeAT 4!

!!! info

    Super administrator is now an user flag and have to be defined at user level instead of Access Permissions.
    You'll get more information regarding the new system on [Admin Login] and [Authorizations] pages.

[SeAT 4.0 requirements]: ../../installation/requirements.md
[Admin Login]: ../../admin_guides/admin_login.md
[Authorizations]: ../../admin_guides/authorizations.md
[backup]: ../../admin_guides/docker_admin.md#database-backups-and-restore
[docker db backup section]: ../../admin_guides/docker_admin.md#database-backups-and-restore
[bare metal instructions]: bare_metal.md