![SeAT](https://i.imgur.com/aPPOxSK.png)

# Apache

The SeAT web interface requires a web server to serve the HTML goodies it has. Apache is an alternative of nginx. You don't **have** to use it, so if you prefer something else, feel free.

Let's install Apache & PHP7.1 mod:

```bash
sudo apt-get install apache2 libapache2-mod-php7.1
```
Duplicate the standard www configuration file:
```bash
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/seat.conf
```

Next, update the configuration file at `/etc/apache2/sites-available/seat.conf` with some adequate values :
```bash
sudo vim /etc/apache2/sites-available/seat.conf
```
|    variable  |initial value | new value |
|--------------|-----------------------------------|-----------------------------|
| ServerAdmin | webmaster@localhost | email@yourdomain.com |
| DocumentRoot| /var/www/html | /var/www/seat |
| ServerName| - | yourdomain.com |
| ErrorLog | ${APACHE_LOG_DIR}/error.log | ${APACHE_LOG_DIR}/seat-error.log |
| CustomLog | ${APACHE_LOG_DIR}/access.log combined | ${APACHE_LOG_DIR}/seat-access.log combined |

Since SeAT is running under a different user other than Apache's `www-data` you might run into some permission issue. Hence using `mpm_itk` module can let Apache run as seat user to avoid permission problem. You don't **have** to use it

```bash
sudo apt-get install libapache2-mpm-itk
```
then
```bash
sudo a2enmod mpm_itk
```
You should see something like this in console:
```
Setting up libapache2-mpm-itk (2.4.7-04-1) ...
apache2_invoke: Enable module mpm_itk
root@openstackm1:~# a2enmod mpm_itk
Considering dependency mpm_prefork for mpm_itk:
Considering conflict mpm_event for mpm_prefork:
Considering conflict mpm_worker for mpm_prefork:
Module mpm_prefork already enabled
Module mpm_itk already enabled
root@Server:~#
```

Then modify the configuration file:
```bash
sudo vim /etc/apache2/sites-available/seat.conf
```
and add these lines:
```bash
<IfModule mpm_itk_module>
        AssignUserId seat seat
</IfModule>
```
your configuration file should look similar to this:
```bash
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

Finally, enable the site & reload services :

```bash
sudo a2ensite seat.conf
sudo service apache2 reload
```