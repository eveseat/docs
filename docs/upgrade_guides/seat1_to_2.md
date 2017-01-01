![SeAT](http://i.imgur.com/aPPOxSK.png)

The upgrade path from SeAT 1.x to SeAT 2.0 requires some manual work. This is mainly due to the number of fundamental changes that were made in the SeAT 2.x release.

## notes on the upgrade

The way SeAT is structured has not changed much since its version 1x days. The biggest change is a Laravel framework upgrade to version 5.3. This introduced a new base layout for the application which is why the manual upgrade is needed.

The upgrade process has a large amount of database migrations that need to run so grab a coffee depending on how big your database is!

## requirements

- SeAT 2.0 requires PHP 7.0. At the time of writing this document, PHP 7.1 is not supported due to bug in PhealNG (the component SeAT uses to talk to the EVE API).
- MySQL 5.7 is recommended but not required.
- A database backup is an absolute **must**. Everything in SeAT can be recovered is some way or form *except for your database*. Make 100% sure you backed this up before proceeding with the upgrade!
- Take note of where SeAT is installed. This is usually in `/var/www/seat`.

## upgrade procedure

### preparation

If users are using your SeAT instance, or the workers are churning away in the background, then you may risk losing some information (although unlikely). Its therefore recommended that you start by putting SeAT into maintenance mode before starting the upgrade. Do this by running the following command in your SeAT path.

```
$ cd /var/www/seat
$ php artisan down
```

You should see the message *Application is now in maintenance mode.*.

### backups

- Make a backup of your SeAT database and store it somewhere safe! **Do not skip this step!**
- In your SeAT directory, make a copy of the `.env` file. This file contains all of your SeAT configuration. These values are needed to reconnect to the database once SeAT 2.0 is installed.

### php 7

Install PHP7 if you don't have it already. You can check your PHP version by running `php -v`:

```
$ php -v
PHP 7.0.14 (cli) (built: Dec  7 2016 10:25:25) ( NTS )
Copyright (c) 1997-2016 The PHP Group
Zend Engine v3.0.0, Copyright (c) 1998-2016 Zend Technologies
```

### get the new code

SeAT 2.0 can be installed in exactly the same place as where you had your v1.x installation. If you reuse this path then no webserver re-configuration will be needed. We will move the old installation out of the way, and install SeAT 2.0. To do this, run the following commands:

- First, move the old installation out of the way:

```
$ cd /var/www
$ mv seat seat.old
```

You can double check that this was successful by running `ls` and ensuring that there is a folder named `seat.old` now.

- Next, get the new SeAT code by running `composer create-project eveseat/seat seat --no-dev`:

```
$ cd /var/www
$ composer create-project eveseat/seat seat --no-dev
Installing eveseat/seat (2.0.0)
  - Installing eveseat/seat (2.0.0)
    Loading from cache

Created project in seat
> php -r "file_exists('.env') || copy('.env.example', '.env');"
Loading composer repositories with package information
Updating dependencies

[ ... snip ... ]
```

### publish the assets

Next, we need to publish the new SeAT 2.0 CSS & Javascript and database migrations. This can be done with `php artisan vendor:publish --force`.

### reconfigure `.env` file

With the new code ready to use, the next thing that is required is to reconnect the database. Remember that `.env` file you backed up earlier? Refer to it for the values needed in the newly installed env file that can be found at `/var/www/seat/.env`.

Important keys to populate with the correct values are:

```
DB_HOST=
DB_PORT=
DB_DATABASE=
DB_USERNAME=
DB_PASSWORD=
```

SeAT 2.0 introduced new configuration items in the `.env` that you can review. There is also the option to configure Supervisor & SeAT integration, which can be done by following the admin guide titled *SeAT & Supervisor Integration*.

### run migrations

With the database reconnected, its time to run the migrations for SeAT 2.0. This is the part that may take some time, depending on how big your database is.

To run the migrations, make sure you are still in your seat path (`/var/www/seat`) and run `php artisan migrate`:

```
$ cd /var/www/seat
$ php artisan migrate
```

You will see a bunch of messages and eventually your shell prompt again, indicating that it has completed. If you receive errors here, double check that you have entered the correct database settings in the `.env` file previously mentioned.

### database seeders

With the database migration complete, its time to seed it with some of the static data SeAT needs. Do this with the following commands:

```
php artisan db:seed --class=Seat\\Notifications\\database\\seeds\\ScheduleSeeder
php artisan db:seed --class=Seat\\Services\\database\\seeds\\NotificationTypesSeeder
php artisan db:seed --class=Seat\\Services\\database\\seeds\\ScheduleSeeder
```

### update worker jobs

The Laravel 5.3 upgrade in SeAT changed the way worker jobs are started. You can edit the command used to start a worker in your `seat.conf` file in supervisor. Normally, this file will be somewhere like in `/etc/supervisor/conf.d/`.

The only line you really need to edit is the one that starts with `command`, replacing it with: `command=/usr/bin/php /var/www/seat/artisan queue:work --queue=high,medium,low,default --tries 1 --timeout=86100`.

A full block for SeAT 2.0 should therefore be:

```
[program:seat]
command=/usr/bin/php /var/www/seat/artisan queue:work --queue=high,medium,low,default --tries 1 --timeout=86100
process_name = %(program_name)s-80%(process_num)02d
stdout_logfile = /var/log/seat-80%(process_num)02d.log
stdout_logfile_maxbytes=100MB
stdout_logfile_backups=10
numprocs=4
directory=/var/www/seat
stopwaitsecs=600
user=www-data
```

**NOTE** Keep in mind the `user` value and the path to `artisan` should be correct. Update them to the correct values of you made changes to the defaults. The `user` value differs many times based on Linux distribution too!

### finishing off

With all of that done, bring your application back up with `php artisan up` and start the supervisor workers again. Watch the logs for any errors in case things have not gone as expected. If you need any help, feel free to join the Slack channel details in the *Contact* page on the left.
