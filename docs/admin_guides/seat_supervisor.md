![SeAT](http://i.imgur.com/aPPOxSK.png)

## introduction
SeAT is able to query a supervisor instance for worker statuses and other information. This information can then be displayed in the *Queue Status* screen.

![seat supervisor](https://i.imgur.com/fCnYQ08.png)

## requirements
Supervisor monitoring needs Supervisor version 3.0 or later. Check your supervisor version with `supervisord -v`. If you are running CentOS 6, please refer to the [updating supervisor on centos 6](#updating-supervisor-on-centos-6) section below before continuing.

## the config
A bit of setup work is needed in order to have your SeAT setup query a supervisor instance. The basic idea to get this working is:

- Add a `[inet_http_server]` configuration block to your `supervisor.conf` file and restart supervisor.
- Add the username, password, ip and port of the supervisor instance to your SeAT `.env` configuration file.

## 1. add supervisor configuration block.

On your server where `supervisor` is running, open the configuration file `/etc/supervisor/supervisord.conf` in your favorite text editor. Add the following configuration block to your configuration file:

```
[inet_http_server]
port=127.0.0.1:9001
username=seat
password=your_secure_password
```

Obviously, substitute the values with those that correspond with your environment. For most setups, the values in the example should be just fine.

![seat supervisor config](https://i.imgur.com/6jVLsLv.png)

Finally, restart supervisor itself.

## 2. configure SeAT with the new values.

SeAT itself also needs some configurations added in order for it to know where the supervisor instance is, as well as what password to use when querying for status information.

Again, on your server, find your SeAT installations `.env` file (usually located at `/var/www/seat/.env`) and add the following configuration block:

```
SUPERVISOR_RPC_ADDRESS=127.0.0.1
SUPERVISOR_RPC_USERNAME=seat
SUPERVISOR_RPC_PASSWORD=hd@rjf&@921aJlw0
SUPERVISOR_RPC_PORT=9001
SUPERVISOR_GROUP=seat
```

The defaults here should also be sufficient but feel free to adjust as needed.

### updating supervisor on centos 6
CentOS 6 ships with supervisor 2x by default. In order to get the supervisor monitoring to work, the following steps may be followed to upgrade your supervisor version.

- Install the [GhettoForge](http://ghettoforge.org/) repository. This can be done with:

```
# Download and install the latest release
GF=gf-release-6-10.gf.el6.noarch.rpm && curl -O http://mirror.symnds.com/distributions/gf/el/6/gf/x86_64/$GF && yum localinstall -y $GF && rm -f $GF

# Import the GhettoForge signing keys
rpm --import http://mirror.symnds.com/distributions/gf/RPM-GPG-KEY-gf.el6

# Enable the repository
yum install yum-utils -y
yum-config-manager --enable gf-plus
```

- Next, install Supervisor by running `yum install supervisor -y`

This will update your local installation to version 3x. Your old configuration will be saved in `/etc/supervisord.conf.rpmsave`. Supervisor 3 allows you to specify a `numprocs` setting in a command block instead of having to define multiple instances like you had to do with v2.x. You will need to create a file called `seat.ini` in `/etc/supervisord.d/`. This file should look something like this:

```
[program:seat]
command=/usr/bin/php /var/www/seat/artisan queue:work --queue=high,medium,low,default --tries 1 --timeout=604800
process_name = %(program_name)s-80%(process_num)02d
stdout_logfile = /var/log/seat-80%(process_num)02d.log
stdout_logfile_maxbytes=100MB
stdout_logfile_backups=10
numprocs=6
directory=/var/www/seat
stopwaitsecs=600
user=apache
```

- Restart supervisor with `/etc/init.d/supervisord restart` and check that your workers are running again with `supervisorctl status`.

## troubleshooting
In case something goes wrong, you have a few debugging options.

- Obviously, first ensure that `supervisor` itself is running.
- If the http interface is started on a remote server, ensure that no firewall is blocking TCP traffic to the destination server.
- If you just added the `inet_http_server` configuration block, restart supervisor and then check back on the web interface.
- Attempt to debug the connection using the [tinker](#troubleshooting-tinker-console) example below.
- Hop onto Slack (details in the contact page) for help.

## troubleshooting - tinker console
Another option you have to try and figure out why your supervisor integration might not be working would be to attempt to mimic the calls SeAT makes to supervisor and looking for errors.

Don't worry, this is easier than it looks!

First, drop into a `tinker` shell by running `php artisan tinker`. This will drop you into a fully booted instance of SeAT:

![seat tinker](https://i.imgur.com/eohUSMz.png)

Next, copy and paste the following instantiation code into the console. This will initialize the object needed to connect to the supervisor `inet_http_server` using the configuration in your `.env` config file:

```
$supervisor = new Supervisor\Supervisor(config('web.supervisor.name'), config('web.supervisor.rpc.address'), config('web.supervisor.rpc.username'), config('web.supervisor.rpc.password'), (int) config('web.supervisor.rpc.port'));
```

Pasting that should result in output similar to the below screenshot:

![seat tinker supervisor init](https://i.imgur.com/s2vmf3A.png)

Finally, attempt to get the current running processes by running the following code:

```
$supervisor->getProcesses();
```

As you can see in my example below, the object is unable to connect to the supervisor inet_http_server. This could indicate a number of things and should hopefully help with troubleshooting any errors that may occur.

![seat tinker supervisor init](https://i.imgur.com/PJC02j4.png)
