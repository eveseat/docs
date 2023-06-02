# SeAT 4.x to 5.0 (Docker)

The upgrade path from SeAT 4.0 to SeAT 5.0 requires a tiny amount of manual work. 

!!! danger
    This guide walks you through the process of installing SeAT 5.x, which is still under development. It is advised that you only install it in a testing environments until a full release is made.

!!! info    
    Before starting the upgrade, pay check the plugins you may be using and ensure that they are compatible with SeAT 5. 
    A compatibility table can be found on the [Community Packages](../../community_packages.md#maintained-packages) page.
    If you are unsure, join us on [Discord] so that we can tru and assist or redirect you to proper person.

    Users of [recursivetree/seat-info](https://github.com/recursivetree/seat-info) need to follow separate instructions after the migrating the core to seat 5.

!!! warning
    Before you do anything, read and understand this entire upgrade guide.
    
    Those instructions are valid for Docker deployment only.
    Please refer to [bare metal instructions] for a non-docker installation.

    **Remember** to do make a complete backup of your current database making a copy off the server where SeAT runs together with the `.env` file. Both of these are the only things required to rebuilt your instance in case of failure.

## Requirements

- A database backup is an absolute **must**. Everything in SeAT can be recovered in some way or form except *for your database*.
- Enough storage space to have SeAT 4, SeAT 5 and a backup of your SeAT 4 database.
- Ensure all your SeAT 4 packages are up-to-date (check this in **Settings > SeAT Settings**)

## Docker Upgrade Procedure

If you are currently using a docker installation for SeAT 4, upgrading is easy as never before. You need to make a few changes to your docker stack configuration, restart the stack, and you're good to go.

This guide is going to step through some quick preparation steps, then perform the upgrade and finally, check that everything worked out as expected. Let's dive in.

### tl;dr upgrades

We highly recommend that you read the details of this upgrade guide to get familiar with what has changed. But, if this is your nth upgrade, maybe you just want to get the summary of everything, so here it is:

- Make a [backup] of your database.
- `cd` to your install dir (which is probably `/opt/seat-docker`) and bring the stack down with `docker compose down`
- Make a copy of your `.env` file using `cp .env .env.seat4.bak`
- Make a copy of your current compose file using `cp docker-compose.yml docker-compose.yml.seat4.bak`
- Download the new `docker-compose.yml` file with `curl -L https://raw.githubusercontent.com/eveseat/seat-docker/5.0.x/docker-compose.yml -o docker-compose.yml`.
- Download the new database override `docker-compose.mariadb.yml` file with `curl -L https://raw.githubusercontent.com/eveseat/seat-docker/5.0.x/docker-compose.mariadb.yml -o docker-compose.mariadb.yml`. 
- Download the new traefik override `docker-compose.traefik.yml` file with `curl -L https://raw.githubusercontent.com/eveseat/seat-docker/5.0.x/docker-compose.mariadb.yml -o docker-compose.traefik.yml`. 
- Download the new proxy override `docker-compose.proxy.yml` file with `curl -L https://raw.githubusercontent.com/eveseat/seat-docker/5.0.x/docker-compose.mariadb.yml -o docker-compose.proxy.yml`.
- Download the new `.env` file template using `curl -L https://raw.githubusercontent.com/eveseat/seat-docker/5.0.x/.env -o .env`.
- Update the new `.env` file using your backup `.env.seat4.bak` 

The table bellow is provided as a variable mapping between SeAT 4.x and SeAT 5.x. You can use it as a reference.

| SeAT 4.x                    | SeAT 5.x                       |
|-----------------------------|--------------------------------|
| `TRAEFIK_DOMAIN=seat.local` | `SEAT_DOMAIN=seat.seat.local`  |
| `SEAT_SUBDOMAIN=seat`       | `SEAT_DOMAIN=seat.seat.local`  |
|                             | `PROXY_BACKEND_HTTP_PORT=8080` |
|                             | `LOG_LEVEL=error`              |

!!! info

    With SeAT 5.x, there is non longer default database and proxy. You can mix services are your needs.
    However, we continue to provide a few default layout usable out of the box as an option.

=== "Using Traefik"

    In case you want to use Traefik front of SeAT ui container, you'll need to setup the following environment variable: `TRAEFIK_ACME_EMAIL`.
    You'll then use the following command to boot the stack `docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.traefik.yml up`

=== "Using reverse proxy"

    In case you want to use a custom reverse proxy front of SeAT ui container, you'll need to setup the new environment variable `PROXY_BACKEND_HTTP_PORT`.
    You'll then use the following command to boot the stack `docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.proxy.yml up`

Since we didn't startup the stack using daemon mode - the overall migration and process is run at front. This will allow you to detect any issue without having a container running in panic mode.
When SeAT will be ready to serve your requests and have successfully been upgrade, you'll see the following output :

``` linenums="1"
2023-06-02 09:49:33          ****////////////                                                   
2023-06-02 09:49:33      ***                 ///                                                   
2023-06-02 09:49:33   ***                      //                                                 
2023-06-02 09:49:33   **     **  //   ///        //                                                
2023-06-02 09:49:33  **      ***  ///             //      ////////@@@@@@@@@@@@@@@(/////@@@//////////
2023-06-02 09:49:33            **/   ///   /////////     *///&@@@@@@@&/////#@@@@%//%///#@@@@@(///@ 
2023-06-02 09:49:33  **     *** //////// /                @///////@@///@@@///@@@///@@///@@@@@(///@ 
2023-06-02 09:49:33  **      ***   ///   //       //      @@@@@////@/////////@@//////////@@@@(///@ 
2023-06-02 09:49:33   **         ///  //   /     //      *////////@@@///////@@///@@@@@@///@@@(///@ 
2023-06-02 09:49:33    ***         //// ///    ///                                              
2023-06-02 09:49:33       ***                ///                                              
2023-06-02 09:49:33          ****////////////
2023-06-02 09:49:33 
2023-06-02 09:49:33 
2023-06-02 09:49:33 SeAT is now ready to serve requests
2023-06-02 09:49:33 
2023-06-02 09:49:33 Open your browser and go to 'https://seat.domain.tld'
2023-06-02 09:49:33 Run 'docker compose exec front php artisan seat:admin:login' to get a temporary link in order to sign-in as built-in admin user account (or use bellow one)
2023-06-02 09:49:33 
2023-06-02 09:49:33 SeAT Admin Login URL Generator
2023-06-02 09:49:33 Checking if 'admin' is a super user
2023-06-02 09:49:33 Generating authentication token
2023-06-02 09:49:33 
2023-06-02 09:49:33 Your authentication URL is valid for 60 seconds.
2023-06-02 09:49:33 https://seat.domain.tld/auth/login/admin/aDvMAcd7GQPXFfhS3aIH9dh4opwcvASB
2023-06-02 09:49:33 
2023-06-02 09:49:33 
2023-06-02 09:49:33 AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.19.0.4. Set the 'ServerName' directive globally to suppress this message
2023-06-02 09:49:33 AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.19.0.4. Set the 'ServerName' directive globally to suppress this message
2023-06-02 09:49:33 [Fri Jun 02 07:49:33.524019 2023] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.56 (Debian) PHP/8.2.6 configured -- resuming normal operations
2023-06-02 09:49:33 [Fri Jun 02 07:49:33.524084 2023] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
```

Try to authenticate yourself and verify everything is working well. If you don't find any issue, you can now restart the stack in daemon mode 🎉.

Use ++ctrl+c++ in order to kill the stack and restart it in background:


=== "Using Traefik"

    ```bash
    docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.traefik.yml up
    ```

=== "Using reverse proxy"

    ```bash
    docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.proxy.yml up
    ```

### Docker changes since SeAT 4

There have been a few minor changes to the `docker-compose.yml` file. Most notably, the containers have been renamed to disclose their purpose easier, we have moved from Dockerhub to [GitHub Container Registry], and the stack now has a persistent storage volume.

If you customized your docker stack deployment, it is recommended that you take a look at the new `docker-compose.yml` file yourselves to see what exactly changed.
Last but not least, try to avoid tuning standard files as must as possible and use override syntax instead with a `docker-compose.override.yml` file [(see official documentation)](https://docs.docker.com/compose/extends/).

### Preperation

Before you upgrade, you need to backup.

#### Backup your database

The single most important thing you need is a backup of your SeAT 4 database. Without a backup you will *not* be able to recover in case of a disaster. So, head on over to the [docker db backup section] and do that right now.

#### Backup your env file

The `.env` file is the one that has your SeAT installations' configuration. It contains things like your SSO Client ID and Secret (aka: credentials). By default, SeAT docker installations live in `/opt/seat-docker` meaning your `.env` file will be at `/opt/seat-docker/.env`. Make a copy of this file and store it somewhere safe.

#### Stop SeAT 4

First, we need to stop the SeAT 4 stack. Assuming you have the default `/opt/seat-docker` location for your installation, cd to it first and then run:

```bash
docker compose down
```

The output should be similar to this:

```text linenums="1"
root@seat:/opt/seat-docker# docker compose down
Stopping seat-web   ... done
Stopping seat-cron    ... done
Stopping seat-worker  ... done
Removing seat-traefik     ... done
Stopping seat-mariadb ... done
Stopping seat-redis   ... done
Removing seat-web   ... done
Removing seat-cron    ... done
Removing seat-worker  ... done
Removing seat-traefik     ... done
Removing seat-mariadb ... done
Removing seat-redis   ... done
Removing network seat-docker_seat-network
```

### Upgrading to SeAT 5

#### Get the new docker-compose files

!!! warning
    If you have made customisations to how you deployed SeAT with docker-compose, then you should probably **not** be replacing the compose file like we are about to do. Instead, have a look at the new one [here](https://github.com/eveseat/seat-docker/blob/5.0.x/docker-compose.yml) and adapt.

Next, we will download the new SeAT 5 docker-compose files. Do that with:

``` bash linenums="1"
mv docker-compose.yml docker-compose.yml.seat4.bak
curl -L https://raw.githubusercontent.com/eveseat/seat-docker/5.0.x/docker-compose.yml -o docker-compose.yml
curl -L https://raw.githubusercontent.com/eveseat/seat-docker/5.0.x/docker-compose.mariadb.yml -o docker-compose.mariadb.yml
curl -L https://raw.githubusercontent.com/eveseat/seat-docker/5.0.x/docker-compose.traefik.yml -o docker-compose.traefik.yml
curl -L https://raw.githubusercontent.com/eveseat/seat-docker/5.0.x/docker-compose.proxy.yml -o docker-compose.proxy.yml
```

With this we have created a copy of the older docker-compose file (just in case), and downloaded the new one.

#### Update the .env file
This is one of the more important steps. The database configuration needs to be updated.

The easier is probably to download the new template and adapt variables according to your previous configuration as
some of them have been removed, newest appeared and overall have been reordered.

```bash linenums="1"
mv .env .env.seat4.bak
curl -L https://raw.githubusercontent.com/eveseat/seat-docker/5.0.x/.env -o .env.yml
```

You can refer at any time to the online version of `.env` file on [GitHub](https://github.com/eveseat/seat-docker/blob/5.0.x/.env)
The table bellow is provided as a variable mapping between SeAT 4.x and SeAT 5.x. You can use it as a reference.

| SeAT 4.x                    | SeAT 5.x                       |
|-----------------------------|--------------------------------|
| `TRAEFIK_DOMAIN=seat.local` | `SEAT_DOMAIN=seat.seat.local`  |
| `SEAT_SUBDOMAIN=seat`       | `SEAT_DOMAIN=seat.seat.local`  |
|                             | `PROXY_BACKEND_HTTP_PORT=8080` |
|                             | `LOG_LEVEL=error`              |

### Bringing SeAT 5 up

The only thing that is left to do is to start the stack up again. The first time we are going to start SeAT 5 we won't use the `-d` flag. This is just so that you can see what's happening during the upgrade procedure. So, start SeAT with:

=== "Using Traefik"

    In case you want to use Traefik front of SeAT ui container, you'll need to setup the following environment variable: `TRAEFIK_ACME_EMAIL`.
    You'll then use the following command to boot the stack `docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.traefik.yml up`

=== "Using reverse proxy"

    In case you want to use a custom reverse proxy front of SeAT ui container, you'll need to setup the new environment variable `PROXY_BACKEND_HTTP_PORT`.
    You'll then use the following command to boot the stack `docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.proxy.yml up`

You should first see some download progress bars downloading the new SeAT version.

After a while, seat should start up similar to this:

```text linenums="1"
...

seat_local-front-1  | mysqld is alive
seat_local-front-1  | PONG
seat_local-front-1  | starting web service
seat_local-front-1  | Processing plugins from SEAT_PLUGINS
seat_local-front-1  | Loading composer repositories with package information
seat_local-front-1  | Info from https://repo.packagist.org: #StandWithUkraine
seat_local-front-1  | Updating dependencies
...
```

!!! warning
    Do **not** interrupt SeAT during this phase. It will leave your database in a potentially corrupt state, meaning you are going to have to do some extra pluming to get a backup restored. Not a train smash, but not worth it.

Eventually, when everything is done you should start seeing the following output:

```text linenums="1"
seat_local-front-1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.25.0.5. Set the 'ServerName' directive globally to suppress this message
seat_local-front-1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.25.0.5. Set the 'ServerName' directive globally to suppress this message
seat_local-front-1  | [Sun May 21 21:10:46.869842 2023] [mpm_prefork:notice] [pid 1] AH00163: Apache/2.4.56 (Debian) PHP/8.1.19 configured -- resuming normal operations
seat_local-front-1  | [Sun May 21 21:10:46.869944 2023] [core:notice] [pid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
```

This is a good sign, and means everything is now ready!

### Check your installation

The first obvious step will be to check that you can access the web UI. If not, something is probably weird with the web server configuration and needs some tweaking.

If everything seems to be working fine, you can hit ++crtl+c++ which will bring the stack down gracefully. This might take up to 30 seconds.

```text linenums="1"
^CGracefully stopping... (press Ctrl+C again to force)
Stopping seat-docker_scheduler_1 ...
Stopping seat-docker_worker_1    ...
Stopping seat-docker_front_1     ...
Stopping seat-docker_traefik_1   ... done
Stopping seat-docker_cache_1     ...
```

Then, bring it back up with the `-d` flag.


=== "Using Traefik"

    In case you want to use Traefik front of SeAT ui container, you'll need to setup the following environment variable: `TRAEFIK_ACME_EMAIL`.
    You'll then use the following command to boot the stack `docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.traefik.yml up -d`

=== "Using reverse proxy"

    In case you want to use a custom reverse proxy front of SeAT ui container, you'll need to setup the new environment variable `PROXY_BACKEND_HTTP_PORT`.
    You'll then use the following command to boot the stack `docker compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.proxy.yml up -d`

Congrats, and welcome to SeAT 5!

### Problems
Should you have any issue with the installation, please contact us on [Discord].


[backup]: ../../admin_guides/docker_admin.md#database-backups-and-restore
[docker db backup section]: ../../admin_guides/docker_admin.md#database-backups-and-restore
[bare metal instructions]: bare_metal.md
[Discord]: ../../about/contact.md
[GitHub Container Registry]: https://github.com/eveseat/seat-docker/pkgs/container/seat
