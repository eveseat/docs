![SeAT](https://i.imgur.com/aPPOxSK.png)

# Installation

A number of options are available to install SeAT. We highly recommend a Dockerized version as the installation and upgrade process is the fastest and most simple. Nonetheless, three methods exist to install SeAT:

- Via docker and a `docker-compose.yml` file.
- Via the installer scripts and the `seat` tool.
- Manually.

Each method has a detailed guide available that illustrates the steps either via screenshots or short videos.

!!! warning

    Make sure you review the [hardware](getting_started/#hardware-requirements) and [software](getting_started/#software-requirements) requirements sections before installing anything intended for production use!

## Docker (recommended)

Getting SeAT installed via Docker is the recommended way of running SeAT. Using docker, all of SeAT's dependencies is neatly abstracted away from your hosts operating system and does not conflict with any pre-existing software you might have on your server. With a little bit of extra work, Docker installations are also possible on Windows.

Regardless if you have `docker` & `docker-compose` installed on your Linux server, the following script will install them if needed and then download the SeAT `docker-compose.yml` and `.env` files to `/opt/seat-docker` on your server:

```bash
bash <(curl -fsSL https://git.io/seat-docker)
```

Once downloaded, `docker-compose up -d` is run from that folder to start the SeAT stack. To see this script in action on a fresh Digital Ocean VPS, check out the following asciinema:

<script src="https://asciinema.org/a/c0EM0kQnj86JkNX40TBdhA4Ua.js" id="asciicast-c0EM0kQnj86JkNX40TBdhA4Ua" async></script>

Once the docker installation is complete, you should have SeAT available on the server, listening on port 8080. For more detailed docker related information including configuring a web server with SSL support, please refer to the [Docker](/guides/installation/docker/) section.

## Installer (SeAT Tool)

A semi automated installation option for Debian 8 / 9, Ubuntu LTS versions and CentOS 7 is available. To get started with this method, a helper script should be downloaded and run.

```bash
bash <(curl -fsSL https://git.io/seat-installer)
```

!!! warning

    This installer assumes that *nothing else* is configured on the host operating system. If you have an existing database server or web server on the host this script is run on there is a high chance it will fail!

This will ask you to choose your operating system in order to prepare the `seat` tool for use.

Example usage:

```bash
$ bash <(curl -fsSL https://git.io/seat-installer)
 * SeAT Installer Operating System Selection
1) CentOS 6    3) Ubuntu 16x  5) Debian 9x
2) CentOS 7    4) Debian 8x   6) Quit
 * Please select the target operating system:
```

Once the preparations are done, the installer will prompt you to run `seat install:production`. 

!!! note

    During the beta of SeAT 3x, please run `seat install:production --minimum-stability beta` instead. This will tell the installer that versions that are marked as non-stable is ok to use.

## Manual Installation

Finally, you can always install SeAT manually. You will need to get PHP 7.1, MariaDB, Redis and a web server such as nginx running. Guides for popular Linux distributions such as Debian, Ubuntu and CentOS can be found in the sidebar, but if those distributions aren't your cup of tea, follow these steps to get going:

- Install PHP 7.1.
- Install the latest MariaDB / MySQL server.
- Install Redis server.
- Install the [composer](https://getcomposer.org/) PHP dependency manager.
- Choose where you want the SeAT sources to live and start the download with `composer create-project eveseat/seat`.
- Once installed, `cd` to the new `seat/` directory and publish migrations and assets with `php artisan vendor:publish --force --all`.
- If you want the Swagger API documentation, run `php artisan l5-swagger:generate`.
- Update the `.env` file with your database settings. Ideally SeAT should have full control over only its own database (not the entire database server);
- Run the database migrations with `php artisan migrate`.
- Update the EVE Static Data tables with `php artisan eve:update:sde -n`.
- Run the SeAT schedule seeder with `php artisan db:seed --class=Seat\\Services\\database\\seeds\\ScheduleSeeder`.
- Configure a web server to serve the `public/` directory to the world.
- Download supervisord and have it keep the `php artisan horizon` command alive. This will allow you to process jobs.
