![SeAT](https://i.imgur.com/aPPOxSK.png)

# Requirements

## Hardware Requirements

As far as hardware goes, there isn't really a hard and fast rule on what is needed. The more resources you make available, the faster API updates will occur. However, there are some minimum *recommended* specifications.

| Type | Requirement |
| ------- | ------- |
| Memory | 1GB of RAM with a 1GB+ swap file. Ideally 2GB+ RAM with a swap file. |
| Hard Drive Space | 10GB (used mostly by the database and the EVE API caching). Again, more is better. Monitor this closely as your installation grows! |

!!! warning

    If you intend to process a large amount of data, plan your storage accordingly. The SeAT database can grow incredibly quickly depending on the amount of tokens you process.

## Software Requirements

Software version requirements are based on a *minimum* requirement.

| Type | Requirement | Version Check |
| ------------ | ------------- | ------------- |
| Operating System | Linux, preferably Ubuntu, Debian or CentOS. For Windows, you will need [Docker for Windows](https://docs.docker.com/docker-for-windows/). | Usually, running `cat /etc/issue` should give you a good idea. |
| Architecture | 64-bit only | `uname -p` |
| PHP | [PHP: ^7.1](http://php.net/)| `php -v` |
| Database | [MariaDB: ^10.2.7](https://mariadb.org/) or [MySQL: ^5.7](https://www.mysql.com/) | `mysql -V` |
| Caching Service | [Redis](https://redis.io/)  | `redis-server -v` |
| Service Supervisor | [Supervisor : 3](http://supervisord.org/) | `supervisord -v` |
| Web Server | any f.e. trafik or Apache | `nginx -v` |

For docker based installations, all you need is `docker` and `docker-compose`. If you already have it installed, check your current version with `docker version` and `docker-compose version` respectively:

| Type | Requirement | Version Check |
| ------------ | ------------- | ------------- |
| Docker | [Docker: ^18.0](https://www.docker.com/) | `docker -v` |
| Docker Compose | [Docker compose: ^1.20](https://docs.docker.com/compose/)| `docker-compose version` |

!!! warning

    Do not install Docker directly from your distributions repositories. These are usually out of date. Instead, rather follow the steps provided on dockers [official documentation](https://docs.docker.com/install/)
