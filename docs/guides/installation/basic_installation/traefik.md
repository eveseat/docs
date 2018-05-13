![SeAT](https://i.imgur.com/aPPOxSK.png)

# Træfik 

Træfik is a modern HTTP reverse proxy and load balancer that makes deploying microservices easy. Most of the time SeAT is not going to be the only web application running on your Webserver. Therefore you need an orchestrator or proxy-server which handels subdomains, ports, certificates etc. Here Træfik makes managing your webserver very easy, especially because it is very docker aware, configures itself automatically, dynamically and it makes managing SeAT very easy.

!!! note "Let's encrypt by default"
    This guide will automatically enables HTTPS via Let's encrypt (Free SSL-Certificates \o/).


![Traefik](https://docs.traefik.io/img/architecture.png)

## Installation

First create a docker network:

````bash
docker network create web
````
Then we are creating a directory on the server from where we configure Træfik.

````bash
touch /opt/traefik/docker-compose.yml
touch /opt/traefik/acme.json && chmod 600 /opt/traefik/acme.json
touch /opt/traefik/traefik.toml
````

We are going to run Træfik inside of a docker container, for this you need to create a `docker-compose.yml` inside the directory, with a text tool such as `nano`, `vi` and such.

````yaml
version: "3.2"
services:
  traefik:
    image: traefik:1.6.0-alpine
    restart: always
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /opt/traefik/traefik.toml:/traefik.toml
      - /opt/traefik/acme.json:/acme.json
    ports:
      - 80:80
      - 443:443
      - 8080:8080
    networks:
      - web
networks:
  web:
    external: true
````

Next you need to a edit the `traefik.toml`-file. 

!!! info "Enter domain and your email-address"
    in order to maintain your domain Træfik needs to know your domain-address. Let's encrypt needs your email to provide fresh SSL certificates.

````toml
defaultEntryPoints = ["http", "https"]

[api]

[docker]
domain = "{your.domain}"
watch = true

[entryPoints]
 [entryPoints.http]
 address = ":80"
  [entryPoints.http.redirect]
  entryPoint = "https"
 [entryPoints.https]
 address = ":443"
  [entryPoints.https.tls]

[acme]
 email = "{your.em@il.net}"
 storage = "acme.json"
 entryPoint = "https"
 onHostRule = true
 onDemand = false
  [acme.httpChallenge]
   entryPoint = "http"
````

After configuring these `docker-compose.yml`, `traefik.toml` files and having a (hopefully) empty `acme.json` file, you are now able to start Træfik:

````bash
docker-compose up -d
````

## Adapt SeAT's `docker-compose.yml` file to serve Træfik

Since SeAT is being shipped with `ngnix` natively, which exposes two ports to the web. We need to adapt the `docker-compose.yml` file inside SeAT's installation folder. Inside `/opt/seat-docker` comment the `ngnix` part alike

````yaml
  nginx:
    image: eveseat/eveseat-nginx
    depends_on:
      - seat-app
    container_name: seat-nginx
    restart: always
    environment:
      - NGINX_HOST=${NGINX_HOST}
    volumes:
      - "seat-code:/var/www/seat"
      # Remove the comment below to enable nginx logs to disk.
      #- ./logs/nginx/:/var/log/nginx/
    #ports:
      #- "${NGINX_HTTP}:80"
      #- "${NGINX_HTTPS}:443"
    command: /bin/sh -c "envsubst '${NGINX_HOST}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"
    labels:
        - "traefik.frontend.rule=Host:{seat.your.domain}"
        - "traefik.docker.network=web"
        - "traefik.port=80"
    networks:
      - seat-network
      - web
````

and at `networks` at the end of the file:
````yaml
networks:
    seat-network:
    web:
       external: true
````

To take effect of the changes, restart docker: 

````bash
docker-compose up -d
````

## Adapt Callback-URL to support `https`

After having setup Træfik, your application is now only available via `https`. Therefore you must adapt the ESI-Callback URL in `.env` in your SeAT-Docker folder and on the developers-portal.

### Change ESI Callback on Developers

Browse to [https://developers.eveonline.com/applications](https://developers.eveonline.com/applications) and select your Application (1) which you have created previously:

![Application](https://i.imgur.com/0IPC14v.png)

Select `Update Details` (2)

![Application](https://i.imgur.com/2n2w40P.png)

Change the `callback url` (3) to use `https` and confirm the changes and update app (4):

![Application](https://i.imgur.com/m6Qb7da.png)

### Change `.env` in Seat-Docker-Folder

Change to `seat-docker`:

````bash
cd /opt/seat-docker
````

adapt `.env`'s parameters for `callback-url`

````nano
EVE_CALLBACK_URL=https://seat.test/auth/eve/callback
````

To take effect of the changes, restart docker: 

````bash
docker-compose up -d
````

Now you have a HTTPS-Secured SeAT-Application and a very state-of-the-art proxy server, which you can use to manage other applications like discourse (the forum), tripwire or pathfinder.

![SafeSeAT](https://i.imgur.com/rgAskUE.png)

## Montior Træfik Health

Træfik ships with nice montitoring capabilites as well as metrics integration with prometheus. With these Settings above you are able to montior your Træfik at `{your.servers.ip:8080}`

![monitor](https://i.imgur.com/AS17Kqk.png)

to turn this off: comment inside the Træfik's `docker-compose` file the port 8080:

````yaml
    ports:
      - 80:80
      - 443:443
      #- 8080:8080
````
