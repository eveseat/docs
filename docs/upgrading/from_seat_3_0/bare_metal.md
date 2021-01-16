# SeAT 3.0 to 4.0 (Bare metal)

The upgrade path from SeAT 3.0 to SeAT 4.0 requires some manual work. This is primarily due to large amounts of refactoring that made it into SeAT 4.

!!! info
    Major changes have been made to the way packages workg together, especially the eveapi, web and services packages.

    The way jobs are queued and queues themselves have also changed, mostly to reduce resource usage and to improve fluency.
    
    Before starting the upgrade, pay check the plugins you may be using and ensure that they are compatible with SeAT 4. If you are unsure, join us on Slack so that we can tru and assist or redirect you to proper person.

!!! warning
    Before you do anything, read and understand this entire upgrade guide.
    
    Those instructions are valid for bare metal deployment only (non-docker installation).
    Please refer to [docker instructions] for a Docker installation.

    **Remember** to do a complete backup of your current database making a copy off the server where SeAT runs together with the `.env` file. Both of these are the only things required to rebuilt your instance in case of failure.

## Requirements

- Check [SeAT 4.0 requirements]
- A database backup is an absolute **must**. Everything in SeAT can be recovered in some way or form except *for your database*.
- Enough storage space to have SeAT 3, SeAT 4 and a backup of your SeAT 3 database.
- Ensure all your SeAT 3 packages are up-to-date (check this in **Settings > SeAT Settings**)

## Upgrade Procedure

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
sudo -H -u www-data bash -c 'php /var/www/seat/artisan seat:cache:clear'
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

Convert user tokens format from previous version

```bash
sudo -H -u www-data bash -c 'php /var/www/seat/artisan seat:token:upgrade'
```

Turn workers up

```bash
service supervisor start
```

## Access

SeAT 4.0 is coming with a complete revamp of permissions system. As a result, your previous roles haven't been converted.
However, they've been keep - so you can configure them with the new system.

You will have to use built-in admin account for your first connexion.

!!! info

    Super administrator is now an user flag and have to be defined at user level instead of Access Permissions.
    You'll get more information regarding the new system on [Admin Login] and [Authorizations] pages.

[SeAT 4.0 requirements]: ../../installation/requirements.md
[Admin Login]: ../../admin_guides/admin_login.md
[Authorizations]: ../../admin_guides/authorizations.md
[docker instructions]: docker.md
