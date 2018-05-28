![SeAT](https://i.imgur.com/aPPOxSK.png)

# Requirements

## Hardware Requirements

As far as hardware goes, there isn't really a hard and fast rule on what is needed. The more resources you make available, the faster API updates will occur. However, there are some minimum *recommended* specifications.

| Type | Requirement |
| ------- | ------- |
| Memory | 1GB of RAM with a swap file. More is better. |
| Hard Drive Space | 10GB (used mostly by the database and the EVE API caching). Again, more is better. Monitor this closely as your installation grows! |
| Operating System | Any linux distribution will work with SeAT (depending on how you choose to install). For Windows, the only option available is [Docker for Windows](https://docs.docker.com/docker-for-windows/) with Linux containers |

!!! warning

    If you intend to process a large amount of data, plan your storage accordingly. The SeAT database can grow incredibly quickly depending on the amount of tokens you process.

## Software Requirements

Software version requirements are based on a *minimum* requirement (Dockerized installation methods take care of these for you!). The requirements are:

| Type | Requirement |
| ------------ | ------------- |
| Operating System | Any Linux-based distribution that can run PHP and a Web server should be fine.  For Windows, you will need Docker for Linux containers. We recommend you choose something like [Ubuntu LTS](https://www.ubuntu.com/) as it is well supported and tested. |
| PHP | [PHP: 7.1](http://php.net/)|
| Database | [MariaDB: ^10.2.7](https://mariadb.org/) or [MySQL: ^5.7](https://www.mysql.com/) |
| Caching Service | [Redis](https://redis.io/)  |
| Service Supervisor | [Supervisor : 3.x.x](http://supervisord.org/) |
| Web Server | nginx, Apache |

For docker based installations, all you need is `docker` and `docker-compose`. If you already have it installed, check your current version with `docker version` and `docker-compose version` respectively:

| Type | Requirement |
| ------------ | ------------- |
| Docker | [Docker: ^18.0](https://www.docker.com/) |
| Docker Compose | [Docker compose: ^1.20](https://docs.docker.com/compose/)|
