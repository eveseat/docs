![SeAT](http://i.imgur.com/aPPOxSK.png)

This guide attempts to explain how to manually install SeAT onto an **Ubuntu** Server.
A small amount of Linux experience is preferred when it comes to this guide, all though it is not entirely mandatory.
This guide assumes you want all of the available SeAT components installed (which is the default).

### getting started
We are going to assume you have root access to a fresh Ubuntu Server. Typically access is gained via SSH.
All of the below commands are to be entered in the SSH terminal session for the installation & configuration of SeAT.
If the server you want to install SeAT on is being used for other things too (such as hosting MySQL databases and or websites),
then please keep that in mind while following this guide.

Packages are installed using the `aptitude` package manager as the `root` user.

### table of contents
 1. [Eve Application](#eve-application)
 2. [Basics](#basics)
 3. [Database](#database)
 4. [PHP](#php)
 5. [Redis](#redis)
 7. [SeAT Download](#seat-download)
 8. [SeAT Setup](#seat-setup)
 6. [Supervisor](#supervisor)
 9. [Http Service](#http-service)
 10. [Admin Login](#admin-login)

### Eve Application
SeAT 3.0 is relying on ESI in order to retrieve information and you have to create an `eve application`.
Todo so, open in your favorite browser the portal https://developers.eveonline.com and login using the button on top right corner.
Once done, on the top menu, click on `applications` then create a new one with `create new application` button.
Fill the initial form with whatever you want (`name` and `description`) but keep in mind that those information will be showed to the user while they sign in.
Inside `Connection Type` section, check `Authentication & API Access` and add scopes from which you want information. (you need only those starting by `esi`).
In `Callback URL` section, put `http://yourserver/auth/eve/callback` where `yourserver` is either a domain or an IP pointing to the server where SeAT will be installed.
Finally, click on `Create application` button, back to `applications` and near the created application, hit the `view application` button.

Take a not of the provided information `Client ID`, `Secret Key`, `Callback URL` which will be required at a later stage in this documentation.

### Basics
We will ensuring that your system is up to date before starting with package installation. So, let's start with basics :
`apt-get update` which will refresh repositories cache
`apt-get upgrade` which will update any installed package in an outdated version
`apt-get dist-upgrade` which will update the kernel if any new is available
`reboot` in order to load the new installed kernel
`apt-get autoremove` (after the reboot) to drop any vanilla packages (including old kernel)

**DISCLAIMER**
> Running `apt-get dist-upgrade` can also lead to a distribution major update in case you've updated your repository list
> Before running it, ensure you've no pending upgrade from your system (in case you've no any idea about what we're talking,
> there are height chance that you're not concerned)

### database
SeAT relies **heavily** on a database to function.
Everything it learns is stored here, along with things such as user accounts for your users etc.
It comes without saying that database security is a very important aspect too.
So, ensure that you choose very strong passwords for your installation where required.

This document is using MariaDB, but you can use MySQL as well. Double check requirements. ;)

`curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash` this script provided by MariaDB team will setup your repositories properly

**NOTICE**
> At the time when this documentation has been redacted, MariaDB is not available on the newly LTS 18.04 Bionic
> The package version available on main repository does not meet minimum requirement as SeAT 3.0 is requiring 10.2.7 or
> higher whereas official repository is providing 10.1.29. If you're concerned, you unfortunately have to wait for an
> update or use MySQL 5.7 or higher.

Lets install the database server:

```
apt-get install mariadb-server
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
That concludes the installation of the database server and securing it.
Next, we need to create an actual database for SeAT to use on the server.
For that we need to use the MySQL command line client and enter a few commands to create the database and the user that will be accessing it.
Let get to it.

Fire up the MySQL client by running:
```
mysql -uroot -p
```

This will prompt you for a password.
Use the password you configured for the `root` account when we ran `mysql_secure_installation`.
This will most probably be the last time you need to use this password :)
If the password was correct, you should see a prompt similar to the one below:

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

Of course, you need to replace `s_p3rs3c3r3tp455w0rd` with your own.
Successfully running this should present you with output similar to the below:
```
mysql> GRANT ALL ON seat.* to seat@localhost IDENTIFIED BY 's_p3rs3c3r3tp455w0rd';
Query OK, 0 rows affected (0.00 sec)
```

In the example above, we have effectively declared that SeAT will be using the database as `seat:s_p3rs3c3r3tp455w0rd@localhost/seat`.
Finally, we will reload sql server permission cache
```
FLUSH PRIVILEGES;
```

***
**NOTE** Remember the password for the `seat` database user as we will need it later to configure SeAT.
***

### PHP
Since SeAT is a PHP application, we will of course need to install php packages.
For now, we're relying on PHP 7.1 due to issues with Laravel on PHP 7.2 on some methods.
We will add ondrej PPA which is very popular and providing most of php versions.

Let's start by using your favorite editor and creating file `/etc/apt/source.list.d/php.list` (`nano` or `vi` are working very well for such things).
Inside the newly created file, simply past the block bellow :

<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#phpppa_xenial">Xenial 16.04</a></li>
<li><a data-toggle="tab" data-target="#phpppa_artful">Artful 17.10</a></li>
<li><a data-toggle="tab" data-target="#phpppa_bionic">Bionic 18.04</a></li>
</ul>
<div class="tab-content">
<div id="phpppa_xenial" class="tab-pane fade in active" markdown="1">
```
deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main
deb-src http://ppa.launchpad.net/ondrej/php/ubuntu xenial main
```
</div>
<div id="phpppa_artful" class="tab-pane fade in active" markdown="1">
```
deb http://ppa.launchpad.net/ondrej/php/ubuntu artful main
deb-src http://ppa.launchpad.net/ondrej/php/ubuntu artful main
```
</div>
<div id="phpppa_bionic" class="tab-pane fade in active" markdown="1">
```
deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main
deb-src http://ppa.launchpad.net/ondrej/php/ubuntu bionic main
```
</div>
</div>

Then, we will have to download the repository GPG key and adding it into our trusted outfit
`apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 4F4EA0AAE5267A6C`

Update our repository cache
`apt-get update`

And finally, install php packages with SeAT dependencies
`apt-get install curl zip php7.1 php7.1-mysql php7.1-mcrypt php7.1-intl php7.1-curl php7.1-gd php7.1-mbstring php7.1-bz2 php7.1-dom php7.1-zip`

### Redis
SeAT makes use of [Redis](http://redis.io/) as a cache and message broker for the Queue backend.
Installing it is really easy. Do it with:
`apt-get install redis-server`

### SeAT Download
Here we go, all requirements are now met. We will start installing SeAT ♥.
Start with git and composer which will handle our php package dependencies and download SeAT from our repositories.
`apt-get install git`
`curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && hash -r`

Move to www directory with `cd /var/www` and download SeAT using `composer create-project eveseat/seat --no-dev --stability=beta`.
Then, we will add a dedicated user for security reason and in order to distinguish SeAT processes easier.
`adduser --group --no-create-home --system --disabled-login seat`
`chown seat:seat -R /var/www/seat`

Fix read and write access to storage directory which will store backups, logs, cache and so more
`chmod -R guo+w /var/www/seat/storage`

### SeAT Setup

Now, we will edit SeAT main configuration file `.env`. To do so, I'll use `nano`.
`nano /var/www/seat/.env`

Update it with information you get early in the process. Refer to the table bellow in order to get each parameter description.

| Parameter Name | Default value | Description |
|-------------------|--------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DB_HOST | 127.0.0.1 | This is the IP or domain from your SQL Server. |
| DB_PORT | 3306 | This is the port used by your SQL Server to receive query. |
| DB_DATABASE | seat | This is the name for your SeAT database. |
| DB_USERNAME | seat | This is the user which is granted to the SeAT database from SeAT server. |
| DB_PASSWORD | secret | This is the user password |
| MAIL_DRIVER | smtp | This is the driver used to send mail. It will be covered in a dedicated article. |
| MAIL_HOST | smtp.mailtrap.io | This is driver mail hostname. It will be covered in a dedicated article. |
| MAIL_PORT | 2525 | This is the driver mail port. It will be covered in a dedicated article. |
| MAIL_USERNAME | null | This is the driver mail username. It will be covered in a dedicated article. |
| MAIL_PASSWORD | null | This is the driver mail password. It will be covered in a dedicated article. |
| MAIL_ENCRYPTION | null | This is the driver mail encryption. It will be covered in a dedicated article. |
| MAIL_FROM_ADDRESS | noreply@localhost.local | This is the mail address which the user will chown when he will receive mail from SeAT. |
| MAIL_FROM_NAME | SeAT Administrator | This is the name which the user will chown when he will receive mail from SeAT. |
| EVE_CLIENT_ID | null | This is the EVE Application Client ID you'll get when you created an application over https://developers.eveonline.com |
| EVE_CLIENT_SECRET | null | This is the EVE Application Client Secret you'll get when you created an application over https://developers.eveonline.com |
| EVE_CALLBACK_URL | https://seat.local/auth/eve/callback | This is the EVE Application Callback URL you filled when you created an application over https://developers.eveonline.com. You should have only to fix `seat.local` |

Now, we will publish assets and seed SeAT database. Let's do this with the following commands :
`sudo -H -u seat bash -c 'php artisan vendor:publish --force --all'` this will publish all package assets, including horizon
`sudo -H -u seat bash -c 'php artisan migrate'` it will generate SeAT database structure
`sudo -H -u seat bash -c 'php artisan db:seed --class=Seat\\Services\\database\\seeds\\ScheduleSeeder'` this will seed the scheduling table used for jobs
`sudo -H -u seat bash -c 'php artisan eve:update-sde'` it will download latest SDE data

### Supervisor
We're relying over supervisor in order to keep Horizon process up. Horizon is the new queue backend in SeAT 3.0 and
get a tons of love compared to the previous one.

`apt-get install supervisor`

Now, we will create a dedicated configuration file which will ask supervisor to keep an eye over Horizon.
`nano /etc/supervisor/conf.d/seat.conf`

Put inside the newly created file the content bellow :
```
[program:seat]
command=/usr/bin/php /var/www/seat/artisan horizon
process_name = %(program_name)s-80%(process_num)02d
stdout_logfile = /var/log/seat-80%(process_num)02d.log
stdout_logfile_maxbytes=100MB
stdout_logfile_backups=10
numprocs=1
directory=/var/www/seat
stopwaitsecs=600
user=seat
```

Reload supervisor using the following command :
`service supervisor restart`

Finally, setup crontab for SeAT with :
`crontab -u seat -e`
And seed the tab with the following :
`* * * * * php /var/www/seat/artisan schedule:run`

### Http Service
We will rely over an http service in order to serve SeAT layouts to our user.
We widely encourage you to use nginx, which will be covered by that documentation. But again, you can use whatever you used to :)

Let's install nginx :
`apt-get install nginx php7.1-fpm`

Duplicate the standard www pool configuration file from PHP-Fpm to a dedicated SeAT pool :
`cp /etc/php/7.1/fpm/pool.d/www.conf /etc/php/7.1/pool.d/seat.conf`

Then, update the newly created pool with some adequate values :
`nano /etc/php/7.1/pool.d/seat.conf`

| initial value | new value |
|-----------------------------------|-----------------------------|
| [www] | [seat] |
| user = www-data | user = seat |
| group = www-data | group = seat |
| listen = /run/php/php7.1-fpm.sock | listen = /run/php/seat.sock |

Once done, you can create a new configuration file into nginx to server SeAT :
`nano /etc/nginx/site-availables/seat`

And put the content bellow inside
```
server {
    listen 80;
    listen [::]:80;

    root /var/www/seat/public;

    index index.htm index.html index.php;

    location / {
       try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
       try_files $uri =404;
       fastcgi_pass unix:/run/php/seat.sock;
       fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
       include fastcgi_params;
    }

    location ~ /\.ht {
       deny all;
    }
}
```

Let's symlink to the active config and drop the default one :
`ln -s /etc/nginx/sites-availabe/seat /etc/nginx/sites-enabled/seat`
`rm /etc/nginx/sites-enabled/default`

Finally, reload services :
`service php7.1-fpm reload`
`service nginx reload`

### Admin Login
Since SeAT 3.0, admin user is a real dedicated user and you'll non longer be able to link character or corporation to him.
Of course, you're still free to add any other user to `Superuser` group, but...

To login as an administrator, simply run the following command :
`sudo -H -u seat bash -c 'php artisan seat:admin:login'`

You'll get a link after the command which is looking like the one bellow :
`http://yourserver/auth/login/admin/somerandomstring`

Copy it and paste it inside your favorite browser. It's done, you're authenticated as admin user.