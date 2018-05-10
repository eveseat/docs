![SeAT](https://i.imgur.com/aPPOxSK.png)

# Nginx

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

## SSL-Support

WIP: 2018 use Let's encrypt