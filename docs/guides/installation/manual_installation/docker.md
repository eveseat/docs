![SeAT](https://i.imgur.com/aPPOxSK.png)

# Docker

As mentioned in numerous other places, docker is ideally the installation route you want to go. Docker enables us to run SeAT on any platform capable of running docker itself (which includes Windows!). Additionally, upgrades and service maintenance is really low effort as you don't have to care about any dependencies. All of it is maintained within a docker stack and dockerhub.

!!! info

    If you feel like docker might not be your cup of tea, checkout some of the [getting started](https://docs.docker.com/get-started/) guides that are available.

## Docker Requirements

In terms of performance, the same hardware requirements apply to docker installations as those that choose otherwise. 
For information about the hardware requirements for SeAT, please see [this](/general/hardware_requirements/) 
page. The only major difference between docker and other installation options is that the containers themselves may take 
up a few hundred MB's of extra space. In most cases this should be a non-issue.

!!! warning

    In case you plan to purchase a virtualised server (also call VPS), ensure the provider is working with **KVM** and **not**
    **OpenVZ**. This is related to virtualization technology.
    
    On **OpenVZ** environment, you're using the server host kernel
    and not able to update it yourself. Most of the time, those kernel are outdated and this will prevent you to install Docker.
    Furthermore, that can lead to security issue like recent [Meltdown and Spectre fail](https://meltdownattack.com/).
    
    With **KVM** technology, you have hand on your VPS kernel without depending on the host one and are able to update it
    if needed.



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
    | ---------- | ---------------- 
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

### Docker Download

If you do not have `docker`, install it now with the following command as `root`:

```bash
# Installs docker
sh <(curl -fsSL get.docker.com)
```

### Docker-compose Download

If you do not have `docker-compose`, install it now with the following command as `root`:

```bash
# Downloads docker-compose
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

# Makes docker-compose executable
chmod +x /usr/local/bin/docker-compose
```

### Docker compose working directory

With `docker` and `docker-compose` ready, create yourself a directory in `/opt` with `mkdir -p /opt/seat-docker` and `cd` to it. Remember this directory as you will need to come back to it often.

### SeAT Docker-compose.yml and .env File

Then, download the `docker-compose.yml` file with:

```bash
curl -fsSL https://raw.githubusercontent.com/eveseat/scripts/master/docker-compose/docker-compose.yml -o docker-compose.yml
```

Next, download the docker `.env` file with:

```bash
curl -fsSL https://raw.githubusercontent.com/eveseat/scripts/master/docker-compose/.env -o .env 
```

!!! warning

    The location of the `docker-compose.yml` and `.env` files are important. You need to `cd` back to the directory where these are stored in order to be able to execute commands for this stack at a later stage.

With the configuration files ready, start up the stack with:

```bash
docker-compose up -d
```

Yep. Thats all you need to do :)

### Monitoring the Stack

Knowing what is going on inside of your containers is crucial to understanding how everything is running as well as useful when debugging any problems that may occur. While the containers are starting up or have been running for a while, you can always `cd` to the directory where your `docker-compose.yml` file lives and run the `logs` command to see the output of all of the containers in the stack. For example:

```bash
cd /opt/seat-docker
docker-compose logs --tail 10 -f
```

These commands will `cd` to the directory containing the stacks `docker-compose.yml` file and run the `logs` command, showing the last *10* log entries and then printing new ones as they arrive.

### Configuration Changes

All of the relevant configuration lives inside the `.env` file, next to your `docker-compose.yml` file. Modify its values by opening it in a text editor, making the appropriate changes and saving it again. Once that is done, run `docker-compose up -d` again to restart the container environment.

If you followed along until now with the docker installation, the next step would be to login as an administrator and to configure SSO. #WIP#
