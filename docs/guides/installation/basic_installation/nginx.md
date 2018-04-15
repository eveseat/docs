![SeAT](https://i.imgur.com/aPPOxSK.png)

# Nginx

This site is still WIP and not in its final state. To get you going: Install nginx according to your host OS
see guides here: 

* [Ubuntu](/guides/installation/manual_installation/ubuntu/#nginx)
* [Debian](/guides/installation/manual_installation/debian/#web-service)

## SSL-Support

**WIP: 2018 use Let's encrypt/certbot**

You need a nginx server, certbot (or SSL certificates) and a configuration like this example from a local dev-enviroment.

````nano
cat /usr/local/etc/nginx/conf.d/seat.dev.conf
server {
    listen 80;
    server_name seat.dev www.seat.dev *.seat.dev;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    server_name seat.dev www.seat.dev *.seat.dev;
    charset utf-8;
    client_max_body_size 128M;

    ssl_certificate /Users/leonjza/.valet/Certificates/seat.dev.crt;
    ssl_certificate_key /Users/leonjza/.valet/Certificates/seat.dev.key;

    location / {
      access_log off;
      proxy_pass http://127.0.0.1:8080;
      proxy_redirect off;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header Host $host;
      proxy_set_header X-Forwarded-Proto https;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
````