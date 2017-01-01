![SeAT](http://i.imgur.com/aPPOxSK.png)

If you are reading this, it means that you want to install SeAT on a Linux distribution that does not have a dedicated guide. SeAT *should* be able to run fine on just about any distribution.

This guide is going to assume a very confident level of Linux expertise too and is only recommended for advanced users.

### table of contents
 1. [Software](#software)
 2. [Software - PHP](#software---php)
 3. [Composer](#composer)
 4. [SeAT - Download](#seat-download)
 5. [SeAT - Permissions](#seat-permissions)
 6. [SeAT - Setup](#seat-setup)
 7. [Supervisor](#supervisor)
 8. [Crontab](#crontab)
 9. [Webserver](#webserver)

### software
SeAT needs 3 major components. A MySQL (or MariaDB) database, Redis and `supervisord`. Using your operating systems package manager (or from source if you wish!), install the services. PHP needs to be at least version 7 and supervisor at least version 3. The following list gives a breakdown of the OS level dependencies needed by SeAT:

- mysqld
- redis
- supervisord
- git
- unzip

### software - php
There are also a few PHP 7 dependencies needed that should be installed. You can confirm if you are missing any by running `php -m` and comparing it to the following list:

- mcrypt
- intl
- gd
- PDO
- pdo_mysql
- curl
- mbstring
- dom
- bz2

### composer
SeAT makes use of the de-facto PHP dependency manager called [Composer](https://getcomposer.org/). Composer is required to both install and update SeAT at a later stage. It is for this reason that it is recommended that you install composer globally on your server so that you can access it by simply typing `composer`. Lets set that up by downloading Composer and saving it to `/usr/local/bin`:
```
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && hash -r
```

### seat download
SeAT is downloaded using the previously installed `composer` tool. Decide where you want to host SeAT (like `/var/www/seat`) and download it:

**NOTE** This can take some time, Composer does a ton of magic here :+1: (like recursively resolving all dependencies :O)
```
composer create-project eveseat/seat seat --no-dev
```
Successful installation should end with something like:
```
Writing lock file
Generating autoload files
> Illuminate\Foundation\ComposerScripts::postUpdate
> php artisan optimize
Generating optimized class loader
Compiling common classes
> php artisan key:generate
Application key [base64:WFfzkuIpUGpkDNu0SRtwhPphpM66UvzuZpEML/6dEVQ=] set successfully.
```

### seat permissions
SeAT writes logfiles/cachefiles and other temporary data to the `seat/storage/` directory. Ensure that the user your webserver will run as can write to this location. Example permissions configuration is:

```
chown -R apache:apache /var/www/seat
```
```
chmod -R guo+w /var/www/seat/storage/
```
SeAT is now downloaded and almost ready for use!

### seat setup
Next, we need to configure SeAT to know where the database server lives. Do this by editing `/var/www/seat/.env` and setting the appropriate values:

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=seat
DB_USERNAME=seat
DB_PASSWORD=s_p3rs3c3r3tp455w0rd
DB_DEBUG=false
```

Moving on, we should publish the internal databse migrations, css & javasript, and other goodies with:
```
php artisan vendor:publish --force
```

Next, run the database migrations to get the SeAT database ready for use:
```
php artisan migrate
```

Next, we need to run the seeders to populate som default data for SeAT to use:
```
php artisan db:seed --class=Seat\\Notifications\\database\\seeds\\ScheduleSeeder
php artisan db:seed --class=Seat\\Services\\database\\seeds\\NotificationTypesSeeder
php artisan db:seed --class=Seat\\Services\\database\\seeds\\ScheduleSeeder
```

Next, the latest static data export must be downloaded and imported with:
```
php artisan eve:update-sde -n
```

And finally, the SeAT admin user needs to have a password set. There is no default SeAT admin password.
```
php artisan seat:admin:reset
```

One last thing, an email address is needed for the admin user too.
```
php artisan seat:admin:email
```

### supervisor
SeAT makes use of workers to actually process the update jobs that get scheduled. Think if the architecture as someone coming and dumping mail at the postoffice, and its up to say 4 workers to dig through the mail and sort it. Those 4 workers need a manager to ensure that they keep working. `supervisord` is a excellent candidate for the manager job.

Configure the actual workers that supervisord will manage. We do this by adding a new configuration file to `/etc/supervisord.d/` called `seat.ini` Note that the number of workers that we want to start is set by the `numprocs` settings:
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
user=apache
```
Save your file and start `supervisord` so that it is aware of the changes that we have made:
```
systemctl start supervisord.service
```
Lastly, check that everything is OK and the workers have started up:
```
[root@seat seat]# supervisorctl status
seat:seat-8000                   RUNNING    pid 5083, uptime 0:00:28
seat:seat-8001                   RUNNING    pid 5082, uptime 0:00:28
seat:seat-8002                   RUNNING    pid 5085, uptime 0:00:28
seat:seat-8003                   RUNNING    pid 5084, uptime 0:00:28
```
If you do not have output such as in the above block, check the log files for any possible errors.

### crontab
So far, we have SeAT workers running meaning that it is ready to process jobs that enter the Queue. We now need a way to add jobs to that Queue for processing by the workers.
SeAT has a build in schedule for when what should run at which interval. With the cronjob, we are simply telling SeAT to check every minute "is there anything we should be doing?". Add the cronjob as the webserver user as this is the user that has had all its [permissions](#seat-permissions) configured earlier.

Add the following line to the webserver users crontab (remember to check the path if you chose one other that the one in this guide):
```
* * * * * /usr/bin/php /var/www/seat/artisan schedule:run 1>> /dev/null 2>&1
```

### webserver
Lastly, configure a webserver to server the `public/` directory from the folder that was downloaded when the `composer create-project` command was run.

Thats it! SeAT should now be available at http://your-domain-or-ip/
