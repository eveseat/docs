![SeAT](https://i.imgur.com/aPPOxSK.png)

# Docker

!!! danger
    This guide walks you through the process of installing SeAT 5.x, which is still under development. It is advised that you only install it in a testing environments until a full release is made.

Docker is ideally the installation route you want to go. Docker enables us to run SeAT on any platform capable of running docker itself (which includes Windows!). Additionally, upgrades and service maintenance are really low effort as you don't have to care about any dependencies. All of it is maintained within a docker stack, DockerHub and the GitHub Container Registry.

!!! info
    If you plan on running Docker on Windows, for the best performance it is suggested that you run Docker using the Windows Subsystem for Linux 2 (WSL2) backend, available starting in Windows 10/Windows Server 20H1 (build 2004) releases.

!!! hint
    Before starting the installation process, be sure you read this complete document first. It will help you understand all the steps from an installation process.

    If you feel like docker might not be your cup of tea, checkout some of the other [getting started](https://docs.docker.com/get-started/) guides that are available.

!!! warning
    If you are using Docker on Windows, you will need to use the [Manual Deployment](#manual-deployment) option below.

!!! note "Eve Application and ESI"
    SeAT uses CCP's [ESI](https://esi.evetech.net/) service in order to retrieve EVE Online-related information. Before you can make any authenticated calls to ESI, you have to register a third-party EVE application on the [developers portal](developers.eveonline.com/). This is an absolute must for SeAT to be of any use. The configuration of this step is covered in a later stage of the documentation.

## Internal Container Setup Overview

The setup for SeAT's docker installation orchestrated using [docker-compose](https://docs.docker.com/compose/). With docker-compose, we can use `YAML` files to define the entire stack complete with all the dependencies required to run SeAT. A pre-built and recommended compose file (which is also used by the bootstrapping script) is hosted in the seat-docker repository [here](https://github.com/eveseat/seat-docker).

The official SeAT repository for Docker is shipped with a total of 4 `YAML` files, allowing you both flexibility and understandability of the overall stack. A high-level overview of its contents is:

- A main `docker-compose.yml` file in which are listed SeAT services (`front` to serve web ui, `worker` to process jobs, `scheduler` to manage repetitive tasks and `cache` to store jobs queue)
- A database `docker-compose.mariadb.yml` file in which is listed a `mariadb` service - this way, you can replace mariadb by another supported database engine
- A Traefik `docker-compose.traefik.yml` file in which is listed a `traefik` service - this way you can simply and safely server your SeAT frontend to the rest of the world
- An alternative to Traefik `docker-compose.proxy.yml` file in which is adapted `front` SeAT container to be server behind a reverse proxy of your choice
- A volume called `mariadb-data` and `seat-storage` is defined. These are the *most important* volumes as they contain all SeAT data. You should configure a backup solution for them!
- The environment is configured using a top-level `.env` file.
- Only too ports are exposed by default. Those are `tcp/80` and `tcp/443`. These can be connected to in order to access the SeAT web interface.
- All containers are configured to restart on failure, so if your server reboots or a container dies for whatever reason it should automatically start up again.

The table bellow is listed overall consumed Docker image, including SeAT custom one - together with their source repository.

| Image Name       | Image Repository |
|------------------| ---------------- |
| `mariadb:10.11`  | [https://hub.docker.com/_/mariadb/](https://hub.docker.com/_/mariadb/) |
| `redis:5-alpine` | [https://hub.docker.com/_/redis/](https://hub.docker.com/_/redis/) |
| `traefik:2.10`   | [https://hub.docker.com/_/traefik](https://hub.docker.com/_/traefik) |
| `ghcr.io/eveseat/seat:5` | [https://github.com/eveseat/seat-docker/pkgs/container/seat](https://github.com/eveseat/seat-docker/pkgs/container/seat) |

## SeAT Docker Installation

Depending on whether you already have `docker` and `docker-compose` already installed, you may choose how to start the installation. If you already have the required tooling installed and running their latest versions, all you need to do is download the latest **SeAT Docker template archive** to get started.

### Automated Setup Script

!!!warning
    The script hasn't been updated to seat 5 yet. Please follow the [manual deployment instructions](#manual-deployment) instead.

If you do not have the required software installed yet, consider running the [bootstrap script](https://github.com/eveseat/seat-docker/blob/5.0.x/bootstrap.sh) that will check for `docker` and `docker-compose`, install it and start the SeAT stack up for you. The script can be run with:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/eveseat/seat-docker/5.0.x/bootstrap.sh)
```

Once the script is finished, you can skip to the [monitoring the stack](#monitoring-the-stack) section of this guide.

If you don't want to run this script, follow along in the next section of this guide.

### Manual Deployment

#### Docker Download

If you do not have `docker`, install it now with the following command as `root`:

```bash
sh <(curl -fsSL get.docker.com)
```

If you are on Windows, download and install [Docker Desktop].

#### Docker-compose Download

If you do not have `docker-compose`, install it now with the following command as `root` (Docker Compose is included with Docker Desktop on Windows):

```bash linenums="1"
# Downloads docker-compose
curl -L https://github.com/docker/compose/releases/download/2.18.1/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

# Makes docker-compose executable
chmod +x /usr/local/bin/docker-compose
```

#### Docker compose working directory

With `docker` and `docker-compose` ready, create yourself a directory in `/opt` with `mkdir -p /opt/seat-docker` and `cd` to it. Remember this directory as you will need to come back to it often.

On Windows, create the `C:\seat-docker` directory with `mkdir C:\seat-docker` and `cd` to it.

#### SeAT docker-compose.yml and .env File

Then, download the **SeAT Docker template archive** with:

=== "Linux"
    ```bash
    curl -fsSL https://github.com/eveseat/seat-docker/archive/refs/heads/5.0.x.zip -o seat-docker.zip
    ```

=== "Windows"
    ```powershell
    Invoke-WebRequest -Uri https://github.com/eveseat/seat-docker/archive/refs/heads/5.0.x.zip -OutFile seat-docker.zip
    ```

Next, decompress the template archive:

=== "Linux"
    ```bash
    unzip seat-docker.zip -d /opt/seat-docker
    ```

=== "Windows"
    ```powershell
    Expand-Archive -Path c:\seat-docker\seat-docker.zip -DestinationPath c:\seat-docker
    ```

Next, we will generate a unique application key - this is used internally for encryption:

=== "Linux"
    ```bash
    sed -i -- 's/APP_KEY=insecure/APP_KEY='$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c32 ; echo '')'/g' .env
    ```

=== "Windows"
    ```powershell
    $appkey = (-join ((65..90) + (97..122) | Get-Random -Count 32 | % {[char]$_})); (Get-Content .env -Raw) -replace "APP_KEY=insecure", "APP_KEY=$appkey" | Set-Content .env
    ```

#### SeAT docker configuration

Open up the `.env` file in a text editor and fill in a few of the configuration items needed.

- `PROXY_BACKEND_HTTP_PORT` adapt to any integer of your convenience between 1 and 65535 in case you plan to serve SeAT behind a reverse proxy.
- `TRAEFIK_ACME_EMAIL` adapt with your own e-mail address in case you plan to serve SeAT behind Traefik.
- `SEAT_DOMAIN` should be set to the domain your installation lives on and on which SeAT UI will be served.  
- `DB_PASSWORD` must be adapt with a strong password of your own - it will be used as SeAT credential for its database.

!!! warning
    The `DB_PASSWORD` value have to and must be changed only once - before any start of the overall stack.
    As soon as the database container is created, SeAT user account is initialized with the `DB_PASSWORD` value.
    Changing it after the initial startup will prevent the stack to boot.

    Also, at the initial startup, the root password from the database container will be shown in logs.
    You should consider taking a note of it - otherwise you will no longer have a way to recovery of a critical outage (ie: misconfiguration, etc...)

Finally, in case you plan to serve SeAT using Traefik, create an ACME configuration file with:

```bash linenums="1"
mkdir acme
touch acme/acme.json
chmod 600 acme/acme.json
```

!!! info
    SeAT docker template is shipped with [Traefik] to hide your container behind a proxy and securing traffic up to it. In case you want to manage traffic proxying and certification on your own, you must use `docker-compose.proxy.yml` file on startup.

!!! warning
    The location of the `docker-compose.yml` and `.env` files are important. You need to `cd` back to the directory where these are stored in order to be able to execute commands for this stack at a later stage.

    Also, be sure you provide a valid e-mail address as it will be used to register your account against [Let's Encrypt] in case you plan to serve SeAT with Traefik. For those unfamiliar with this, it's CA that provides valid certificates for free.

### ESI Configuration

As mentioned at the start of the guide, it is necessary for you to configure ESI. For instructions on how to do this, please refer to the [ESI Setup Guide].

With the configuration files ready, start up the stack with:

=== "Using Traefik"
    ```bash
    docker-compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.traefik.yml -d up
    ```

=== "Using proxy"
    ```bash
    docker-compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.proxy.yml -d up
    ```

## Monitoring the Stack

Knowing what is going on inside your containers is crucial to understanding how everything is running as well as useful when debugging any problems that may occur. While the containers are starting up or have been running for a while, you can always `cd` to the directory where your `docker-compose.yml` file lives and run the `logs` command to see the output of all the containers in the stack. For example:

```bash linenums="1"
cd /opt/seat-docker
docker-compose logs --tail 10 -f
```

These commands will `cd` to the directory containing the stacks `docker-compose.yml` file and run the `logs` command, showing the last *10* log entries and then printing new ones as they arrive. If you leave away the `--tail 10`part, you can view all logs since the container startup.

## Configuration Changes

All the relevant configuration lives inside the `.env` file, next to your `docker-compose.yml` file. Modify their values by opening it in a text editor, making the appropriate changes, and saving it again. Once that is done, run `docker-compose up -d` again to restart the container environment.

!!! success
    You made it! Use a browser and browse to the domain / subdomain of your server to access SeAT!

[Docker Desktop]: https://www.docker.com/products/docker-desktop
[ESI Setup Guide]: ../configuration/esi_configuration.md
[Certbot Documentation]: https://certbot.eff.org
[Traefik]: https://containo.us/traefik/
[Let's Encrypt]: https://letsencrypt.org
