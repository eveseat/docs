![SeAT](https://i.imgur.com/aPPOxSK.png)

SeAT sources information about the SDE from a json file hosted [here](https://github.com/eveseat/resources/blob/master/sde.json). It may happen that the SDE gets updated but the the json resource has not yet been updated. For this reason, its possible to specify the version to get based on what is available on [https://www.fuzzwork.co.uk/dump/](https://www.fuzzwork.co.uk/dump/).

### Overriding the resources json
Check the version of SDE dumps available on [https://www.fuzzwork.co.uk/dump/](https://www.fuzzwork.co.uk/dump/). At the time of this writing, `frostline-1.0-116241` was the latest. Once you have the version string ready, open the `.env` configuration file and add a key as follows:

```php
SDE_VERSION=frostline-1.0-116241
```

When running the SDE updater, specify the `--local` parameter to source the version string from the configuration file:

```bash
$ php artisan eve:update:sde --local
```

!!! info
    
    By default, SeAT automatically updates the SDE [every month](https://github.com/eveseat/services/blob/master/src/database/seeds/ScheduleSeeder.php#L50). You may want to login as an administrator and remove the schedule to update it monthly if you have overridden the default.
