# SeAT 3.0 to 4.0

The upgrade path from SeAT 3.0 to SeAT 4.0 requires some manual work. This is primarily due to large amounts of refactoring that made it into SeAT 4.

!!! info
    Major changes have been made to the way packages workg together, especially the eveapi, web and services packages.

    The way jobs are queued and queues themselves have also changed, mostly to reduce resource usage and to improve fluency.
    
    Before starting the upgrade, pay check the plugins you may be using and ensure that they are compatible with SeAT 4. If you are unsure, join us on Slack so that we can tru and assist or redirect you to proper person.

!!! warning
    Before you do anything, read and understand this entire upgrade guide.

    **Remember** to do make a complete backup of your current database making a copy off the server where SeAT runs together with the `.env` file. Both of these are the only things required to rebuilt your instance in case of failure.

## Requirements

- Check [SeAT 4.0 requirements]
- A database backup is an absolute **must**. Everything in SeAT can be recovered in some way or form except *for your database*.
- Enough storage space to have SeAT 3, SeAT 4 and a backup of your SeAT 3 database.
- Ensure all your SeAT 3 packages are up-to-date (check this in **Settings > SeAT Settings**)

## Docker Upgrade Procedure

If you are currently using a docker installation for SeAT 3, you are in for a treat because upgrading is super easy. All we are going to do is bring the v4 stack up, connect your database and watch as the Docker entrypoint takes care of the rest.

This guide is going to sterp through some quick preperation steps, then perform the upgrade and finally, check that everything worked out as expected. Let's dive in.

### Docker changes since SeAT 3

A number of changes have been made how the docker-compose stack is glued together.

First, the docker repository for SeAT 4 has a new home [here](https://github.com/eveseat/seat-docker), and a new image [here](https://hub.docker.com/r/eveseat/seat).

In SeAT 3, services such as web, workers and cron were all using seperate images. For SeAT 4, we have consilidated all of that into a single image, with a service-aware entrypoint. The code for all of this lives in a new dedicated repository instead of being "hidden" away in the script repo [here](https://github.com/eveseat/scripts/tree/master/docker-compose). All of these changes also mean that we now have the ability to properly tag the docker images instead of relying on the `latest` tag like we did in SeAT 3. Finally.

Next, the default `nginx` web server has been replaced with [Traefik](https://containo.us/traefik/). For the majority of users this means little to no change to what you were used to. However, if you were fronting your instance with another reverse proxy, it is important to be aware of this change. The base image used for the SeAT docker image uses apache2 to serve the web UI, and Traefik reverse proxies to this, exposing it to the world. Advanced users can rip this out, expose the apache server directly and continue using the setup you have. The options are limitless.

### Preperation

Before you upgrade, you need to backup.

#### Backup your database

The single most important thing you need is a backup of your SeAT 3 database. Without a backup you will *not* be able to recover in case of a disaster. So, head on over to the [docker db backup section](/admin_guides/docker_admin/#database-backups-and-restore) and do that right now.

#### Backup your env file

The `.env` file is the one that has your SeAT installations' configuration. It contains things like your SSO Client ID and Secret (aka: credentials). By default, SeAT docker installations live in `/opt/seat-docker` meaning your `.env` file will be at `/opt/seat-docker/.env`. Make a copy of this file and store it somewhere safe.

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

#### Get the new env file

The next step is to get a fresh copy of the new `.env` file to use together with the new docker-compose setup. There have been a number of changes to this file (primarily as a result of the web server swap out) which we will describe in the next section.

Get it with:

```bash
mv .env .env.back
curl -L https://raw.githubusercontent.com/eveseat/seat-docker/master/.env -o .env
```

#### Configure the new env file

!!! info
    This is admitedly the hardest part of the migtation, so pay close attention. Take it slowly and thing about what you are doing here.

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

Congrats, and welcome to SeAT 4!

## Bare Metal Upgrade Procedure

### Preparation

If users are using your SeAT instance, or the workers are churning away in the background, then you may risk losing some information (although unlikely) - or cause crash during database conversion.
Please start to turning SeAT in maintenance mode, cutting jobs and clearing caches before starting the upgrade.

Turn workers down, use the command

```bash
service supervisor stop
```

Put SeAT in maintenance mode

```bash
sudo -H -u www-data bash -c 'php /var/www/seat/artisan down'
```

Clear cache

```bash
sudo -H -u www-data bash -c 'php /var/www/seat/artisan seat:cache:clear
```

### Backups

- Make a backup of your SeAT database and store it somewhere safe! **Do no skip this step!**
- In your SeAT directory, make a copy of the `.env` file.
This file contains all your SeAT configuration, including tokens watermark required to update your registered users content.
These values might be useful in case of failure.

### Installing SeAT 4.0

Rename the current SeAT directory from `/var/www/seat` to `/var/www/seat3`.
You don't have to update any config since we will only use the command line for the process.

```bash
mv /var/www/seat /var/www/seat3
```

#### PHP

If it's not already the case, you'll have to deploy at least PHP 7.3 on the server.
The provided command bellow will help you in this task and add newly required PHP extensions in the meantime.

```bash
apt-get update
apt-get install libpng-dev libfreetype6-dev libjpeg-dev
apt-get install curl openssl zip php7.3-bz2 php7.3-cli php7.3-curl php7.3-dom php7.3-gd php7.3-gmp php7.3-intl php7.3-mbstring php7.3-mysql php7.3-opcache php7.3-redis php7.3-zip
```

Remember to update your NGinX configuration to use the new CGI version. To do so, open configuration file located at `/etc/nginx/sites-available/seat` and replace

```text
       fastcgi_pass unix:/run/php/php7.1-fpm.sock;
```

with

```text
       fastcgi_pass unix:/run/php/php7.3-fpm.sock;
```

#### SeAT

Once packages have been updated, we will deploy the new SeAT's version using composer.

```bash
composer create-project eveseat/seat /var/www/seat "4.0.*" --no-dev --no-interaction
```

Once the download is done, you should have seen output such as:

```bash
Writing lock file
Generating optimized autoload files
> Illuminate\Foundation\ComposerScripts::postAutoloadDump
> @php artisan package:discover
Discovered Package: darkaonline/l5-swagger
Discovered Package: eveseat/api
Discovered Package: eveseat/console
Discovered Package: eveseat/eveapi
Discovered Package: eveseat/notifications
Discovered Package: eveseat/services
Discovered Package: eveseat/web
Package manifest generated successfully.
> @php artisan key:generate
Application key [base64:CmhqYNkaIcHo8nYC8LiEWa3U5/+BiTLih5dZftxlV2k=] set successfully.
```

Finally, fix directories permissions using the two commands bellow:

```bash
chown -R www-data:www-data /var/www/seat
chmod -R guo+w /var/www/seat/storage/
```

#### Setup

Now sources have been deployed, we have to update `.env` configuration file.
Use information from backup located at `/var/www/seat3/.env` to update the newly generated file located at `/var/www/seat/.env`.

!!! info
    In case you had third party packages installed, it's time to deploy them back.
    We invite you to report to their own documentation regarding any specific guideline.

!!! warning
    Please pay special attention to **APP_KEY**, **DB_HOST**, **DB_PORT**, **DB_DATABASE**, **DB_USERNAME**,
    **DB_PASSWORD**, **EVE_CLIENT_ID**, **EVE_CLIENT_SECRET** and **EVE_CALLBACK_URL** parameters.

#### Database

We will convert database to work with new SeAT version. To do so, we're using common commands disclosed bellow:

```bash
sudo -H -u www-data bash -c 'php /var/www/seat/artisan vendor:publish --force --all'
sudo -H -u www-data bash -c 'php /var/www/seat/artisan migrate'
sudo -H -u www-data bash -c 'php /var/www/seat/artisan db:seed --class=Seat\\Console\\database\\seeds\\ScheduleSeeder'
sudo -H -u www-data bash -c 'php /var/www/seat/artisan eve:update:sde --force'
```

### Complete

Finally, restore workers states and put SeAT online using initial commands in reverse order.

Put SeAT online

```bash
sudo -H -u www-data bash -c 'php /var/www/seat/artisan up'
```

Turn workers up

```bash
service supervisor start
```

## Access

SeAT 4.0 is coming with a complete revamp of permissions system. As a result, your previous roles haven't been converted.
However, they've been keep - so you can configure them with the new system.

You will have to use built-in admin account for your first connexion using `sudo -H -u www-data bash -c 'php /var/www/seat/artisan seat:admin:login'`

!!! info

    Super administrator is now an user flag and have to be defined at user level instead of Access Permissions.
    You'll get more information regarding the new system on [Admin Login] and [Authorizations] pages.

[SeAT 4.0 requirements]: ../installation/requirements.md
[Admin Login]: ../admin_guides/admin_login.md
[Authorizations]: ../admin_guides/authorizations.md
