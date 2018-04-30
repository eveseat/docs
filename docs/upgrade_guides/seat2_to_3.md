![SeAT](http://i.imgur.com/aPPOxSK.png)

The upgrade path from SeAT 2.x to SeAT 3.0 requires some manual work. This is mainly due to
the number of fundamental changes that were made in the SeAT 3.x to be ESI reliable.

## notes on the upgrade

Most of the database has been revamped to match with ESI models. Therefore, we can't offer
you a simple update as we used to for minor patches.

The process described bellow is handling data conversion between SeAT 2.x structure and SeAT 3.x one.

## requirements

- SeAT 3.0 requires PHP 7.2.
- If you're using MySQL - it must be 5.7 or greater.
- If you're using MariaDB - it must be 10.2.7.
- A database backup is an absolute **must**. Everything in SeAT can be recovered is some way or
  form *except for your database*. Make 100% sure you backed this up before proceeding with the upgrade!
- Take not of where SeAT is installed. This is usually in `/var/www/seat`.

## upgrade procedure

### preparation

If users are using your SeAT instance, or the workers are churning away in the background, then you may
risk losing some information (although unlikely). Its therefore recommended that you start by putting
SeAT into maintenance mode before starting the upgrade. Do this by running the following command in your SeAT path.

### backups

- Make a backup of your SeAT database and store it somewhere safe! **Do not skip this step!**
- In your SeAT directory, make a copy of the `.env` file. This file contains all of your SeAT configuration.
  These values may be useful in case of failure.

### installing SeAT 3.0

Rename the current SeAT directory from `/var/www/seat` to `/var/www/seat2`.
You don't have to update any config since we will only use command line for the process.
`mv /var/www/seat /var/www/seat2`

Follow standard installation instructions for SeAT 3.0.

**IMPORTANT**
> you absolutely need to keep the current SeAT 2.0 installed in order to migrate data to the newly
> installed 3.0. It doesn't have to be reachable from internet though since we will only use command line for the process.

### installing migrator package on SeAT 2.0

- Move into SeAT 2.0 installation directory (used to be `/var/www/seat2` - except you change it)
- Add the package called `seat-migrator` using `composer require warlof/seat-migrator`
- Edit the `app.php` file inside the `config` folder by appending `Warlof\Seat\Migrator\MigratorServiceProvider::class,`
  at the end of `providers` array.
- Once done, publish the package files using `php artisan vendor:publish --force`
- And run migration scripts with `php artisan migrate`
- Finally, you have to run `php artisan seat:migrator:upgrade` and follow the wizard

At the end of the process, you'll have must of your data transferred into the specified SeAT3.0 database.
From now, you can remove the seat2 directory with `rm -R /var/www/seat2` and the old database.

Enjoy SeAT 3.0

**NOTICE**
> in case of any troubles, the migrator package did a backup before starting the migration process.
> Their output is specified in the prompt while he's doing them, but you'll find them in `/var/www/seat2/storage/backup`.
