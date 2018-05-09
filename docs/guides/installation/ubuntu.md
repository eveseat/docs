![SeAT](https://i.imgur.com/aPPOxSK.png)

# Ubuntu

This guide attempts to explain how to manually install SeAT onto an **Ubuntu** Server.
A small amount of Linux experience is preferred when it comes to this guide, all though it is not entirely mandatory.
This guide assumes you want all of the available SeAT components installed (which is the default).

### Getting started
We are going to assume you have root access to a fresh Ubuntu Server. Typically access is gained via SSH.
All of the below commands are to be entered in the SSH terminal session for the installation & configuration of SeAT.
If the server you want to install SeAT on is being used for other things too (such as hosting MySQL databases and or websites), then please keep that in mind while following this guide.

Packages are installed using the `aptitude` package manager as the `root` user.

### Eve Application
SeAT 3.0 consumes ESI in order to retrieve information. Before you can make any authenticated calls to ESI, you have to create an `eve application`. To do so, browse to https://developers.eveonline.com and login using the button on top right corner.
Once done, on the top menu, click on `applications` then create a new one with `create new application` button.

Fill the initial form with whatever you want (`name` and `description`) but keep in mind that this information will be showed to the user while they sign in as well as when they review third party applications that have access to their account information.

 - In the `Connection Type` section, check `Authentication & API Access` and add scopes from which you want information. (you need only those starting by `esi`).
 - In the `Callback URL` section, put `https://yourserver/auth/eve/callback` where `yourserver` is either a domain or an IP pointing to the server where SeAT will be installed.
 - Finally, click on `Create application` button, back to `applications` and near the created application, hit the `view application` button.

Take note of the `Client ID`, `Secret Key`, `Callback URL` fields which will be required at a later stage in this documentation.

### Basics
We will ensuring that your system is up to date before starting with package installation. So, let's start with basics :

 - `apt-get update` to refresh the repositories cache.
 - `apt-get full-upgrade` to update any installed packages.
 - `reboot` in order to ensure any updated software is the current running version.
 - `apt-get autoremove` (after the reboot) to cleanup any unneeded packages.

### Database
SeAT relies **heavily** on a database to function.
Everything it learns is stored here, along with things such as user accounts for your users. It comes without saying that database security is a very important aspect too. So, ensure that you choose very strong passwords for your installation where required.

This document describes using MariaDB, but you can use MySQL as well. Just double check the requirements.

`curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash` this script provided by MariaDB team will setup your repositories properly

!!! warning
    
    At the time when this document was written, MariaDB as not available on Ubuntu 18.04 Bionic.
    The package version available in main repository does not meet minimum requirement as SeAT 3.0 requires at least
    version 10.2.7 or higher whereas official repository only provides 10.1.29. In order to install SeAT,
    use MySQL instead.

Lets install the database server:

```bash
apt-get install mariadb-server
```

Next, we are going to secure the database server by removing anonymous access and setting a `root` password.

!!! note

    The database `root` password should not be confused with the operating systems `root` passwords.
    They are both completely different. They should also not be the same password.

To secure the database, run:

```bash
mysql_secure_installation
```

This will ask you a series of questions, below is how these should be answered:

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
Next, we need to create an actual database for SeAT to use on the server.
For that we need to use the MySQL command line client and enter a few commands to create the database and the user that will be accessing it.
Let get to it.

Fire up the MySQL client by running:

```bash
mysql -uroot -p
```

This will prompt you for a password.
Use the password you configured for the `root` account when we ran `mysql_secure_installation`.
This will most probably be the last time you need to use this password :)

If the password was correct, you should see a prompt similar to the one below:

```bash
[...]
mysql>
```

Lets run the command to create the SeAT database:

```bash
create database seat;
```

The output should be similar to the below:

```bash
mysql> create database seat;
Query OK, 1 row affected (0.00 sec)
```

Next, we create the user that SeAT itself will use to connect and use the `seat` database:

```bash
GRANT ALL ON seat.* to seat@localhost IDENTIFIED BY 's_p3rs3c3r3tp455w0rd';
```

Of course, you need to replace `s_p3rs3c3r3tp455w0rd` with your own.
Successfully running this should present you with output similar to the below:

```bash
mysql> GRANT ALL ON seat.* to seat@localhost IDENTIFIED BY 's_p3rs3c3r3tp455w0rd';
Query OK, 0 rows affected (0.00 sec)
```

In the example above, we have effectively declared that SeAT will be using the database as `seat:s_p3rs3c3r3tp455w0rd@localhost/seat`.
Finally, we will reload sql server permission cache

```bash
FLUSH PRIVILEGES;
```

!!! note

    Remember the password for the `seat` database user as we will need it later to configure SeAT.

### PHP
Since SeAT is a PHP application, we will to install php packages.
For now, we're relying on PHP 7.1 due to issues with Laravel on PHP 7.2 on some methods.
We will add ondrej PPA which is very popular and caters for most php versions.

Let's start by using an editor to create the file `/etc/apt/source.list.d/php.list` (`nano` or `vi` works well for such things).
Inside the newly created file, simply paste the block bellow :

<ul class="nav nav-tabs">
<li class="active"><a data-toggle="tab" data-target="#phpppa_xenial">Xenial 16.04</a></li>
<li><a data-toggle="tab" data-target="#phpppa_artful">Artful 17.10</a></li>
<li><a data-toggle="tab" data-target="#phpppa_bionic">Bionic 18.04</a></li>
</ul>
<div class="tab-content">
<div id="phpppa_xenial" class="tab-pane fade in active" markdown="1">
<pre><code class="bash hljs">deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main
deb-src http://ppa.launchpad.net/ondrej/php/ubuntu xenial main</code></pre>
</div>
<div id="phpppa_artful" class="tab-pane" markdown="1">
<pre><code class="bash hljs">deb http://ppa.launchpad.net/ondrej/php/ubuntu artful main
deb-src http://ppa.launchpad.net/ondrej/php/ubuntu artful main</code></pre>
</div>
<div id="phpppa_bionic" class="tab-pane fade" markdown="1">
<pre><code class="bash hljs">deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main
deb-src http://ppa.launchpad.net/ondrej/php/ubuntu bionic main</code></pre>
</div>
</div>

Next, we will have to download the repository GPG key and add it into our keychain

```bash
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 4F4EA0AAE5267A6C
```

Update our repository cache

```bash
apt-get update
```

And finally, install php packages with SeAT dependencies

```bash
apt-get install curl zip php7.1-cli php7.1-mysql php7.1-mcrypt php7.1-intl php7.1-curl php7.1-gd php7.1-mbstring php7.1-bz2 php7.1-dom php7.1-zip
```

### Redis
SeAT makes use of [Redis](http://redis.io/) as a cache and message broker for the Queue backend.
Installing it is really easy. Do it with:

```bash
apt-get install redis-server
```

### SeAT Download
Here we go, all requirements are now met. We will start installing SeAT.
Start with `git` and `composer` which will handle our php package dependencies and download SeAT from our repositories.

```bash
apt-get install git
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && hash -r
```

Move firstly to your `www` directory with `cd /var/www` (in case it does not exists, create it using `mkdir /var/www`) and download SeAT using `composer create-project eveseat/seat --no-dev --stability=beta`.

Next, we will add a dedicated user for security reasons and in order to distinguish SeAT processes easier.

```bash
adduser --group --no-create-home --system --disabled-login seat
chown seat:seat -R /var/www/seat
```

Fix read and write access to storage directory which will store backups, logs, caches etc.

```bash
chmod -R guo+w /var/www/seat/storage
```

### SeAT Setup

Next, we will edit SeAT main configuration file `.env`. This file will be located at `/var/www/seat/.env`

Update it with the information you got earlier in the installation process. Refer to the table bellow in order to get each parameter description.

| Parameter Name | Default value | Description |
|-------------------|--------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| APP_URL | http://seat.local | This is the public address where SeAT instance is reachable. That should match with the `EVE_CALLBACK_URL` without `/auth/eve/callback` suffix |
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

Now, we will publish assets and seed the SeAT database. Let's do this with the following commands :

- `sudo -H -u seat bash -c 'php /var/www/seat/artisan vendor:publish --force --all'` this will publish all package assets, including horizon
- `sudo -H -u seat bash -c 'php /var/www/seat/artisan migrate'` it will generate SeAT database structure
- `sudo -H -u seat bash -c 'php /var/www/seat/artisan db:seed --class=Seat\\Services\\database\\seeds\\ScheduleSeeder'` this will seed the scheduling table used for jobs
- `sudo -H -u seat bash -c 'php /var/www/seat/artisan eve:update-sde'` it will download latest SDE data

### Supervisor
SeAT relies on supervisor in order to keep the Horizon process up. Horizon is the new queue backend in SeAT 3.0.

```bash
apt-get install supervisor
```

Next, we will create a dedicated configuration file which will ask supervisor to keep an eye on Horizon.
Use your favorite editor in order to spawn the file at the following path `/etc/supervisor/conf.d/seat.conf`

Inside the newly created file, add the following configuration items:

```bash
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

```bash
service supervisor restart
```

Finally, setup crontab for SeAT with :

```bash
crontab -u seat -e
```

And seed the tab with the following :

```bash
* * * * * php /var/www/seat/artisan schedule:run
```

### Web Service
The SeAT web interface requires a web server to serve the HTML goodies it has. We highly encourage you to use nginx and will be covered in this document. You don't **have** to use it, so if you prefer something else, feel free.

Let's install nginx :

```bash
apt-get install nginx php7.1-fpm
```

Duplicate the standard www pool configuration file from PHP-Fpm to a dedicated SeAT pool :

```bash
cp /etc/php/7.1/fpm/pool.d/www.conf /etc/php/7.1/fpm/pool.d/seat.conf
```

Next, update the newly created pool file at `/etc/php/7.1/fpm/pool.d/seat.conf` with some adequate values :

| initial value | new value |
|-----------------------------------|-----------------------------|
| [www] | [seat] |
| user = www-data | user = seat |
| group = www-data | group = seat |
| listen = /run/php/php7.1-fpm.sock | listen = /run/php/seat.sock |

Once done, you can create a new configuration file into nginx to server SeAT called `/etc/nginx/site-availables/seat` 

And put the content bellow inside

```bash
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

```bash
ln -s /etc/nginx/sites-availabe/seat /etc/nginx/sites-enabled/seat
rm /etc/nginx/sites-enabled/default
```

Finally, reload services :

```bash
service php7.1-fpm reload
service nginx reload
```

### Admin Login
Since SeAT 3.0, an admin user is a real dedicated user and you will no longer be able to link characters or corporations to it. Using the admin user, you will probably and most typically just add your main character to the Superuser group and never login as an admin again.

To login as an administrator, simply run the following command :

```bash
sudo -H -u seat bash -c 'php /var/www/seat/artisan seat:admin:login'
```

You'll get a link after the command has finished running which looks similar to the one bellow :

```
http://yourserver/auth/login/admin/somerandomstring
```

Copy it and paste it inside your browser and you will be authenticated as the admin user.
