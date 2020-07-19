# SeAT 3.0 to 4.0

The upgrade path from SeAT 3.0 to SeAT 4.0 requires some manual work. This is mainly due to a large package revamp that
have been made in SeAT 4.0.

!!! info

    Major changes have been applied in the way packages are working together, especially regarding eveapi, web and services ones.
    Also, the way jobs are queued and queues themselve have been altered to reduce resources thumbrint and improve fluency.
    
    Before starting upgrade, pay attention on plugins you may use and ensure they are compatible with the new generation.
    If it should not be the case, please come to us on Slack - so we will attempt to assist or redirect you to proper person.

!!! warning

    Before starting to do anything, be sure you read and understand this whole page content.

    Also, remember to do at least a complete backup of your current database that you pick out of server on which SeAT
    is currently running, together with the `.env` file. Both of them are the only things required to rebuilt your instance
    in case of failure.
    
    In all provided instructions, we assume you were using a standalone installation using official deployment instructions.
    Pay attention if you made changes on your own and adapt provided instructions accordingly.
    
    Last but not least, we assume you are authenticated against your server as root user.
    
## Requirements

- Check [SeAT 4.0 requirements]
- A database backup is an absolute **must**. Everything in SeAT can be recovered in some way or form except *for your database*.
- Enough storage space to contain SeAT 3, SeAT 4 and a backup of SeAT 3 database
- Ensure all your SeAT 3 packages are up-to-date (to do so, pay attention to packages status into **Settings > SeAT Settings**)

## Upgrade procedure

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

```
       fastcgi_pass unix:/run/php/php7.1-fpm.sock;
```

with

```
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
