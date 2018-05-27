![SeAT](https://i.imgur.com/aPPOxSK.png)

!!! warning "CentOS Version"
    This guide only caters for CentOS 7. If you _really_ want to run CentOS 6, you would either need to adapt this installation guide with the appropriate init scripts, or use the SeAT tool for installation.

# Centos 7

This guide attempts to explain how to manually install SeAT onto a **CentOS** Server. A small amount of Linux experience is preferred when it comes to this guide, although it is not entirely mandatory.

## Getting started

We are going to assume you have root access to a fresh CentOS Server. Typically access is gained via SSH. All of the below commands are to be entered in the SSH terminal session for the installation & configuration of SeAT. If the server you want to install SeAT on is being used for other things too (such as hosting MySQL databases and or websites), then please keep that in mind while following this guide.

Packages are installed using the `yum` package manager as the `root` user.

!!! note "Eve Application and ESI"

        SeAT 3.0 consumes CCP's [ESI](https://esi.evetech.net/) service in order to retrieve EVE Online related information. Before you can make any authenticated calls to ESI, you have to register a third party EVE application on the developers portal. This is an absolute must for SeAT to be of any use. The configuration of this step is covered in a later stage of the documentation.

## OS Installation

### Operating System

Before we get to installing SeAT, lets ensure that your operating system is up to date. We can do that with basics :

- `yum update` to update any installed packages.
- `reboot` in order to ensure any updated software is the current running version.

### Repositories

Due to the nature of CentOS's packaging and the limitations in getting 'bleeding edge' software with it, we need to add some extra software repositories in order to get SeAT running. The repositories used are the [Fedora EPEL](https://fedoraproject.org/wiki/EPEL) repository, [Remi](http://rpms.famillecollet.com/) repository as well as the MariaDB repository.

Install and configure the required repositories with the following commands:

#### EPEL

```bash
# Download and install EPEL
EPEL=epel-release-latest-7.noarch.rpm && curl -O https://dl.fedoraproject.org/pub/epel/$EPEL && yum localinstall -y $EPEL && rm -f $EPEL

# Import signing key
rpm --import "http://download.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7"
```

#### Remi

```bash
# Download and install Epel
REMI=remi-release-7.rpm && curl -O http://rpms.remirepo.net/enterprise/$REMI && yum localinstall -y $REMI && rm -f $REMI

# Import signing key
rpm --import http://rpms.remirepo.net/RPM-GPG-KEY-remi
```

#### MariaDB

```bash
# Configure the MariaDB repository
curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash
```

#### Repository Configurations

Only a small amount of configuration is needed after installing these repositories. Basically, we just want to enable PHP 7.1 for use with SeAT. So, do that with:

```bash
yum install yum-utils -y && yum-config-manager --enable remi,remi-php71
```

### Database

SeAT relies **heavily** on a database to function. Everything it learns is stored here, along with things such as user accounts for your users. It comes without saying that database security is a very important aspect too. So, ensure that you choose very strong passwords for your installation where required.

This document describes using MariaDB, but you can use MySQL as well. Just double check the requirements.

Lets install the database server:

```bash
yum install mariadb-server
```

With the database server installed, lets start it and configure it to automatically start up the next time our server boots up:

```bash
systemctl enable mariadb.service && systemctl start mariadb.service
```

Next, we are going to secure the database server by removing anonymous access and setting a `root` password.

!!! note

    The database `root` password should not be confused with the operating systems `root` passwords. They are both completely different. They should also share be the same password.

To secure the database, run:

```bash
mysql_secure_installation
```

This will ask you a series of questions where you should generally just answer yes to. An example run is shown below:

```bash
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

Since SeAT is written primarily in PHP, we will need to install PHP packages. Currently only PHP 7.1 is supported (and is already enabled via the Remi repository earlier in this guide) due to issues with Laravel (the framework SeAT is built on) and PHP 7.2. This should change in the very near future.

Install the required PHP packages now with:

```bash
yum install -y php php-cli php-mysqlnd php-posix php-mcrypt php-process php-mbstring php-intl php-dom php-gd unzip
```

### Redis

SeAT makes use of [Redis](http://redis.io/) as a cache and message broker for the Queue back end. Installing it is really easy. Do it with:

```bash
yum install -y redis
```

Next, start it and configure it to auto start next time the server boots up:

```bash
systemctl enable redis.service && systemctl start redis.service
```

## SeAT Installation

### Prerequisites

Excellent progress! All of the operating system level requirements are now met and we are almost ready to install SeAT itself. The only thing that is outstanding is the package manager called `composer` as well as the `git` client. The combination of `composer` and `git` will let us download the SeAT source code from Github and install it locally.

#### Git

Install `git` with:

```bash
yum -y install git
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
composer create-project eveseat/seat --no-dev --stability=beta
```

Once the download is done, you should have seen output such as:

```bash
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
chown -R nginx:nginx /var/www/seat
chmod -R guo+w /var/www/seat/storage/
```

This will ensure that the web server, cron jobs and workers have access to the source code as well as logs.

### SELinux

Many people hate SELinux, primarily due to a misunderstanding of what it does and how it works. SeAT will run perfectly fine with SELinux enabled, and I actually encourage you to leave it enabled. There is however one small settings change required to make everything work as expected.

First, we have to allow web servers to make network connections. This is so that we may connect to ESI, as well as the MariaDB database and Redis. We also have to allow nginx to write to disk. So, configure this with:

```bash
setsebool -P httpd_can_network_connect 1
setsebool -P httpd_unified 1
```

Next, we have to ensure that the files and folders in `/var/www/seat` is correctly labelled in order to prevent SELinux from blocking perfectly normal behaviour. Do this with:

```bash
restorecon -Rv /var/www/seat
```

That is really it. Pretty painless eh?

### SeAT Setup

With SeAT downloaded, we need to configure it. There are a number of configuration tasks needed. These include editing the applications `.env` file as well as running some commands that setup and seed the database. A configuration value reference can be found [here](/guides/admin/env_reference/).

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
sudo -H -u nginx bash -c 'php /var/www/seat/artisan vendor:publish --force --all'
```

Run the database migrations with:

```bash
sudo -H -u nginx bash -c 'php /var/www/seat/artisan migrate'
```

Seed the SeAT schedule with:

```bash
sudo -H -u nginx bash -c 'php /var/www/seat/artisan db:seed --class=Seat\\Services\\database\\seeds\\ScheduleSeeder'
```

#### EVE Sde Update

SeAT makes use of a number of tables from the EVE [Static Data Exports](https://developers.eveonline.com/resource/resources). MySQL conversions of this data is available at [https://www.fuzzwork.co.uk/dump/](https://www.fuzzwork.co.uk/dump/) and used in SeAT.

To update to the [latest SDE](https://github.com/eveseat/resources/blob/master/tools/generate_sde_json.php#L22) within SeAT, run:

```bash
sudo -H -u nginx bash -c 'php /var/www/seat/artisan eve:update:sde'
```

### Supervisor

The jobs ecosystem within SeAT requires a process supervisor to ensure that the job runner stays alive. The job runner itself is implemented using [Laravel Horizon](https://horizon.laravel.com/) and is monitored using [supervisord](http://supervisord.org/).

To configure the Horizon process monitor, first install `supervisor`:

```bash
yum install -y supervisor
```

Next, we will create a dedicated configuration file which will ask supervisor to keep an eye on Horizon. This file will live in `/etc/supervisord.d/seat.ini`. Create this file with its recommended configuration with:

```bash
cat > /etc/supervisord.d/seat.ini << EOL
[program:seat]
command=/usr/bin/php /var/www/seat/artisan horizon
process_name = %(program_name)s-80%(process_num)02d
stdout_logfile = /var/log/seat-80%(process_num)02d.log
stdout_logfile_maxbytes=100MB
stdout_logfile_backups=10
numprocs=1
directory=/var/www/seat
stopwaitsecs=600
user=nginx
EOL
```

Finally, start `supervisord` and make sure it will auto start next time the server boots up with: 

```bash
systemctl enable supervisord && systemctl restart supervisord
```

### Crontab

A crontab entry is needed for SeAT. While simple in implementation, this crontab entry simply helps the application invoke a job checker very minute. The _actual_ schedule is stored within SeAT itself and managed entirely via the Web Interface.

To configure the crontab entry required for SeAT, run the following commands:

```bash
echo '* * * * * php /var/www/seat/artisan schedule:run >> /dev/null 2>&1' > /tmp/seat-crontab.tmp
```

Next, add this crontab for the `nginx` user with:

```bash
crontab -u nginx /tmp/seat-crontab.tmp
```

If you want to confirm that the crontab successfully installed, you can check it with `crontab -u nginx -l`.

### Web Server

!!! note "Almost there!"
        You almost made it to the end! Just one more step.

The SeAT web interface requires a web server to serve the HTML goodies it has. We highly recommend you to use `nginx` and will be covered in this document. You don't **have** to use it, so if you prefer something else, feel free.

#### Nginx Install

Together with an `nginx` installation we also need to install `php-fpm` to handle the PHP execution for us. Let's install `nginx` and `php-fpm` with:

```bash
yum install -y nginx php-fpm
```

#### Nginx Configuration

With the webserver installed, we need to configure `nginx` to serve SeAT. For that, a configuration file needs to be created that will tell `nginx` where to find `php-fpm` as well as where the assets are for SeAT.

The configuration file will live at `/etc/nginx/nginx.conf`. It can be created with the following command:

```bash
cat > /etc/nginx/nginx.conf << EOL
# For more information on configuration, see:
#   * Official English Documentation: http://nginx.org/en/docs/
#   * Official Russian Documentation: http://nginx.org/ru/docs/

user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

# Load dynamic modules. See /usr/share/nginx/README.dynamic.
include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                      '\$status \$body_bytes_sent "\$http_referer" '
                      '"\$http_user_agent" "\$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;

    server {

        listen 80 default_server;
        listen [::]:80 default_server;

        # If you are hosting this instance on a domain, set that
        # name here.
        #server_name  seat.yourdomain.com;
        server_name _;

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
        fastcgi_pass 127.0.0.1:9000;
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
}
EOL
```

Next, reload `nginx` and `php-fpm` for the new changes to take affect:

```bash
systemctl restart nginx.service
systemctl restart php-fpm.service
```

### Admin Login

Since SeAT 3.0, an admin user is a special user and can no longer link characters or corporations to it. Using the admin user, you will probably and most typically just add your main character to the Superuser group and never login as an admin again.

To login as an administrator, simply run the following command :

```bash
sudo -H -u nginx bash -c 'php /var/www/seat/artisan seat:admin:login'
```

You'll get a link after the command has finished running which looks similar to the one bellow:

```txt
[root@localhost nginx]# sudo -H -u nginx bash -c 'php /var/www/seat/artisan seat:admin:login'
SeAT Admin Login URL Generator
User 'admin' does not exist. It will be created.
Searching for the 'Superuser' role
Creating the Superuser role
Checking if the Superuser role has the superuser permission
Adding the superuser permission to the role
Checking if 'admin' is a super user
Adding 'admin' to the Superuser role
Generating authentication token

Your authentication URL is valid for 60 seconds.
http://localhost/auth/login/admin/9G3sb8hjMvrbIJrIf10KKtIj1c8e9mL5
```

Copy it and paste it inside your browser and you will be authenticated as the admin user.

!!! warning
        If you have not configured the `APP_URL` setting in the `.env` file, then the admin url will be generated for `localhost`. This is most likely incorrect and you can simply replace `localhost` with your IP address or domain name.

## ESI Configuration

As mentioned at the start of the guide, it is necessary for you to configure ESI. FOr instructions now how to do this, please refer to the [ESI Setup Guide](/guides/installation/basic_installation/esi/).

!!! success
        You made it! Use a browser and browse to the IP address / hostname of your server to access SeAT!
