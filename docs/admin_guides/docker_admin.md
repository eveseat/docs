![SeAT](https://i.imgur.com/aPPOxSK.png)

# Docker Administration

Occasionally you will need to perform administrative tasks in your SeAT instance running within docker. Be it because you would like to configure TLS for the web interface, change the port of the SeAT webserver or simply generate an admin login URL, this guide aims to help you get familiar for the commands needed for this.

Many of the commands are exactly the same as those used in a bare metal installation, except for the fact that they are always prefixed with `docker-compose` and run from the same directory that you have the seat `docker-compose.yml` file stored. If your `docker-compose.yml` lives in `/opt/seat-docker`, you will need to `cd` to that directory first and then execute the `docker-compose` commands.

## Container Status

For a quick, birds-eye view on the status of the containers within the SeAT docker stack, the following command may be run:

```bash
docker-compose ps
```

This should give you the name, entry point, current status and internal ports used within the docker network as output.

## Configuration Changes

A dockerized installation of SeAT is primarily configured via a configuration file located at `.env`. Configuration options such as your applications SSO secrets, SeAT's web server ports are amongst the many configuration options available in this file.

Making changes to this file requires the docker stack to be restarted so that the configuration may be applies. An example case would be when you [configure SSO] for your instance.

Once you have made a configuration change, save the `.env` file and restart the stack by simply running the following command from the path where the `docker-compose.yml` lives:

```bash
docker-compose up -d
```

## Live Container Logs

Getting an idea of what is happening inside of the containers may be useful for many things, including debugging any issues that may occur. All of the containers generate logs that can be viewed either in isolation, or all of the containers in the stack.

=== "Docker (SeAT 4.x)"

    To view a single services' logs (`seat-web` in this examples case), run:
    
    ```bash
    docker-compose logs --tail 10 -f seat-web
    ```

    All services can referenced by their name using `docker-compose`. You can see the service names [here](https://github.com/eveseat/seat-docker/blob/master/docker-compose.yml). At the time of writing this doc, the available services were: `mariadb`, `redis`, `traefik`, `seat-web`, `seat-worker` and `seat-cron`.

=== "Docker (SeAT 5.x)"

    To view a single services' logs (`front` in this examples case), run:
    
    ```bash
    docker-compose logs --tail 10 -f front
    ```

    All services can referenced by their name using `docker-compose`. You can see the service names [here](https://github.com/eveseat/seat-docker/blob/master/docker-compose.yml). At the time of writing this doc, the available services were: `mariadb`, `redis`, `traefik`, `front`, `worker` and `scheduler`.

To view all service logs at once, run:

```bash
docker-compose logs --tail 10 -f
```

Once you are done viewing the output, simply pressing ^C will exit the log viewer.

## Application Logs

While most processes will output information to stdout (which is what you will see when you run `docker-compose logs`), there are some app specific logs also generated.

### Logs - Web UI

=== "Docker (SeAT 4.x)"

    If you are getting HTTP 500's, or other exception when using the web interface, the best place to find the relevant logs will be in the `seat-web` service, in the `/var/www/seat/storage/logs` directory. To reach them, run `docker-compose exec seat-web bash`. This will drop you into bash shell in the container:
    
    ```text linenums="1"
    $ docker-compose exec seat-web bash
    root@9aff5b002ca0:/var/www/seat#
    ```

=== "Docker (SeAT 5.x)"

    If you are getting HTTP 500's, or other exception when using the web interface, the best place to find the relevant logs will be in the `front` service, in the `/var/www/seat/storage/logs` directory. To reach them, run `docker-compose exec front bash`. This will drop you into bash shell in the container:
    
    ```text linenums="1"
    $ docker-compose exec front bash
    root@9aff5b002ca0:/var/www/seat#
    ```

Next, cd to the logs directory with:

```bash
cd storage/logs/
```

This directory should have daily log files for you to view.

### Logs - Worker / Updaters

=== "Docker (SeAT 4.x)"

    If you think your workers may be causing some exceptions, or you want to investigate why they may be failing, you can do so in the `seat-worker` service. Just like for the web UI, get a bash shell and cd to the logs directory.
    
    ```text linenums="1"
    # docker-compose exec seat-worker bash
    root@8ed8967348f1:/var/www/seat# cd storage/logs/
    root@8ed8967348f1:/var/www/seat/storage/logs# ls
    eseye-2020-08-23.log
    ```

=== "Docker (SeAT 5.x)"

    If you think your workers may be causing some exceptions, or you want to investigate why they may be failing, you can do so in the `worker` service. Just like for the web UI, get a bash shell and cd to the logs directory.
    
    ```text linenums="1"
    # docker-compose exec worker bash
    root@8ed8967348f1:/var/www/seat# cd storage/logs/
    root@8ed8967348f1:/var/www/seat/storage/logs# ls
    eseye-2020-08-23.log
    ```

The eseye log as well as Laravel log should help you debug what is going on.

## Installing Plugins

SeAT provides the ability for third party developers to integrate with the core environment to extend its features and functionality. It is possible to install those plugins in a docker environment. Installing a plugin is relatively easy too. All you need to do is add the plugin name to your `SEAT_PLUGINS` variable in the `.env` file and run `docker-compose up -d` again. The plugin will be read from the `.env` file and installed as the application container starts.

For example. Open the `.env` file (which is most probably at `/opt/seat-docker/.env`) and edit the `SEAT_PLUGINS` variable to include the package you want to install. In our example we use the pseudo package called user/seat-plugin:

```yaml linenums="1"
# SeAT Plugins
# This is a list of the all of the third party plugins that you
# would like to install as part of SeAT. Package names should be
# comma separated if multiple packages should be installed.
SEAT_PLUGINS=user/seat-plugin
```

Save your `.env` file and run `docker-compose up -d` to restart the stack with the new plugins as part of it. Depending on how big the plugin itself may be, this could take a few moments to complete.

You can monitor the installation process by running:

```bash
docker-compose logs --tail 5 -f seat-app
```

## Database Backups and Restore

Backups. They are important and really simple to do. To perform a backup of the current database used within the docker stack, compressing and saving it to a file called `seat_backup.sql.gz`, run:

```bash
docker-compose exec mariadb sh -c 'exec mysqldump "$MYSQL_DATABASE" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD"' | gzip > seat_backup.sql.gz
```

To restore a backup to a new dockerized instance of SeAT, run:

```bash
zcat seat_backup.sql.gz | docker-compose exec -T mariadb sh -c 'exec mysql "$MYSQL_DATABASE" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD"'
```

[configure SSO]: ../configuration/esi_configuration.md
