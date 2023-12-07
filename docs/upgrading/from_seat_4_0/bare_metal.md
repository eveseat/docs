# SeAT 4.x to 5.0 (Bare metal)

The upgrade path from SeAT 4.0 to SeAT 5.0 requires a tiny amount of manual work.

!!! danger
    This guide walks you through the process of installing SeAT 5.x, which is still under development. It is advised that you only install it in a testing environments until a full release is made.

!!! warning
    Before you do anything, read and understand this entire upgrade guide.

    Those instructions are valid for bare metal deployment only (non-docker installation).
    Please refer to [docker instructions] for a Docker installation.

    **Remember** to do a complete backup of your current database making a copy off the server where SeAT runs together with the `.env` file. Both of these are the only things required to rebuilt your instance in case of failure.

!!! info
    Before starting the upgrade, pay check the plugins you may be using and ensure that they are compatible with SeAT 5. If you are unsure, join us on Discord so that we can assist or redirect you to the proper person.


## Requirements

- Check [SeAT 5.0 requirements]
- A database backup is an absolute **must**. Everything in SeAT can be recovered in some way or form except *for your database*.
- Enough storage space to have SeAT 5, SeAT 4 and a backup of your SeAT 4 database.
- Ensure all your SeAT 4 packages are up-to-date (check this in **Settings > SeAT Settings**)

## Upgrade Procedure

### Preparation

If users are using your SeAT instance, or the workers are churning away in the background, then you may risk losing some information (although unlikely) - or cause crash during database conversion.
Please start to turning SeAT in maintenance mode, cutting jobs and clearing caches before starting the upgrade.

Turn workers down, use the command

```bash linenums="1"
systemctl stop supervisor.service
```

Put SeAT in maintenance mode

```bash linenums="1"
sudo -H -u www-data bash -c 'php /var/www/seat/artisan down'
```

Clear cache

```bash linenums="1"
sudo -H -u www-data bash -c 'php /var/www/seat/artisan seat:cache:clear'
```

### Backups

- Make a backup of your SeAT database and store it somewhere safe! **Do no skip this step!**
- In your SeAT directory, make a copy of the `.env` file.
  This file contains all your SeAT configuration, including the keys to the ESI tokens required to update your registered users content.
  These values might be useful in case of failure.

### Installing SeAT 5.0

Rename the current SeAT directory from `/var/www/seat` to `/var/www/seat4`.
You don't have to update any config since we will only use the command line for the process.

```bash linenums="1"
mv /var/www/seat /var/www/seat4
```

#### PHP

SeAT 5 needs PHP 8.2 on the server.
The provided command bellow will help you in this task and add newly required PHP extensions in the meantime.

```bash linenums="1"
apt-get update
apt-get install libpng-dev libfreetype6-dev libjpeg-dev
apt-get install openssl zip php8.2-fpm php8.2-bz2 php8.2-cli php8.2-curl php8.2-dom php8.2-gd php8.2-gmp php8.2-intl php8.2-mbstring php8.2-mysql php8.2-opcache php8.2-redis php8.2-zip
```

Remember to update your NGinX configuration to use the new CGI version. To do so, open configuration file located at `/etc/nginx/sites-available/seat` and replace

```text
fastcgi_pass unix:/run/php/php7.3-fpm.sock;
```

with

```text
fastcgi_pass unix:/run/php/php8.2-fpm.sock;
```

Restart nginx to load the changes:

```bash linenums="1"
systemctl restart nginx.service
```

#### SeAT

Once packages have been updated, we will deploy the new SeAT's version using composer.

```bash linenums="1"
composer create-project eveseat/seat /var/www/seat "5.0.x-dev" --no-dev --no-interaction
```

Once the download is done, you should have seen output such as:

```bash linenums="1"
76 packages you are using are looking for funding.
Use the `composer fund` command to find out more!
> @php artisan vendor:publish --tag=laravel-assets --ansi --force

   INFO  Publishing [laravel-assets] assets.  

  Copying directory [vendor/laravel/horizon/public] to [public/vendor/horizon]  DONE
  Copying directory [vendor/opcodesio/log-viewer/public] to [public/vendor/log-viewer]  DONE

No security vulnerability advisories found.
> @php artisan key:generate --ansi

   INFO  Application key set successfully.  

```

Finally, fix directories permissions using the two commands bellow:

```bash linenums="1"
chown -R www-data:www-data /var/www/seat
chmod -R guo+w /var/www/seat/storage/
```

#### Setup

Now sources have been deployed, we have to update `.env` configuration file.
Use information from backup located at `/var/www/seat4/.env` to update the newly generated file located at`/var/www/seat/.env`.

!!! info
In case you had third party packages installed, it's time to deploy them back.
We invite you to report to their own documentation regarding any specific guideline.

!!! warning
Please pay special attention to **APP_KEY**, **APP_URL**, **DB_HOST**, **DB_PORT**, **DB_DATABASE**, **DB_USERNAME**,
**DB_PASSWORD**, **EVE_CLIENT_ID**, **EVE_CLIENT_SECRET** and **EVE_CALLBACK_URL** parameters.

#### Database

We will convert database to work with new SeAT version. To do so, we're using common commands disclosed bellow:

```bash linenums="1"
sudo -H -u www-data bash -c 'php /var/www/seat/artisan vendor:publish --force --all'
sudo -H -u www-data bash -c 'php /var/www/seat/artisan migrate'
sudo -H -u www-data bash -c 'php /var/www/seat/artisan db:seed --class=Seat\\Services\\Database\\Seeders\\PluginDatabaseSeeder'
sudo -H -u www-data bash -c 'php /var/www/seat/artisan eve:update:sde --force'
```

### Complete

Finally, restore workers states and put SeAT online using initial commands in reverse order.

Put SeAT online

```bash linenums="1"
sudo -H -u www-data bash -c 'php /var/www/seat/artisan up'
```

Turn workers up

```bash linenums="1"
systemctl start supervisor.service
```

[SeAT 4.0 requirements]: ../../installation/requirements.md
[docker instructions]: docker.md