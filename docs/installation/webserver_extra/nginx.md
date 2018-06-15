![SeAT](https://i.imgur.com/aPPOxSK.png)

# Nginx

!!! warning

    This page is still a work in progress and not in its final state. To get you going though, install nginx according for your host OS based on the guides here:

- [Ubuntu](/installation/manual_installation/ubuntu/#web-server)
- [Debian](/installation/manual_installation/debian/#web-server)

## Docker SSL-Support

You can configure nginx to serve your docker-based instances web server via SSL with the following example nginx configuration used for a `www.seat.dev` domain:

````conf
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

    ssl_certificate ~/seat.dev.crt;
    ssl_certificate_key ~/seat.dev.key;

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

Certificates should be managed using `certbot` which you can read more about [here](https://letsencrypt.org/getting-started/).
