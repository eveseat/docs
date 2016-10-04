![SeAT](http://i.imgur.com/aPPOxSK.png)

This guide attempts to explain how to install SeAT onto an **Ubuntu 14.0.4.x** Server. A small amount of Linux experience is preferred when it comes to this guide, all though it is not entirely mandatory. This guide assumes you want all of the available SeAT components installed (which is the default).

### getting started
We are going to assume you have root access to a fresh Ubuntu 14.04.x Server. Typically access is gained via SSH. All of the below commands are to be entered in the SSH terminal session for the installation & configuration of SeAT. If the server you want to install SeAT on is being used for other things too (such as hosting MySQL databases and or websites), then please keep that in mind while following this guide.

Packages are installed using the `aptitude` package manager as the `root` user.

### table of contents
 1. [Database](#database)
 2. [PHP & Apache](#php--apache)
 3. [Redis](#redis)
 4. [Composer and Git](#composer-and-git)
 5. [SeAT - Download](#seat-download)
 6. [SeAT - Permissions](#seat-permissions)
 7. [SeAT - Setup](#seat-setup)
 8. [Supervisor](#supervisor)
 9. [Crontab](#crontab)
 10. [Webserver - Apache](#webserver---apache)
   i. [Virtual Host Setup](#virtual-host-setup)

### database
SeAT relies **heavily** on a database to function. Everything it learns is stored here, along with things such as user accounts for your users etc. It comes without saying that database security is a very important aspect too. So, ensure that you choose very strong passwords for your installation where required.

Lets install the database server first:
```
apt-get install mysql-server expect -y
```
You should see output similar to the following:
```

```

Next, we are going to secure the database server by removing anonymous access and setting a `root` password.

***
**NOTE** The database `root` password should not be confused with the operating systems `root` passwords. They are both completely different. They should also not be the same password.
***

To secure the database, run:

```
mysql_secure_installation
```

This will ask you a series of questions, below is how these should be answered:

```
[...]

Enter current password for root (enter for none):  BY DEFAULT IT IS NONE, PRESS ENTER
OK, successfully used password, moving on...

[...]

Set root password? [Y/n] y
New password:             SET A STRONG PASSWORD HERE
Re-enter new password:    SET A STRONG PASSWORD HERE
Password updated successfully!
Reloading privilege tables..
 ... Success!

[...]

Remove anonymous users? [Y/n] y
 ... Success!

[...]

Disallow root login remotely? [Y/n] y
 ... Success!

[...]

Remove test database and access to it? [Y/n] y

[...]

Reload privilege tables now? [Y/n] y
 ... Success!

[...]
```
That concludes the installation of the database server and securing it. Next, we need to create an actual database for SeAT to use on the server. For that we need to use the MySQL command line client and enter a few commands to create the database and the user that will be accessing it. Let get to it.

Fire up the MySQL client by running:
```
mysql -uroot -p
```
This will prompt you for a password. Use the password you configured for the `root` account when we ran `mysql_secure_installation`. This will most probably be the last time you need to use this password :) If the password was correct, you should see a prompt similar to the one below:
```
[...]
mysql>
```
Lets run the command to create the SeAT database:
```
create database seat;
```
The output should be similar to the below:
```
mysql> create database seat;
Query OK, 1 row affected (0.00 sec)
```
Next, we create the user that SeAT itself will use to connect and use the `seat` database:
```
GRANT ALL ON seat.* to seat@localhost IDENTIFIED BY 's_p3rs3c3r3tp455w0rd';
```
Of course, you need to replace `s_p3rs3c3r3tp455w0rd` with your own. Successfully running this should present you with output similar to the below:
```
mysql> GRANT ALL ON seat.* to seat@localhost IDENTIFIED BY 's_p3rs3c3r3tp455w0rd';
Query OK, 0 rows affected (0.00 sec)
```
In the example above, we have effectively declared that SeAT will be using the database as `seat:s_p3rs3c3r3tp455w0rd@localhost/seat`.
***
**NOTE** Remember the password for the `seat` database user as we will need it later to configure SeAT.
***

### php & apache
SeAT is written in PHP, and therefore we need to install the PHP interpreter. We also need to install a web server that will allow us to server the web front end that comes with SeAT.

Ubuntu 14.04.x ships with PHP `5.5.9-1ubuntu4.14` which has a known bug with late static binding. For this reason, we include a ppa that will allow us to get PHP 5.6 installed, and therefore rid of the bug. Do this with:

```
add-apt-repository ppa:ondrej/php5-5.6 -y
apt-get update
```

Next, install the required packages with:
```bash
apt-get install apache2 php5 php5-cli php5-mcrypt php5-intl php5-mysql php5-curl php5-gd -y
```
Successful installation should end with something like the below:
```

```

### redis
SeAT makes use of [Redis](http://redis.io/) as a cache and message broker for the Queue backend. Installing it is really easy. Do it with:
```
apt-get install redis-server -y
```

### composer and git
SeAT makes use of the de-facto PHP dependency manager called [Composer](https://getcomposer.org/). Composer is required to both install and update SeAT at a later stage. It is for this reason that it is recommended that you install composer globally on your server so that you can access it by simply typing `composer`. Lets set that up by downloading Composer and saving it to `/usr/local/bin`:
```
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && hash -r
```
Successful installation should output something like:
```
[root@seat ~]# curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && hash -r
#!/usr/bin/env php
All settings correct for using Composer
Downloading...

Composer successfully installed to: /usr/local/bin/composer
Use it: php /usr/local/bin/composer
```
As all of the source code is hosted on Github which is a Git based source control system, we need to install `git` itself. Do this with:
```
apt-get install git -y
```

### seat download
Finally, we get to install SeAT itself. The first thing we need to do is to decide where to save SeAT itself. This directory should have enough space for the cached XML files to live on, as well as a few log files should you need to debug problems. The recommended location is `/var/www/seat/`. To save SeAT in this directory, first change to it:
```
cd /var/www
```
Next, we will download SeAT using `composer` and save it to the `seat` directory.
**NOTE** This can take some time, Composer does a ton of magic here :+1: (like recursively resolving all dependencies :O)
```
composer create-project eveseat/seat seat --keep-vcs --no-dev
```
Successful installation should end with something like:
```
> php artisan key:generate
Application key [mkzxy4ubHOPVQ05LwyFK2ii0vPxvVMMj] set successfully.
```

### seat permissions
SeAT writes logfiles/cachefiles and other temporary data to the `seat/storage/` directory. That together with the fact that the web content will be hosted by apache means that we need to configure the files permissions to allow SeAT do do its thing.

First, lets ensure that `www-data` owns everything in /var/www/seat which is the folder we just downloaded SeAT to:
```
chown -R www-data:www-data /var/www/seat
```
Next, we will allow Apache to write to the `seat/storage/` directory so that it may manipulate the files in there as needed:
```
chmod -R guo+w /var/www/seat/storage/
```
SeAT is now downloaded and almost ready for use!

### seat setup
**NOTE** The installer will automate this jazz, so just the commands for now.

```
Edit /var/www/seat/.env
DB_HOST=localhost
DB_DATABASE=seat
DB_USERNAME=seat
DB_PASSWORD=s_p3rs3c3r3tp455w0rd

CACHE_DRIVER=redis
SESSION_DRIVER=file
QUEUE_DRIVER=redis
```
```
php artisan vendor:publish --force
```
```
php artisan migrate
```
```
php artisan db:seed --class=Seat\\Services\\database\\seeds\\NotificationTypesSeeder
php artisan db:seed --class=Seat\\Services\\database\\seeds\\ScheduleSeeder
```
```
php artisan eve:update-sde -n
```
```
php artisan seat:admin:reset
```
```
php artisan seat:admin:email
```

### supervisor
SeAT makes use of workers to actually process the update jobs that get scheduled. Think if the architecture as someone coming and dumping mail at the postoffice, and its up to say 4 workers to dig through the mail and sort it. Those 4 workers need a manager to ensure that they keep working. `supervisord` is a excellent candidate for the manager job.

Lets install supervisor:
```
apt-get install supervisor -y
```

We now have to configure the actual workers that supervisord will manage. We do this by adding a new configuration file to `/etc/supervisor/conf.d/` called `seat.conf` (Note that the number of workers that we want to start is set by the `numprocs` setting):

```
[program:seat]
;command=/usr/bin/php /var/www/seat/artisan queue:listen --queue=high,medium,low,default --tries 1 --timeout=3600
command=/usr/bin/php /var/www/seat/artisan queue:work --daemon --queue=high,medium,low,default --tries=3 --sleep=3
process_name = %(program_name)s-80%(process_num)02d
stdout_logfile = /var/log/seat-80%(process_num)02d.log
stdout_logfile_maxbytes=100MB
stdout_logfile_backups=10
numprocs=4
directory=/var/www/seat
stopwaitsecs=600
user=www-data
```
Save your file and reload `supervisord` so that it is aware of the changes that we have made:
```
supervisorctl reload
```
Lastly, check that everything is OK and the workers have started up:
```
[root@seat seat]# supervisorctl status
seat1          RUNNING    pid 2677, uptime 0:01:13
```
If you do not have output such as in the above block, check the log files for any possible errors.

### crontab
So far, we have SeAT workers running meaning that it is ready to process jobs that enter the Queue. We now need a way to add jobs to that Queue for processing by the workers.
SeAT has a build in schedule for when what should run at which interval. With the cronjob, we are simply telling SeAT to check every minute "is there anything we should be doing?". We will add the cronjob as the `www-data` user as this is the user that has had all its [permissions](#seat-permissions) configured earlier.

Open up the crontab for `www-data` with:
```
crontab -u www-data -e
```
Next, paste the following line at the bottom of the file (remember to check the path if you chose one other that the one in this guide):
```
* * * * * /usr/bin/php /var/www/seat/artisan schedule:run 1>> /dev/null 2>&1
```

### webserver - apache
In order to get the SeAT fronted running, we need to configure Apache to serve our SeAT installs `public/` folder. This is the only folder that should be internet facing. That small `index.php` is the gateway into the application.
The Apache configuration itself will depend on how your server is set up. Generally, virtual hosting is the way to go, and this is what I will be showing here.

#### virtual host setup
Getting the virtual host setup is as simple as creating a new configuration file (I usually call it the `sites-domain.conf`), and modifying it to match your setup. Everywhere you see `seat.local` as the hostname in the below examples it needs to be substituted to your actual domain.

Next, we have to configure Apache itself to know about the directories and stuff SeAT needs. We need to create that `sites-domain.conf` file I mentioned. This file should live in `/etc/apache2/sites-available/`, so lets change directories there:
```
/etc/apache2/sites-available/
```
Now, create the conf file. In my case, the domain is `seat.local`, so I will call it `seat.local.conf`. Add the following contents to that file:
```
<VirtualHost *:80>
    ServerAdmin webmaster@seat.local
    DocumentRoot "/var/www/seat/public"
    ServerName seat.local
    ServerAlias www.seat.local
    ErrorLog /var/log/apache2/seat.local-error.log
    CustomLog /var/log/apache2/seat.local-access.log combined
    <Directory "/var/www/seat/public">
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
</VirtualHost>
```

Now, we need to enable our virtual host with this command
```
sudo a2ensite seat.local
```

Considering we need to use mod_rewrite to get our URL's to display correctly, we can quickly enable that by running the below:

```bash
a2enmod rewrite
```

Finally, restart apache.

```
apachectl restart
```
That should be it from a configuration perspective. We can confirm that everything is configured correctly by running:
```
[root@seat conf.d]# apachectl -t -D DUMP_VHOSTS
httpd: Could not reliably determine the server's fully qualified domain name, using seat.localdomain for ServerName
VirtualHost configuration:
wildcard NameVirtualHosts and _default_ servers:
*:80                   seat.local (/etc/httpd/conf.d/seat.local.conf:1)
Syntax OK
```

Thats it! SeAT should now be available at http://your-domain-or-ip/
