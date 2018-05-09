![SeAT](https://i.imgur.com/aPPOxSK.png)

# General Upgrades

This guide attempts to document the SeAT upgrade procedure. As with anything, it is a **very** good idea to have backups ready before attempting any upgrades. In the case of SeAT, the most important component that needs to be backed up is the SeAT database. In short, something as simple as `mysqldump -uroot -p seat > backup.sql` should be perfectly fine. Should something go wrong, then you can simply re-install SeAT, restore the database and you should be good to go.

### Upgrade options
There are 2 ways to upgrade seat. The recommended way being using the `seat` tool and then the manual way. For most cases the `seat` tool should be fine as it tries to auto detect things for you, however, if you edited the defaults or installed on some custom operating system, then you may need to upgrade manually.

### Upgrading using the seat tool
The `seat` tool is by far the best way for quick and painless upgrades. All you need to do is run the upgrade command and all will be done for you. Follow the next steps to get this done:

- First, if you havent downloaded the `seat` tool yet, do so now by following [this guide](/installation_guides/getting_started/#seat-tool).
- If you already have the `seat` tool downloaded, make sure the tool itself is at its latest version. Do this by running: `seat update:self`.
- If you have not yet backed up your database, do so now! This is the only part that **can not** be recovered in case something goes wrong!
- Ensure that the job queue is empty.
- Upgrade SeAT by running: `seat update:seat`.

Done :D

### Manually upgrading
If you cant or don't want to use the SeAT tool, follow these steps to upgrade SeAT.

* Ensure that you are in the path where you installed. By default this should be `/var/www/seat`.
* Put your application into maintenance mode. This will ensure that no request from the outside will hit your applications logic, and also help you perform an upgrade uninterrupted. Do this with:

```bash
php artisan down
```

* Its a good thing to update `composer` itself. This is not a hard requirement, but definitely recommended. Do this with:

```bash
composer self-update
```

* The next thing to do is get the latest SeAT packages. The below example adds the `--no-dev` argument as these packages are generally not needed in production. Upgrade the packages with:

```bash
composer update --no-dev
```

* With the packages upgraded, we can now publish any new migrations/assets/configs. This can be done with:

```bash
php artisan vendor:publish --force
```

* Once the needed files are published, run any new/outstanding migrations with:

```bash
php artisan migrate
```

* With the migrations done, run the seeders to update any static data:

```bash
php artisan db:seed --class=Seat\\Notifications\\database\\seeds\\ScheduleSeeder
php artisan db:seed --class=Seat\\Services\\database\\seeds\\NotificationTypesSeeder
php artisan db:seed --class=Seat\\Services\\database\\seeds\\ScheduleSeeder
```

* Restart the supervisor workers to ensure they also pickup the latest code:

```bash
supervisorctl restart all
```

* Finally, we can simply bring our application back out of maintenance mode with:

```bash
php artisan up
```
