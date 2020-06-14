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

To view a single containers logs (`seat-app` in this examples case), run:

```bash
docker-compose logs --tail 10 -f seat-app
```

To view all containers logs at once, run:

```bash
docker-compose logs --tail 10 -f
```

Once you are done viewing the output, simply pressing ^C will exit the log viewer.

## Installing Plugins

SeAT provides the ability for third party developers to integrate with the core environment to extend its features and functionality. It is possible to install those plugins in a docker environment. Installing a plugin is relatively easy too. All you need to do is add the plugin name to your `SEAT_PLUGINS` variable in the `.env` file and run `docker-compose up -d` again. The plugin will be read from the `.env` file and installed as the application container starts.

For example. Open the `.env` file (which is most probably at `/opt/seat-docker/.env`) and edit the `SEAT_PLUGINS` variable to include the package you want to install. In our example we use the pseudo package called user/seat-plugin:

```yaml
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
