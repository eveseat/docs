![SeAT](https://i.imgur.com/aPPOxSK.png)

# SeAT 2.0 to 3.0

The upgrade path from SeAT 2.x to SeAT 3.0 requires some manual work. This is mainly due to the number of fundamental database changes that were made in SeAT 3.x.

## Notes on the upgrade

Most of the database has been revamped to match ESI models. Therefore, we can't offer you a simple update as we do for minor patches. However, once migrated, updates can be done as per usual.

The process described bellow handles data conversion between the SeAT 2.x structure and SeAT 3.x one.

## Requirements

- Check [SeAT 3.0 Requirements]
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

!!! Note
```bash
To prevent your tokens from being invalidated, you must use the same Client ID and Secret Key that you had at the source of your database backup(.env file).
```

### Installing SeAT 3.0

Rename the current SeAT directory from `/var/www/seat` to `/var/www/seat2`.
You don't have to update any config since we will only use the command line for the process.
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
- Finally, run `php artisan seat:migrator:upgrade` and follow the wizard

At the end of the process, you will have most of your data transferred into the specified SeAT 3.0 database.
Next, you can remove the seat2 directory with `rm -R /var/www/seat2` and the old database.

Enjoy SeAT 3.0

!!! note

    In case of any troubles, the migrator package did a backup before starting the migration process.
    The output is specified in the prompt while it is being done, but you will also find it in `/var/www/seat2/storage/backup`.

[SeAT 3.0 Requirements]: ../installation/requirements.md
