![SeAT](https://i.imgur.com/aPPOxSK.png)

# Troubleshooting

So, the inevitable happened. Something broke or simply isn't working as expected! Thats ok. Usually, its possible to recover from almost any type of error. The *only* thing that you can't recover from is not making database backups.

There are a few things you can do to perform general troubleshooting. These range from flipping SeAT into debug mode to simply running a self diagnostics command. Lets take a look at a few steps you can take:

## Whoops

> Whoops, looks like something went wrong.

![whoops](https://i.imgur.com/esebPtv.png)

The dreaded "Whoops" message has appeared and now you need to figure out why. Normally, this means that something serious broke and the application simply can't recover by itself. In many cases it could either be a quick fix you can do yourself, or something that could result in the need to fix some code.

In either case, the next steps to perform when seeing this would be to either [enable debug mode](#enabling-debug-mode) and reloading the page / request that failed, or by viewing the log file while retrying the failed request.

### Enabling Debug Mode

Debug mode controls how much information about an error condition is displayed to the user. When debug mode is enabled, the error message will be _extremely verbose_, whereas when its disabled, it simply states that an error had occurred. In either case, the error will always be written to the logs. By default, SeAT does not have debug mode enabled. There are many reasons for this with the primary reason being security related. It goes without saying that once you have completed debugging and fixing your instance, always make sure you **disable debug mode** afterwards.

Once you have enabled debug mode, any errors that may occur would look something like the following instead of the default "Whoops" message. Depending on if you have development packages installed (which you wouldn't by default in non-development installations), the debug page may look slightly different.

![debugerror](https://i.imgur.com/4gs154m.png)

Irrespective of how you installed SeAT, enabling debug mode is always a matter of changing the `APP_DEBUG` configuration option in the `.env` to `true. However, for it to apply depends on how you installed, so follow the appropriate steps below.

#### Debug Mode - Host Installs

Assuming you installed SeAT on your host using either the SeAT tool or manually, cd to your SeAT installation directory. If you followed the guides on this documentation website, that would be in `/var/www/seat`. Next, open the `.env` file in a text editor and modify the line that says `APP_DEBUG=false` to say `APP_DEBUG=true`.

The change would immediately take effect and you can simply reload the failed request for a detailed error message and code stack trace.

#### Debug Mode - Docker Installs

If you installed using Docker, cd to the directory where the `docker-compose.yml` file is located. Assuming you followed the guides on this website, that would be in `/opt/seat-docker`. Next, open the `.env` file in a text editor and modify the line that says `APP_DEBUG=false` to say `APP_DEBUG=true`.

For the change to take effect, you need to reload the stack with `docker-compose up -d` from within the same folder. The containers will take a few moments to settle down after which you can reload the failed the request for a detailed error message and code stack trace.

### Checking Log Files

Logs are always written to one of two log files irrespective of whether the application is in debug mode or not. Application logs go to the Laravel frameworks log files. API requests sent to ESI are stored int he Eseye log file. Logs are stored in the applications storage directory which can be found in the `storage/logs` folder.

Assuming you followed the guides on this documentation site, the full path to the directory where log files are will be `/var/www/seat/storage/logs/`. In the case of Docker installations, this will also be the path within the `seat-app` container. Log files are rotated daily and are kept for a maximum of 10 days by default. Therefore, to get to todays application logs, the log file itself may be called `laravel-2018-05-31.log`. To find todays ESI requests logs, the log file will be called `eseye-2018-05-31.log`.

#### Live Logs - Host Installs

Irrespective of which log file you want to look at, getting todays live logs written to screen can be done with the following commands:

Application Logs:

```bash
tail -f /var/www/seat/storage/logs/laravel-$(date +%Y-%m-%d).log
```

Esye / ESI Logs:

```bash
tail -f /var/www/seat/storage/logs/eseye-$(date +%Y-%m-%d).log
```

#### Live Logs - Docker Installs

Application source code and log files are shared between the `seat-app`, `seat-worker` and `seat-cron` containers. Therefore the following commands can be executed on any of those containers. For purposes of demonstration, we are going to tail the logs from the `seat-app` container.

First, enter get a shell within the `seat-app` container while in the `/opt/seat-docker/` directory with:

```bash
docker-compose exec seat-app sh
```

Next, tail the log files you want to see.

Application Logs:

```bash
tail -f /var/www/seat/storage/logs/laravel-$(date +%Y-%m-%d).log
```

Esye / ESI Logs:

```bash
tail -f /var/www/seat/storage/logs/eseye-$(date +%Y-%m-%d).log
```

### Diagnose command

A diagnostics command exists that aims to perform a number of self-checks to help you diagnose problems. This command should be run as the same user the SeAT workers are running as, which is typically either `www-data` on Ubuntu / Debian based systems and `nginx` on CentOS based systems. If you have created yourself a separate user for SeAT, then running the diagnose command as that user is what you need to do.

#### Diagnose - Host Installs

Host installs require you to first `cd` to the directory where you installed SeAT. If you followed the guides on this website, that would be `/var/www/seat`. Next, run the diagnose command as the user you are running the workers as. If you are the `root` user, you can run it with:

```bash
su -c 'php artisan seat:admin:diagnose' -s /bin/sh www-data
```

#### Diagnose - Docker Installs

For Docker installations, the only requirement to run the diagnose command would be to ensure that you are currently in the same folder as that where the stacks `docker-compose.yml` file lives. If you followed the guides on this website that would be in `/opt/seat-docker`. Next, run the command with:

```bash
docker-compose exec seat-app su -c 'php artisan seat:admin:diagnose' -s /bin/sh www-data
```
