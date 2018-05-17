![SeAT](https://i.imgur.com/aPPOxSK.png)

# SeAT 2.0 to 3.0

The upgrade path from SeAT 2.x to SeAT 3.0 requires some manual work. This is mainly due to the number of fundamental database changes that were made in SeAT 3.x.

## Notes on the upgrade

Most of the database has been revamped to match ESI models. Therefore, we can't offer you a simple update as we do for minor patches. However, once migrated, updates can be done as per usual.

The process described bellow handles data conversion between the SeAT 2.x structure and SeAT 3.x one. The general outline is First prepare version 2 for the upgrade, then install version 3, migrate the data from 2 to 3 and finally delete version 2.

## Requirements

- SeAT 3.0 requires PHP 7.1.
- If you're using MySQL - it must be 5.7 or greater.
- If you're using MariaDB - it must be 10.2.7.
- A database backup is an absolute **must**. Everything in SeAT can be recovered is some way or
  form *except for your database*. Make 100% sure you backed this up before proceeding with the upgrade!
- Enough storage space to contains SeAT 2, SeAT 3, a backup of SeAT 2 database and a backup of SeAT 3 database.
- Take note of where SeAT 2 is installed. This is usually in `/var/www/seat`.

## Upgrade procedure

### Preparation

If users are using your SeAT instance, or the workers are churning away in the background, then you may
risk losing some information (although unlikely). Its therefore recommended that you start by putting
SeAT into maintenance mode before starting the upgrade. Do this by running the following command in your SeAT path. 

```bash
php artisan down
```

If you are running this migration after CCP killed the XML API then there is probably no risk of the updaters doing anything useful anyways :D

### Backups

- Make a backup of your SeAT database and store it somewhere safe! **Do not skip this step!**
- In your SeAT directory, make a copy of the `.env` file. This file contains all of your SeAT configuration. These values may be useful in case of failure.

### Renaming the SEAT 2.0 database

Both version 2.0 and 3.0 of Seat must exist at the same time during the upgrade. If you wish to keep the same database name for your Seat 3.0 installation then you will need to rename the existing seat 2.0 Database. Assuming your existing database name is 'seat'

First create a new empty database
```bash
mysql
CREATE DATABASE seat2;
GRANT ALL ON seat2.* to seat@localhost IDENTIFIED BY 's_p3rs3c3r3tp455w0rd';
FLUSH PRIVILEGES;
\q
```

now move the tables from seat to seat2
```bash
for table in `mysql -u root -p[YourPassword] -s -N -e "use seat;show tables from seat;"`; do mysql -u root -p[YourPassword] -s -N -e "use seat;rename table seat.$table to seat2.$table;"; done;
```

and update the `.env` file to point to the new database name


### Installing SeAT 3.0

Rename the current SeAT directory from `/var/www/seat` to `/var/www/seat2`.
`mv /var/www/seat /var/www/seat2`

Follow standard installation instructions for SeAT 3.0.

!!! warning

    You need to keep the current SeAT 2.0 installed in order to migrate data to a newly installed 3.0 instance.
    It doesn't have to be reachable from internet though since we will only use the command line for the process.

### Installing the migrator package on SeAT 2.0

- Move to your SeAT 2.0 installation directory (should be `/var/www/seat2` - unless you changed it)
- Add the package called `seat-migrator` using `composer require warlof/seat-migrator`
- Edit the `app.php` file inside the `config` folder by appending `Warlof\Seat\Migrator\MigratorServiceProvider::class,` to the end of `providers` array.
- Once done, publish the package files using `php artisan vendor:publish --force`
- Run migration scripts with `php artisan migrate`

### Migrating from SeAT 2.0 to SeAT 3.0

- Finally, run `php artisan seat:migrator:upgrade` and follow the wizard

At the end of the process, you will have most of your data transferred into the specified SeAT 3.0 database.
Next, you can remove the seat2 directory 
`rm -R /var/www/seat2` 

and delete the old database.
```bash
mysql
drop database seat2;
\q
```

Enjoy SeAT 3.0


!!! note

    In case of any troubles, the migrator package did a backup before starting the migration process.
    The output is specified in the prompt while it is being done, but you will also find it in `/var/www/seat2/storage/backup`.

