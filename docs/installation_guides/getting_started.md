![SeAT](http://i.imgur.com/aPPOxSK.png)

Before you rush ahead and install SeAT, it would be a good idea to review what you need first. Once you have done this,
head over to the [quick install](quick_install/) guide to start the actual installation. If you want to install SeAT manually, some operating system specific guides are available. If you want to install on an operating system that is not listed, then follow the [generic installation](generic_installation) guide.

## summary
SeAT is a self hosted web application. This means that you will need your own server (and optional domain) to host SeAT. SeAT needs [PHP7](http://php.net/), a [MySQL](https://www.mysql.com/) (or [MariaDB](https://mariadb.org/)) database, a [Redis](https://redis.io/) cache, [Supervisor](http://supervisord.org/) and an internet connection in order to be fully functional.

All of these can be installed and configured separately, or, if you are running a supported operating system, you can use the `seat` tool to perform the installation for you.

## requirements
Next, lets cover requirements.

### hardware
As far as hardware goes, there isn't really a hard and fast rule on what is needed. The more resources you make available, the faster API updates will occur. However, there are some minimum *recommended* specifications.

- Memory            : 2GB of RAM. Less can work, it will just be slow.
- Hard Drive Space  : 10GB (used mostly by the database and the EVE API caching)

### software
Software specifications are also based on a *minimum* version requirement. These are:

- Linux. Almost any distribution that can run PHP and a Web server should be fine. There are no plans to support windows yet. Sorry.
- PHP Version 7
- Supervisor Version 3
- MySQL Version 5.5 (or the MariaDB equivalent)
- A Web server such as Apache or Nginx

## seat tool
Since SeAT v2.0, a `seat` tool has been made available to help with installation of both production and development environments, upgrades as well as generic diagnostics of an existing installation. To get the `seat` too, simply download it to a location that will be in your `PATH` such as `/usr/local/bin`.

To download the `seat` tool, run the following commands:
```
curl -fsSL https://git.io/vXb0u -o /usr/local/bin/seat
chmod +x /usr/local/bin/seat
hash -r
```

You should now be able to run it by simply running the command `seat`:

```
$ seat
SeAT Installer a604b43

Usage:
  command [options] [arguments]

Options:
  -h, --help            Display this help message
  -q, --quiet           Do not output any message
  -V, --version         Display this application version
      --ansi            Force ANSI output
      --no-ansi         Disable ANSI output
  -n, --no-interaction  Do not ask any interactive question
  -v|vv|vvv, --verbose  Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug

Available commands:
  help                 Displays help for a command
  list                 Lists commands
 diagnose
  diagnose:seat        Diagnose a SeAT Instance
 install
  install:development  Install a SeAT Development Instance
  install:production   Install a SeAT Production Instance
 update
  update:seat          Update a SeAT Installation
  update:self          Update this SeAT Installer
```
