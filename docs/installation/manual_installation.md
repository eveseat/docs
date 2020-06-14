![SeAT](https://i.imgur.com/aPPOxSK.png)

# Manual Installation

This guide attempts to explain how to manually install SeAT onto an **Ubuntu** Server.
A small amount of Linux experience is preferred when it comes to this guide, although it is not entirely mandatory.

!!! info

    This guide has been written targetting Ubuntu. However, you can use it to deploy SeAT on any linux distribution.
    Just be sure you adapt commands to targetted distribution (mostly those related to the package manager).

!!! hint

    Before starting to do anything, be sure you read the complete workflow once.
    It will help you to understand all steps from the installation process.

!!! note "Eve Application and ESI"

    SeAT consumes CCP's [ESI](https://esi.evetech.net/) service in order to retrieve EVE Online related information.
    Before you can make any authenticated calls to ESI, you have to register a third party EVE application on the [developers portal](developers.eveonline.com/).
    This is an absolute must for SeAT to be of any use. The configuration of this step is covered in a later stage of the documentation.

## Getting started

We are going to assume you have root access to a fresh Ubuntu Server.
Typically access is gained via SSH.
All of the below commands are to be entered in the SSH terminal session for the installation & configuration of SeAT.
If the server you want to install SeAT on is being used for other things too (such as hosting MySQL databases and or websites), then please keep that in mind while following this guide.

Packages are installed using the `aptitude` package manager as the `root` user.

## OS Installation

### Operating System

Before we get to installing SeAT, lets ensure that your operating system is up to date. We can do that with basics :

- `apt-get update` to refresh the repositories cache.
- `apt-get full-upgrade` to update any installed packages.
- `reboot` in order to ensure any updated software is the current running version.
- `apt-get autoremove` (after the reboot) to cleanup any unneeded packages.

### Database

SeAT relies **heavily** on a database to function. Everything it learns is stored here, along with things such as user accounts for your users.
It comes without saying that database security is a very important aspect too. So, ensure that you choose very strong passwords for your installation where required.

This document describes using MariaDB, but you can use MySQL as well. Just double check the [requirements](requirements.md).

We need to ensure that we have the latest MariaDB installed. To help with this, MariaDB provides an official repository to get the latest versions.
Let's add this repository with:

```bash
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash
```

With the repository now setup, lets install the database server:

!!! warning

        During the installation, you may be asked to set a password for the `root` MariaDB user account.
        Make sure you set a long, strong password and remember it. It will be needed for the next step.

```bash
apt-get install mariadb-server
```

Next, we are going to secure the database server by removing anonymous access and setting a `root` password (if you have not been prompted for it yet).

!!! note

    The database `root` password should not be confused with the operating systems `root` passwords. They are both completely different.
    They should also not have the same password.

To secure the database, run:

```bash
mysql_secure_installation
```

This will ask you a series of questions where you should generally just answer yes to. If you already set a `root` password in the previous step then you dont have to set it again, otherwise, make sure you choose a long, strong password for the `root` account. An example run is shown below:

```bash
[...]

Enter current password for root (enter for none):  IF ONE WAS SET, IGNORE THIS
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

Next, we need to create an actual user and database for SeAT to use on the newly installed server. To do this we use the `mysql` command line client and enter a few commands as the `root` user to create the database and the user that will be accessing the server. Let get to it.

Fire up the `mysql` client as root by running:

```bash
mysql -uroot -p
```

This will prompt you for a password. Use the password you configured for the `root` account when we ran `mysql_secure_installation`. This will most probably be the last time you need to use this password :)

If the password was correct, you should see a prompt similar to the one below:

```bash
root@ubuntu:~# mysql -uroot -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 16
Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```

Create a new database for SeAT to use with:

```bash
create database seat;
```

The output should be similar to the below:

```bash
MariaDB [(none)]> create database seat;
Query OK, 1 row affected (0.00 sec)
```

Next, we  need to create the user that SeAT itself will use to connect and use the new `seat` database:

```bash
GRANT ALL ON seat.* to seat@localhost IDENTIFIED BY 's_p3rs3c3r3tp455w0rd';
```

Of course, you need to replace `s_p3rs3c3r3tp455w0rd` with your own unique and strong password.
Successfully running this should present you with output similar to the below:

```bash
MariaDB [(none)]> GRANT ALL ON seat.* to seat@localhost IDENTIFIED BY 's_p3rs3c3r3tp455w0rd';
Query OK, 0 rows affected (0.00 sec)
```

In the example above, we have effectively declared that SeAT will be using the database as `seat:s_p3rs3c3r3tp455w0rd@localhost/seat`.

Finally, we will flush the database server privileges:

```bash
FLUSH PRIVILEGES;
```

That concludes the database server setup. You can exit the prompt with `exit`;

!!! note

    Remember the password for the `seat` database user as we will need it later to configure SeAT.

### PHP

Since SeAT is written primarily in PHP, we will need to install PHP packages. Ubuntu based systems can make use of the [ondrej PPA](https://launchpad.net/~ondrej/+archive/ubuntu/php) which is a very popular repository used for specific PHP versions.

Depending on the version of Ubuntu you are using, a release specific repository URL should be used for the PPA. Select the tab applicable to your Ubuntu version and run the commands within.

=== "Bionic 18.04"
    ```bash
    echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" >> /etc/apt/sources.list.d/php.list
    echo "deb-src http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" >> /etc/apt/sources.list.d/php.list
    ```

=== "Focal 20.04"
    ```bash
    echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main" >> /etc/apt/sources.list.d/php.list
    echo "deb-src http://ppa.launchpad.net/ondrej/php/ubuntu focal main" >> /etc/apt/sources.list.d/php.list
    ```

Next, we will have to download the new repositories GPG signing key and add it into our keychain

```bash
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 4F4EA0AAE5267A6C
```

With the new repository configured, update the package lists with:

```bash
apt-get update
```

Finally, install the required PHP packages with:

```bash
apt-get install libpng-dev libfreetype6-dev libjpeg-dev
apt-get install curl openssl zip php7.3-bz2 php7.3-cli php7.3-curl php7.3-dom php7.3-gd php7.3-gmp php7.3-intl php7.3-mbstring php7.3-mysql php7.3-opcache php7.3-redis php7.3-zip
```

### Redis

SeAT makes use of [Redis](http://redis.io/) as a cache and message broker for the Queue back end. Installing it is really easy. Do it with:

```bash
apt-get install redis-server
```

!!! hint

    By default, redis is making backup from its database - so it ensure integrity in case of failure.
    However, in certain condition, like power outage, this backup might be unprocessable and avoid redis to run.
    
    Since we don't store anything critical in it, you may want to disable this. To do so, edit the configuration file
    using `nano /etc/redis/redis.conf` and search line `appendonly no`, change it for `appendonly yes`
    
    If you are on a small server, You may also want to limit the part of memory used by redis (by default, it will consume all available memory).
    To do so, into the redis configuration file, search line `# maxmemory <bytes>` and change it for `maxmemory xGB` where `x` is the memory limit you want to set.

## SeAT Installation

### Prerequisites

Excellent progress! All of the operating system level requirements are now met and we are almost ready to install SeAT itself. The only thing that is outstanding is the package manager called `composer` as well as the `git` client. The combination of `composer` and `git` will let us download the SeAT source code from Github and install it locally.

#### Git

Install `git` with:

```bash
apt-get install git
```

#### Composer

Next, install `composer` with:

```bash
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && hash -r
```

Thats it. Lets install SeAT! By default, we suggest you run SeAT from within `/var/www/seat`. As part of the installation, the `seat` directory will be created for us, but we will need to create `/var/www` for now as we have not yet configured the web server.

Create the `www` directory with:

```bash
mkdir -p /var/www
```

Next, `cd` to the new `/var/www` directory with:

```bash
cd /var/www
```

### SeAT Download

With all of the prerequisites installed as well as our `www` directory ready we can finally download SeAT. Do that with:

```bash
composer create-project eveseat/seat --no-dev --no-interaction
```

Once the download is done, you should have seen output such as:

```
Writing lock file
Generating optimized autoload files
> Illuminate\Foundation\ComposerScripts::postAutoloadDump
> @php artisan package:discover
Discovered Package: darkaonline/l5-swagger
Discovered Package: eveseat/api
Discovered Package: eveseat/console
Discovered Package: eveseat/eveapi
Discovered Package: eveseat/notifications
Discovered Package: eveseat/services
Discovered Package: eveseat/web
Package manifest generated successfully.
> @php artisan key:generate
Application key [base64:CmhqYNkaIcHo8nYC8LiEWa3U5/+BiTLih5dZftxlV2k=] set successfully.
```

#### Permissions

You may have noticed a warning about `composer` running as `root`. For now this can be safely ignored. Post the installation of the SeAT source code, we need to fix up the permissions of the downloaded files. Do that with:

```bash
chown -R www-data:www-data /var/www/seat
chmod -R guo+w /var/www/seat/storage/
```

This will ensure that the web server, cron jobs and workers have access to the source code as well as logs.

### SeAT Setup

With SeAT downloaded, we need to configure it. There are a number of configuration tasks needed. These include editing the applications `.env` file as well as running some commands that setup and seed the database. A configuration value reference can be found [here].

#### .env setup

The first task would be to configure the applications database connection. Open the file located at `/var/www/seat/.env` with something like `vi` or `nano` and update the database options with your values. Typically, only the password would really need to be updated. If you are making use of an existing database somewhere else over the network, update the applicable fields such as `DB_HOST` accordingly.

```yaml
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=seat
DB_USERNAME=seat
DB_PASSWORD=s_p3rs3c3r3tp455w0rd # <-- this is the value you probably need to edit.
DB_DEBUG=false
```

#### Database Migrations and Seeds

Next we need to publish the database migrations and web assets (such as JavaScript scripts and CSS Style sheets), run those migrations and finally seed the SeAT job schedule.

Publish the assets and database migrations with:

```bash
sudo -H -u www-data bash -c 'php /var/www/seat/artisan vendor:publish --force --all'
```

Run the database migrations with:

```bash
sudo -H -u www-data bash -c 'php /var/www/seat/artisan migrate'
```

Seed the SeAT schedule with:

```bash
sudo -H -u www-data bash -c 'php /var/www/seat/artisan db:seed --class=Seat\\Console\\database\\seeds\\ScheduleSeeder'
```

#### EVE Sde Update

SeAT makes use of a number of tables from the EVE [Static Data Exports](https://developers.eveonline.com/resource/resources). MySQL conversions of this data is available at [https://www.fuzzwork.co.uk/dump/](https://www.fuzzwork.co.uk/dump/) and used in SeAT.

To update to the [latest SDE](https://github.com/eveseat/resources/blob/master/tools/generate_sde_json.php#L22) within SeAT, run:

```bash
sudo -H -u www-data bash -c 'php /var/www/seat/artisan eve:update:sde'
```

### Supervisor

The jobs ecosystem within SeAT requires a process supervisor to ensure that the job runner stays alive. The job runner itself is implemented using [Laravel Horizon](https://horizon.laravel.com/) and is monitored using [supervisord](http://supervisord.org/).

To configure the Horizon process monitor, first install `supervisor`:

```bash
apt-get install supervisor
```

Next, we will create a dedicated configuration file which will ask supervisor to keep an eye on Horizon. This file will live in `/etc/supervisor/conf.d/seat.conf`. Create this file with its recommended configuration with:

```bash
cat > /etc/supervisor/conf.d/seat.conf << EOL
[program:seat]
command=/usr/bin/php /var/www/seat/artisan horizon
process_name = %(program_name)s-80%(process_num)02d
stdout_logfile = /var/log/seat-80%(process_num)02d.log
stdout_logfile_maxbytes=100MB
stdout_logfile_backups=10
numprocs=1
directory=/var/www/seat
stopwaitsecs=600
user=www-data
EOL
```

Finally, reload supervisor to apply the new configuration with the following command:

```bash
systemctl restart supervisor.service
```

### Crontab

A crontab entry is needed for SeAT. While simple in implementation, this crontab entry simply helps the application invoke a job checker very minute. The _actual_ schedule is stored within SeAT itself and managed entirely via the Web Interface.

To configure the crontab entry required for SeAT, run the following commands:

```bash
echo '* * * * * php /var/www/seat/artisan schedule:run >> /dev/null 2>&1' > /tmp/seat-crontab.tmp
```

Next, add this crontab for the `www-data` user with:

```bash
crontab -u www-data /tmp/seat-crontab.tmp
```

If you want to confirm that the crontab successfully installed, you can check it with `crontab -u www-data -l`.

### Web Server

!!! note "Almost there!"
        You almost made it to the end! Just one more step.

The SeAT web interface requires a web server to serve the HTML goodies it has. We highly recommend you to use `nginx` and will be covered in this document. You don't **have** to use it, so if you prefer something else, feel free.

#### Nginx Install

Together with an `nginx` installation we also need to install `php-fpm` to handle the PHP execution for us. Let's install `nginx` and `php-fpm` with:

```bash
apt-get install nginx php7.3-fpm
```

#### Nginx Configuration

With the webserver installed, we need to configure `nginx` to serve SeAT. For that, a configuration file needs to be created that will tell `nginx` where to find `php-fpm` as well as where the assets are for SeAT.

The configuration file will live at `/etc/nginx/sites-available/seat`. It can be created with the following command:

```bash
cat > /etc/nginx/sites-available/seat << EOL
server {

    listen 80;
    listen [::]:80;

    # If you are hosting this instance on a domain, set that
    # name here.
    #server_name  seat.yourdomain.com;

    # SeAT public directory. This is the only directory that
    # should be exposed by the webserver. If one has to expose
    # the parent directory then things like the .env file will
    # be available for anyone to download.
    root /var/www/seat/public;

    index index.php;

    location / {
       try_files \$uri \$uri/ /index.php?\$query_string;
    }

    # PHP-FPM configuration.
    location ~ \.php\$ {
       try_files \$uri /index.php =404;
       fastcgi_pass unix:/run/php/php7.1-fpm.sock;
       fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
       include fastcgi_params;
    }

    # Even though .htaccess rules mean nothing in the nginx
    # world, prevent those from being downloaded anyways.
    location ~ /\.ht {
       deny all;
    }

    # In case someone messes up, prevent .env files from
    # being downloaded as well.
    location ~ /\.env {
       deny all;
    }
}
EOL
```

!!! warning

    The upper provided text is a script, it must be executed as is. You'll not get the same result if you're only copying the configuration part.

The configuration file as is at `/etc/nginx/sites-available/seat` itself won't be loaded by `nginx` yet. Storing configuration files in a `*sites-available*` directory is simply a convention used to allow administrators to quickly add & remove sites if needed. To *apply* the changes made by the new configuration file it needs to be symlinked to a `*sites-enabled*` directory.

Let's symlink to the new configuration and drop the default one as a hardening exercise at the same time:

```bash
ln -s /etc/nginx/sites-available/seat /etc/nginx/sites-enabled/seat
rm /etc/nginx/sites-enabled/default
```

Finally, reload `nginx` and `php-fpm` for the new changes to take affect:

```bash
systemctl restart nginx.service
systemctl restart php7.3-fpm.service
```

## ESI Configuration

As mentioned at the start of the guide, it is necessary for you to configure ESI.
For instructions how to do this, please refer to the [ESI Setup Guide].

!!! info

    You may want to serve your SeAT installation over SSL (using HTTPS) - which is a recommanded behavior.
    There are many way to do it, you can have a look on Let's Encrypt which provide you valid certificates for free.
    Put an eye to their [Certbot Documentation].

!!! success

    You made it! Use a browser and browse to the IP address / hostname of your server to access SeAT!

[here]: ../configuration/env_file_reference.md
[ESI Setup Guide]: ../configuration/esi_configuration.md
[Certbot Documentation]: https://certbot.eff.org