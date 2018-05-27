![SeAT](https://i.imgur.com/aPPOxSK.png)

!!! info "A records for (sub)domain"
    This guide assumes that you have created an A record on the DNS zone you want to manage via Træfik.

# Træfik

Træfik is a modern HTTP reverse proxy and load balancer that makes deploying microservices easy. Most of the time SeAT is not going to be the only web application running on your Webserver. Therefore you need an orchestrator or proxy-server which handles sub-domains, ports, certificates etc. Here Træfik makes managing your webserver very easy, especially because it is docker aware and configures itself.

!!! note "Let's encrypt by default"
    This guide will automatically enable HTTPS via Let's encrypt (Free SSL-Certificates \o/).

![Traefik](https://docs.traefik.io/img/architecture.png)

## Installation

First create a new docker network:

```bash
docker network create web
```

Next, we need to create a directory on the server where we will store the Træfik configuration files. Once weh ave the directory ready we will also prepare the files Træfik will use.

```bash
# Create the directory
mkdir -p /opt/traefik

# Prepare the configuration files
touch /opt/traefik/docker-compose.yml
touch /opt/traefik/acme.json
touch /opt/traefik/traefik.toml

# Ensure the permissions on acme.json is secure
chmod 600 /opt/traefik/acme.json
```

Since we are going to run Træfik inside of a docker container, we need to create a `docker-compose.yml` inside the traefik directory. This file describes the configuration in a way traefik understands and lets us easily reconfigure it in the future: Open `/opt/traefik/docker-compose.yml` and add the following contents:

```yaml
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
      # Uncomment Port 8080 if you plan to use Træfik's Dashboard
      #- 8080:8080
    #labels:
      #- traefik.frontend.rule=Host:{monitor.your.server}
      #- traefik.port=8080

    networks:
      - web
networks:
  web:
    external: true
```

Next you need to a edit the `traefik.toml`-file.

!!! info "Enter domain and your email-address"
    In order to automatically maintain your SSL certificate, Træfik needs to know your domain and email address. Let's encrypt needs your email to provide fresh SSL certificates.

```toml
defaultEntryPoints = ["http", "https"]

[api]
#entrypoint="monitor"

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
 #[entryPoints.monitor] # Uncomment if you use the web dashboard
   #address=":8080"
   #[entryPoints.monitor.auth]
     #[entryPoints.monitor.auth.basic]
       #users = ["admin:{your_MD5_encrypted_PW}"] #replace the curly paranthesis with your MD5 encrypted PW


[acme]
 email = "{your.em@il.net}"
 storage = "acme.json"
 entryPoint = "https"
 onHostRule = true
 onDemand = false
  [acme.httpChallenge]
   entryPoint = "http"
```

After configuring both the `docker-compose.yml` and `traefik.toml` files (leaving the `acme.json` file empty), you should now ne able to start Træfik:

````bash
docker-compose up -d
````

## Adapt SeAT's `docker-compose.yml` file to serve Træfik

By default, SeAT ships with `ngnix` as a web server. This web server exposes two ports to the web. We need to adapt the `docker-compose.yml` file inside SeAT's installation folder. Inside `/opt/seat-docker` add the comment character `#` to the `ngnix` sections like:

```yaml
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
```

Next, add a new section to the existing `networks` section as follows:

```yaml
networks:
    seat-network:
    web:
       external: true
```

For these changes to take affect, restart the stack with:

```bash
docker-compose up -d
```

## Adapt Callback-URL to support `https`

After having setup Træfik, your application is now only available via `https`. Therefore you must adapt the ESI-Callback URL in `.env` in your SeAT-Docker folder and on the developers-portal.

### Change ESI Callback on Developers

Browse to [https://developers.eveonline.com/applications](https://developers.eveonline.com/applications) and select your Application (1) which you have created previously:

![Application](https://i.imgur.com/0IPC14v.png)

Select `Update Details` (2)

![Application](https://i.imgur.com/2n2w40P.png)

Change the `callback url` (3) to use `https` and confirm the changes and update app (4):

![Application](https://i.imgur.com/m6Qb7da.png)

### Update `.env` in Seat-Docker-Folder

Change directories to `seat-docker`:

```bash
cd /opt/seat-docker
```

Update the `.env` files parameters with the new `callback-url`:

```txt
EVE_CALLBACK_URL=https://seat.test/auth/eve/callback
```

For these changes to take affect, restart the stack with:

```bash
docker-compose up -d
```

Now you have a HTTPS only SeAT instance and a very state-of-the-art proxy server which you can also use to manage other applications such as discourse (the forum), tripwire or pathfinder.

![SafeSeAT](https://i.imgur.com/rgAskUE.png)

## Monitor Træfik Health

Træfik ships with a monitoring dashboard that includes metrics integration with prometheus. If you wish to take advantage of the web dashboard you need to uncomment the marked sections in the `.toml` and `docker-compose.yml` files for Træfik and set the password for the dashboard login.

!!!! info "Have you set a subdomain?"
    Remember to create an A record entry for the dashboard. For eg: monitor.{yourdomain.com}

![monitor](https://i.imgur.com/AS17Kqk.png)

The password hash format used by the dashboard is a 1000 thousand iteration MD5 sum. To generate such a password hash you need to install a helper utility first. On Ubuntu, this can be done with:

```bash
sudo apt-get install apache2-utils
```

Next, generate the password hash with `htpasswd`. Substitute `secure_password` with the password you'd like to use for the Træfik admin user:

````bash
htpasswd -nb admin secure_password
````

This command will output a hash similar to the below format:

````bash
admin:$apr1$ruca84Hq$mbjdMZBAG.KWn7vfN/SNK/
````

Take this output and replace the `users = [admin:MD5Password]` section in the Traefik `.toml`.
