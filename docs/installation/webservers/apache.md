![SeAT](http://i.imgur.com/aPPOxSK.png)

# webserver - apache

The SeAT web interface requires a web server to serve the HTML goodies it has. Apache is an alternative of nginx. You don't **have** to use it, so if you prefer something else, feel free.

This guide contains two sections:

* Docker setup
* Host Setup (f.e. via SeAT-Tool or manual setup)

## docker setup

This part is about how to setup apache to serve your seat-docker installation:

!!! info "Docker-Setup"

    This part is still under construction.
    
A minimal Apache config might look like this

````
<VirtualHost *:80>
    ServerName discourse.example.com
    ProxyPass / http://0.0.0.0:8080/
    ProxyPassReverse / http://0.0.0.0:8080/
</VirtualHost>
````

---

## host installations
In order to get the SeAT fronted running, we need to configure Apache to serve our SeAT installs `public/` folder. This is the only folder that should be internet facing. That small `index.php` is the gateway into the application.
The Apache configuration itself will depend on how your server is set up. Generally, virtual hosting is the way to go, and this is what this guide will be showing here.


### Unbuntu Installation


Let's install Apache & PHP7.2 mod:

```
sudo apt-get install apache2 libapache2-mod-php7.2
```

Duplicate the standard www configuration file:
```
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/seat.conf
``` 

Next, update the configuration file at `/etc/apache2/sites-available/seat.conf` with some adequate values :

```
sudo vim /etc/apache2/sites-available/seat.conf
```



| variable | initial value | new value |
| ------------ | ------------- | ------------ |
| ServerAdmin | webmaster@localhost  | email@yourdomain.com |
| DocumentRoot | /var/www/html  | /var/www/seat |
| ServerName | -  | yourdomain.com |
| ErrorLog | ${APACHE_LOG_DIR}/error.log  | ${APACHE_LOG_DIR}/seat-error.log |
| CustomLog | ${APACHE_LOG_DIR}/access.log combined  | ${APACHE_LOG_DIR}/seat-access.log combined |

Since SeAT is running under a different user other than Apache's `www-data` you might run into some permission issue. Hence using `mpm_itk` module can let Apache run as seat user to avoid permission problem. You don't **have** to use it.

```
sudo apt-get install libapache2-mpm-itk
```

then

```
sudo a2enmod mpm_itk
```
You should see something like this in console:

````bash
Setting up libapache2-mpm-itk (2.4.7-04-1) ...
apache2_invoke: Enable module mpm_itk
root@openstackm1:~# a2enmod mpm_itk
Considering dependency mpm_prefork for mpm_itk:
Considering conflict mpm_event for mpm_prefork:
Considering conflict mpm_worker for mpm_prefork:
Module mpm_prefork already enabled
Module mpm_itk already enabled
root@Server:~#
````


Then modify the configuration file:
```
sudo vim /etc/apache2/sites-available/seat.conf
```


and add these lines:
```
<IfModule mpm_itk_module>
    AssignUserId seat seat
</IfModule>
```

Your configuration file should look similar to this:

```
<VirtualHost *:80>
        ServerAdmin email@yourdomain.com
        ServerNAme yourdomain.com
        DocumentRoot /var/www/seat/
        <Directory /var/www/seat/>
                Options Indexes FollowSymLinks
                AllowOverride All
                Require all granted
        </Directory>
        <IfModule mpm_itk_module>
                AssignUserId seat seat
        </IfModule>
        ErrorLog ${APACHE_LOG_DIR}/seat-error.log
        CustomLog ${APACHE_LOG_DIR}/seat-access.log combined
</VirtualHost>
```


Finally, enable the site &amp; reload services:
```
sudo a2ensite seat.conf
sudo service apache2 reload 
```

That's it! SeAT should now be available at http://your-domain-or-ip/

### CentOS Installation

If you are not going to use virtual hosting, the easiest to get going will probably to symlink `/var/www/seat/public/` to `/var/www/html/seat` and configuring apache to `AllowOverride All` in the `<Directory "/var/www/html">` section. This should have SeAT available at http://your-host-name-or-ip/seat after you restart apache.

Getting the virtual host setup is as simple as creating a new configuration file (I usually call it the `sites-domain.conf`), and modifying it to match your setup. Everywhere you see `seat.local` as the hostname in the below examples it needs to be substituted to your actual domain.

Lets prepare some directories. We create the directory `/var/www/html/seat.local` with:
````bash
mkdir /var/www/html/seat.local
````

We symlink the SeAT public directory with:

````bash
ln -s /var/www/seat/public /var/www/html/seat.local
````

Next, we have to configure Apache itself to know about the directories and stuff SeAT needs. We need to create that `sites-domain.conf` file I mentioned. This file should live in `/etc/httpd/conf.d`, so lets change directories there:

````bash
cd /etc/httpd/conf.d
````

Now, create the conf file. In my case, the domain is `seat.local`, so I will call it `seat.local.conf`. Add the following contents to that file:

````bash
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
````

With our config file created, we need to restart apache to read the new file:

````bash
apachectl restart
````

That should be it from a configuration perspective. We can confirm that everything is configured correctly by running:

````bash
[root@seat conf.d]# apachectl -t -D DUMP_VHOSTS
httpd: Could not reliably determine the server&#39;s fully qualified domain name, using seat.localdomain for ServerName
VirtualHost configuration:
wildcard NameVirtualHosts and _default_ servers:
*:80                   seat.local (/etc/httpd/conf.d/seat.local.conf:1)
Syntax OK
````


Thats it! SeAT should now be available at http://your-domain-or-ip/



