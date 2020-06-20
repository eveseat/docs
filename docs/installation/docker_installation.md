![SeAT](https://i.imgur.com/aPPOxSK.png)

# Docker

As mentioned in numerous other places, docker is ideally the installation route you want to go. Docker enables us to run SeAT on any platform capable of running docker itself (which includes Windows!). Additionally, upgrades and service maintenance is really low effort as you don't have to care about any dependencies. All of it is maintained within a docker stack and dockerhub.

!!! info

	If you plan to run Docker on Windows, for the best performance it is suggested you run Docker using the Windows Subsystem for Linux 2 (WSL2) backend, available starting in Windows 10/Windows Server 20H1 (build 2004) releases.

!!! hint

    Before starting to do anything, be sure you read the complete workflow once.
    It will help you to understand all steps from the installation process.
    
    If you feel like docker might not be your cup of tea, checkout some of the [getting started](https://docs.docker.com/get-started/) guides that are available.

!!! warning

    If you are using Docker on Windows, you will need to use the [Manual Deployment](#manual-deployment) option below.

!!! note "Eve Application and ESI"

    SeAT consumes CCP's [ESI](https://esi.evetech.net/) service in order to retrieve EVE Online related information.
    Before you can make any authenticated calls to ESI, you have to register a third party EVE application on the [developers portal](developers.eveonline.com/).
    This is an absolute must for SeAT to be of any use. The configuration of this step is covered in a later stage of the documentation.

## Internal Container Setup Overview

The setup for SeAT's docker installation is built on top of [docker-compose](https://docs.docker.com/compose/). With docker-compose, we can use a single `docker-compose.yml` file to define the entire stack complete with dependencies required to run SeAT. A pre-built and recommended compose file (which is also used by the bootstrapping script) is hosted in the scripts repository [here](https://github.com/eveseat/scripts/tree/master/docker-compose).

The previously mentioned compose file is really simple. A high level overview of its contents is:

- A single docker network called `seat-network` is defined. All containers are connected to this network and is used as the primary means for inter-container communications.
- Three volumes are configured to store data. Those are:
    - `seat-code`: This volume is seeded by the `seat-app` container and contains the actual SeAT source code. Any container that needs access to the SeAT sources (such as the app and worker containers) would mount this container to their respective, internal `/var/www/seat` directory.
    - `redis-data`: This volume is used purely to let redis periodically backup the cache.
    - `mariadb-data`: This is the *most important* volume as it contains all of the database data. This is the one volume that you should configure a backup solution for!
- Six services (or containers) are used within the SeAT docker stack. Two of the services are pulled directly from [Dockerhub](https://hub.docker.com/).
    Four others are custom build and also hosted on DockerHub. Those containers are exposed in the table bellow :

| Image Name | Image Repository |
| ---------- | ---------------- |
| `mariadb:10.3` | [https://hub.docker.com/_/mariadb/](https://hub.docker.com/_/mariadb/) |
| `redis:3` | [https://hub.docker.com/_/redis/](https://hub.docker.com/_/redis/) |
| `eveseat/eveseat-nginx` | [https://hub.docker.com/r/eveseat/eveseat-nginx/](https://hub.docker.com/r/eveseat/eveseat-nginx/) |
| `eveseat/eveseat-app` | [https://hub.docker.com/r/eveseat/eveseat-app/](https://hub.docker.com/r/eveseat/eveseat-app/) |
| `eveseat/eveseat-worker` | [https://hub.docker.com/r/eveseat/eveseat-worker/](https://hub.docker.com/r/eveseat/eveseat-worker/) |
| `eveseat/eveseat-cron` | [https://hub.docker.com/r/eveseat/eveseat-cron/](https://hub.docker.com/r/eveseat/eveseat-cron/) |

- The environment is configured using a top level `.env` file (not to be confused with the SeAT specific `.env` file (which should be transparent to a docker user anyways.))
- Only two ports are exposed by default. Those are `tcp/8080` and `tcp/8443`. These can be connected to in order to access the SeAT web interface.
- All containers are configured to restart on failure, so if your server reboots or a container dies for whatever reason it should automatically start up again.

## SeAT Docker Installation

Depending on wether you already have `docker` and `docker-compose` already installed, you may choose how to start the installation. If you already have the required tooling installed and running their latest versions, all you need to do is download the latest `docker-compose.yml` and `.env` files to get started.

### Automated Setup Script

If you do not have the required software installed yet, consider running the [bootstrap script](https://github.com/eveseat/scripts/blob/master/docker-compose/bootstrap.sh) that will check for `docker` and `docker-compose`, install it and start the SeAT stack up for you. The script can be run with:

```bash
bash <(curl -fsSL https://git.io/seat-docker)
```

Once the script is finished, you can skip to the [monitoring the stack](#monitoring-the-stack) section of this guide.

If you don't want to run this script, follow along in the next section of this guide.

### Manual Deployment

#### Docker Download

If you do not have `docker`, install it now with the following command as `root`:

```bash
# Installs docker
sh <(curl -fsSL get.docker.com)
```

If you are on Windows, download and install [Docker Desktop].

#### Docker-compose Download

If you do not have `docker-compose`, install it now with the following command as `root` (Docker Compose is included with Docker Desktop on Windows):

```bash
# Downloads docker-compose
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

# Makes docker-compose executable
chmod +x /usr/local/bin/docker-compose
```

#### Docker compose working directory

With `docker` and `docker-compose` ready, create yourself a directory in `/opt` with `mkdir -p /opt/seat-docker` and `cd` to it. Remember this directory as you will need to come back to it often.

On Windows, create the directory `C:\seat-docker` with `mkdir C:\seat-docker` and `cd` to it. 

#### SeAT docker-compose.yml and .env File

Then, download the `docker-compose.yml` file with:

=== "Linux"
    ```bash
    curl -fsSL https://raw.githubusercontent.com/eveseat/scripts/master/docker-compose/docker-compose.yml -o docker-compose.yml
    ```

=== "Windows"
    ```powershell
    Invoke-WebRequest -Uri https://raw.githubusercontent.com/eveseat/scripts/master/docker-compose/docker-compose.yml -OutFile docker-compose.yml
    ```

Next, download the docker `.env` file with:

=== "Linux"
    ```bash
    curl -fsSL https://raw.githubusercontent.com/eveseat/scripts/master/docker-compose/.env -o .env 
    ```

=== "Windows"
    ```powershell
    Invoke-WebRequest -Uri https://raw.githubusercontent.com/eveseat/scripts/master/docker-compose/.env -OutFile .env 
    ```

Finally, download the mysql configuration file `my.cnf` with:

=== "Linux"
    ```bash
    curl -fsSL https://raw.githubusercontent.com/eveseat/scripts/master/docker-compose/my.cnf -o my.cnf
    ```

=== "Windows"
    ```powershell
    Invoke-WebRequest -Uri https://raw.githubusercontent.com/eveseat/scripts/master/docker-compose/my.cnf -OutFile my.cnf
    ```

Now, we will generate a unique application key - this is used to encrypt stuff:

=== "Linux"
    ```bash
    sed -i -- 's/APP_KEY=insecure/APP_KEY='$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c32 ; echo '')'/g' .env
    ```

=== "Windows"
    ```powershell
    $appkey = (-join ((65..90) + (97..122) | Get-Random -Count 32 | % {[char]$_})); (Get-Content .env -Raw) -replace "APP_KEY=insecure", "APP_KEY=$appkey" | Set-Content .env
    ```

Then, change `HOST`, `ACME_EMAIL` and `APP_URL` from the `.env` file with valid values (we will take care of SSL, so you can use https).

!!! info

    SeAT docker template is shipped with [Traefik] to hide your container behind a proxy and securing traffic up to it.
    In case you want to manage traffic proxying and certification on your own, you can disable traefik container from the stack by adding `#` [front of lines] from the `docker-compose.yml` file.

!!! warning

    The location of the `docker-compose.yml`, `.env` and `my.cnf` files are important. You need to `cd` back to the directory where these are stored in order to be able to execute commands for this stack at a later stage.
    
    Also, be sure you provide a valid e-mail address as it will be used to register your account against [Let's Encrypt].
    For those unfamiliar with them, it's a certification platform which are delivering valid certificate for free.

With the configuration files ready, start up the stack with:

```bash
docker-compose up -d
```

Yep. That's all you need to do :)

## Monitoring the Stack

Knowing what is going on inside of your containers is crucial to understanding how everything is running as well as useful when debugging any problems that may occur. While the containers are starting up or have been running for a while, you can always `cd` to the directory where your `docker-compose.yml` file lives and run the `logs` command to see the output of all of the containers in the stack. For example:

```bash
cd /opt/seat-docker
docker-compose logs --tail 10 -f
```

These commands will `cd` to the directory containing the stacks `docker-compose.yml` file and run the `logs` command, showing the last *10* log entries and then printing new ones as they arrive.

## Configuration Changes

All of relevant configuration lives inside the `.env` file, next to your `docker-compose.yml` file.
Modify its values by opening it in a text editor, making the appropriate changes and saving it again.
Once that is done, run `docker-compose up -d` again to restart the container environment.

## ESI Configuration

As mentioned at the start of the guide, it is necessary for you to configure ESI.
For instructions how to do this, please refer to the [ESI Setup Guide].

!!! success

    You made it! Use a browser and browse to the IP address / hostname of your server to access SeAT!

[Docker Desktop]: https://www.docker.com/products/docker-desktop
[ESI Setup Guide]: ../configuration/esi_configuration.md
[Certbot Documentation]: https://certbot.eff.org
[Traefik]: https://containo.us/traefik/
[Let's Encrypt]: https://letsencrypt.org
[front of lines]: https://github.com/eveseat/scripts/blob/master/docker-compose/docker-compose.yml#L143-L166