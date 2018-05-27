![SeAT](https://i.imgur.com/aPPOxSK.png)

!!! info "Docker-based Installation Instructions"

    The upgrade procedure for Docker is extremely simple and documented [here](/guides/admin/docker/#performing-updates). This guide applies to any other installation type only.

# General Upgrades

As with anything, it is a **very** good idea to have backups ready before attempting any upgrades. In the case of SeAT, the most important component that needs to be backed up is the SeAT database. In short, something as simple as `mysqldump -uroot -p seat > backup.sql` should be perfectly fine. Should something go wrong, then you can simply re-install SeAT, restore the database and you should be good to go.

## Upgrade Options

There are 2 ways to upgrade SeAT. The recommended way being the `seat` tool and then the manual way when you are not using a docker-based installed. For most cases the `seat` tool should be fine as it tries to auto detect things for you, however, if you edited the defaults or installed on some custom operating system, then you may need to upgrade manually.

## Upgrading using the seat tool

All you need to do is run the upgrade command and all will be done for you. Follow the next steps to get this done:

- If you haven't downloaded the `seat` tool yet, do so now by running:

```bash
curl -fsSL https://git.io/seat-tool -o /usr/local/bin/seat && chmod +x /usr/local/bin/seat
```

- If you already have the `seat` tool downloaded, make sure the tool itself is at its latest version. Do this by running: `seat update:self`.
- If you have not yet backed up your database, do so now! This is the only part that **can not** be recovered in case something goes wrong!
- Ensure that the job queue is empty.
- Upgrade SeAT by running: `seat update:seat`.

## Manually upgrading

If you cant or don't want to use the SeAT tool, follow these steps to upgrade SeAT.

- Ensure that you are in the path where you installed. By default this should be `/var/www/seat`.
- Put your application into maintenance mode. This will ensure that no request from the outside will hit your applications logic, and also help you perform an upgrade uninterrupted. Do this with:

```bash
php artisan down
```

- Its a good thing to update `composer` itself. This is not a hard requirement, but definitely recommended. Do this with:

```bash
composer self-update
```

- The next thing to do is get the latest SeAT packages. The below example adds the `--no-dev` argument as these packages are generally not needed in production. Upgrade the packages with:

```bash
composer update --no-dev
```

- With the packages upgraded, we can now publish any new migrations/assets/configs. This can be done with:

```bash
php artisan vendor:publish --force --all
```

- Once the needed files are published, run any new/outstanding migrations with:

```bash
php artisan migrate
```

- With the migrations done, run the seeders to update any static data:

```bash
php artisan db:seed --class=Seat\\Services\\database\\seeds\\ScheduleSeeder
```

- Restart the supervisor workers to ensure they also pickup the latest code:

```bash
supervisorctl restart all
```

- Finally, we can simply bring our application back out of maintenance mode with:

```bash
php artisan up
```
