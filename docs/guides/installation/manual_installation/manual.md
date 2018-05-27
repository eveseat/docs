![SeAT](https://i.imgur.com/aPPOxSK.png)

# Manual Installation

!!! warning

    Make sure you review the hardware and software requirements sections before installing anything intended for production use!

## General Instructions

A manual installation of SeAT is actually not that bad. All you need to do really is install MariaDB, Redis and some PHP dependencies. You will also a web server such as `nginx` running. Guides for popular Linux distributions such as Debian, Ubuntu and CentOS can be found in the sidebar if you don't feel ready for this guide, but, if those distributions aren't your cup of tea, follow these steps to get going:

### Install Dependencies

OS Dependencies are:

- PHP 7.1
- MariaDB / MySQL server
- Redis server

The typical PHP packages you are going to need from your package manager are:

```text
php-cli php-mysqlnd php-posix php-mcrypt php-process php-mbstring php-intl php-dom php-gd
```

### Composer and SeAT

Next, we need [composer](https://getcomposer.org/) that you can install with:

```bash
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && hash -r
```

Install SeAT _itself_ with:

```bash
composer create-project eveseat/seat --no-dev --stability=beta
```

### Setup SeAT

Once installed, `cd` to the new `seat/` directory and publish migrations and assets with:

```bash
php artisan vendor:publish --force --all
```

If you want the Swagger API documentation, run:

```bash
php artisan l5-swagger:generate
```

Update the `.env` file with your database settings. Ideally SeAT should have full control over only its own database (not the entire database server);

Once the database is configured, run the published migrations with:

```bash
php artisan migrate
```

Update the EVE Static Data tables with:

```bash
php artisan eve:update:sde -n
```

Run the SeAT schedule seeder with:

```bash
php artisan db:seed --class=Seat\\Services\\database\\seeds\\ScheduleSeeder
```

### Webserver

Configure a web server to serve the `seat/public/` directory to the world. Dont serve the root `seat` directory as this will expose your `.env` file with your database password and SSO secrets in it.

Next, download and configure supervisord and have it keep the `php artisan horizon` command alive. This will allow you to process jobs.

### ESI and SSO Configuration

Finally, setup the ESI / SSO environment as described in [this](/guides/installation/basic_installation/esi/) document.
