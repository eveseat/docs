![SeAT](http://i.imgur.com/aPPOxSK.png)

# Getting Started

Before you rush ahead and install SeAT, it would be a good idea to review what you need first. Once you have done this,
head over to the [quick install](quick_install/) guide to start the actual installation.

## Summary
SeAT is a self hosted web application. This means that you will need your own server (and optional domain) to host SeAT. SeAT needs [PHP7.1](http://php.net/), a [MariaDB](https://mariadb.org/) (or [MySQL](https://www.mysql.com/)) database, a [Redis](https://redis.io/) cache, [Supervisor](http://supervisord.org/) and an internet connection in order to be fully functional.

All of these can be installed and configured separately, or, if you are running a supported operating system, you can use the `seat` tool to perform the installation for you.

## Requirements

### Hardware
As far as hardware goes, there isn't really a hard and fast rule on what is needed. The more resources you make available, the faster API updates will occur. However, there are some minimum *recommended* specifications.

- Memory            : 1GB of RAM. Less can work, it will just be slow.
- Hard Drive Space  : 10GB (used mostly by the database and the EVE API caching)
- Operating System : Any linux distribution suit to SeAT, for Windows, we're relying on [Docker for Windows](https://docs.docker.com/docker-for-windows/) with Linux containers

!!! note

    Due to its structure and requirement, SeAT will **NOT** work on mutualized services.
    Do not attempt to install it on such services since you will fail for sure.

!!! warning

    If you plan to use Docker, you will need a bit more of storage space since services
    will share memory and CPU but not storage. Every SeAT image will contains each vendors.
    You probably be good with 20GB.
    
    Also, if you plan to process a large amount of data, schedule storage in consequence.
    After static content, the database will be the more storage consumsive. You also can
    defer it on a dedicated server.

### Software
Software specifications are also based on a *minimum* version requirement. These are:

- For Linux, almost any distribution that can run PHP and a Web server should be fine. For Windows, you need Docker with Linux containers
- PHP Version 7.1
- Supervisor Version 3
- MariaDB 10.2.7 or greater (or MySQL Version 5.7 or greater)
- A Web server such as Apache or Nginx
- Either an SSH or a RDP access according to the selected system
