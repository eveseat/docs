![SeAT](http://i.imgur.com/aPPOxSK.png)

This guide attempts to explain how to install SeAT onto a **CentOS 7.x** Server. A small amount of Linux experience is preferred when it comes to this guide, all though it is not entirely mandatory. This guide assumes you want all of the available SeAT components installed (which is the default).

### getting started
We are going to assume you have root access to a fresh CentOS 7.x Server. Typically access is gained via SSH. All of the below commands are to be entered in the SSH terminal session for the installation & configuration of SeAT. If the server you want to install SeAT on is being used for other things too (such as hosting MariaDB databases and or websites), then please keep that in mind while following this guide.

Packages are installed using the `yum` package manager as the `root` user.

### table of contents
 1. [Repositories](#repositories)
   i. [Epel](#epel)
   ii. [Remi](#remi)
 2. [Database](#database)
 3. [PHP & Apache](#php--apache)
 4. [Redis](#redis)
 5. [Composer and Git](#composer-and-git)
 6. [SeAT - Download](#seat-download)
 7. [SeAT - Permissions](#seat-permissions)
 8. [SELinux](#selinux)
 9. [SeAT - Setup](#seat-setup)
 10. [Supervisor](#supervisor)
 11. [Crontab](#crontab)
 12. [Webserver - Apache](#webserver---apache)
   i. [Virtual Host Setup](#virtual-host-setup)

### repositories
Due to the nature of CentOS 7.x packaging and the limitations in getting 'bleeding edge' software with it, we need to add some extra software repositories in order to get SeAT running. These repositories are known as the [Fedora EPEL](https://fedoraproject.org/wiki/EPEL) and [Remi](http://rpms.famillecollet.com/) repositories. Adding these repositories will allow us to get access to PHP 5.5+ which is a requirement for SeAT.

To install / configure the required repositories, run the following commands:

#### epel
```
EPEL=epel-release-latest-7.noarch.rpm && curl -O https://dl.fedoraproject.org/pub/epel/$EPEL && yum localinstall -y $EPEL && rm -f $EPEL
```

#### remi
```
REMI=remi-release-7.rpm && curl -O http://rpms.remirepo.net/enterprise/$REMI && yum localinstall -y $REMI && rm -f $REMI
```

Next, we will quickly install `yum-utils` and enable the `remi-php55` repository in order to gain access to PHP 5.5 (You can skip this if you want to manually enable `remi` and `remi-php55`). Do this with:
```
yum install yum-utils -y
```
```
yum-config-manager --enable remi,remi-php55
```

### database
SeAT relies **heavily** on a database to function. Everything it learns is stored here, along with things such as user accounts for your users etc. It comes without saying that database security is a very important aspect too. So, ensure that you choose very strong passwords for your installation where required.

Lets install the database server first:
```
yum install -y mariadb-server
```
You should see output similar to the following:
```
[... snip ...]
Installed:
  mariadb-server.x86_64 1:5.5.44-1.el7_1
[... snip ...]
```

With the database server installed, lets start it and configure it to automatically start up the next time out server boots up:

```
systemctl enable mariadb.service
```
Next, start the DB server with
```
systemctl start mariadb.service
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
MariaDB [(none)]>
```
Lets run the command to create the SeAT database:
```
create database seat;
```
The output should be similar to the below:
```
MariaDB [(none)]> create database seat;
Query OK, 1 row affected (0.00 sec)
```
Next, we create the user that SeAT itself will use to connect and use the `seat` database:
```
GRANT ALL ON seat.* to seat@localhost IDENTIFIED BY 's_p3rs3c3r3tp455w0rd';
```
Of course, you need to replace `s_p3rs3c3r3tp455w0rd` with your own. Successfully running this should present you with output similar to the below:
```
MariaDB [(none)]> GRANT ALL ON seat.* to seat@localhost IDENTIFIED BY 's_p3rs3c3r3tp455w0rd';
Query OK, 0 rows affected (0.00 sec)
```
In the example above, we have effectively declared that SeAT will be using the database as `seat:s_p3rs3c3r3tp455w0rd@localhost/seat`.
***
**NOTE** Remember the password for the `seat` database user as we will need it later to configure SeAT.
***

### php & apache
SeAT is written in PHP, and therefore we need to install the PHP interpreter. We also need to install a web server that will allow us to server the web front end that comes with SeAT.

So, install the required packages with:
```
yum install -y httpd php php-mysql php-cli php-mcrypt php-process php-mbstring php-intl php-dom php-gd
```
You may be asked if you want to accept some GPG keys for package verification here. Just say [Y]. Successful installation should end with something like the below:
```
[... snip ...]

Installed:
  httpd.x86_64 0:2.4.6-31.el7.centos.1        php.x86_64 0:5.5.30-1.el7.remi
  php-cli.x86_64 0:5.5.30-1.el7.remi          php-intl.x86_64 0:5.5.30-1.el7.remi
  php-mbstring.x86_64 0:5.5.30-1.el7.remi     php-mcrypt.x86_64 0:5.5.30-1.el7.remi
  php-mysqlnd.x86_64 0:5.5.30-1.el7.remi      php-process.x86_64 0:5.5.30-1.el7.remi
  php-xml.x86_64 0:5.5.30-1.el7.remi
```
Now, we can start apache and configure it automatically start the next time the server boots up:
```
systemctl enable httpd.service
```
Next, we start Apache
```
systemctl start httpd.service
```

### redis
SeAT makes use of [Redis](http://redis.io/) as a cache and message broker for the Queue backend. Installing it is really easy. Do it with:
```
yum install -y redis
```
Next, start it and configure it to autostart next time the server boots up:
```
systemctl enable redis.service
```
```
systemctl start redis.service
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
yum install -y git
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
Application key [s8YzfjB3bBowhZERDl9LxdG7DrgIbrZE] set successfully.
```

### seat permissions
SeAT writes logfiles/cachefiles and other temporary data to the `seat/storage/` directory. That together with the fact that the web content will be hosted by apache means that we need to configure the files permissions to allow SeAT do do its thing.

First, lets ensure that `apache` owns everything in /var/www/seat which is the folder we just downloaded SeAT to:
```
chown -R apache:apache /var/www/seat
```
Next, we will allow Apache to write to the `seat/storage/` directory so that it may manipulate the files in there as needed:
```
chmod -R guo+w /var/www/seat/storage/
```
SeAT is now downloaded and almost ready for use!

### selinux
Many people hate SELinux, primarily due to a misunderstanding of what it does and how it works. SeAT can run perfectly fine with SELinux enabled, and I actually encourage you to leave it enabled. There is however one small settings change required to make everything work as expected.

First, we have to allow apache to make network connections. This is so that we may connect to the EVEAPI, as well as the MySQL database and Redis. We also have to allow Apache to write to disk. So, configure this with:
```
setsebool -P httpd_can_network_connect 1
setsebool -P httpd_unified 1
```
Next, we have to ensure that the files and folders in `/var/www/seat` is correctly labelled in order to prevent SELinux from blocking perfectly normal behaviour. Check this with:
```
restorecon -Rv /var/www/seat
```
Thats it. Pretty painless eh? :)

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

Lets install supervisor, start it and configure it to start automatically the next time the server boots:
```
yum install supervisor -y
```
```
systemctl enable supervisord.service
```

We now have to configure the actual workers that supervisord will manage. We do this by adding a new configuration file to `/etc/supervisord.d/` called `seat.ini` Note that the number of workers that we want to start is set by the `numprocs` settings:
```
[program:seat]
command=/usr/bin/php /var/www/seat/artisan queue:listen --queue=high,medium,low,default --tries 1 --timeout=3600
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
SeAT has a build in schedule for when what should run at which interval. With the cronjob, we are simply telling SeAT to check every minute "is there anything we should be doing?". We will add the cronjob as the `apache` user as this is the user that has had all its [permissions](#seat-permissions) configured earlier.

Open up the crontab for `apache` with:
```
crontab -u apache -e
```
Next, paste the following line at the bottom of the file (remember to check the path if you chose one other that the one in this guide):
```
* * * * * /usr/bin/php /var/www/seat/artisan schedule:run 1>> /dev/null 2>&1
```

### webserver - apache
In order to get the SeAT fronted running, we need to configure Apache to serve our SeAT installs `public/` folder. This is the only folder that should be internet facing. That small `index.php` is the gateway into the application.
The Apache configuration itself will depend on how your server is set up. Generally, virtual hosting is the way to go, and this is what I will be showing here.

If you are not going to use virtual hosting, the easiest to get going will probably to symlink `/var/www/seat/public/` to `/var/www/html/seat` and configuring apache to `AllowOverride All` in the `<Directory "/var/www/html">` section. This should have SeAT available at http://your-host-name-or-ip/seat after you restart apache.

#### virtual host setup
Getting the virtual host setup is as simple as creating a new configuration file (I usually call it the `sites-domain.conf`), and modifying it to match your setup. Everywhere you see `seat.local` as the hostname in the below examples it needs to be substituted to your actual domain.

We symlink the SeAT public directory with:
```
ln -s /var/www/seat/public /var/www/html/seat.local
```

Next, we have to configure Apache itself to know about the directories and stuff SeAT needs. We need to create that `sites-domain.conf` file I mentioned. This file should live in `/etc/httpd/conf.d`, so lets change directories there:
```
cd /etc/httpd/conf.d
```
Now, create the conf file. In my case, the domain is `seat.local`, so I will call it `seat.local.conf`. Add the following contents to that file:
```
<VirtualHost *:80>
    ServerAdmin webmaster@your.domain
    DocumentRoot "/var/www/html/seat.local"
    ServerName seat.local
    ServerAlias www.seat.local
    ErrorLog "logs/seat.local-error_log"
    CustomLog "logs/seat.local-access_log" common
    <Directory "/var/www/html/seat.local">
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
</VirtualHost>
```
With our config file created, we need to restart apache to read the new file:
```
apachectl restart
```
That should be it from a configuration perspective. We can confirm that everything is configured correctly by running:

Thats it! SeAT should now be available at http://your-domain-or-ip/
