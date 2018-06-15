![SeAT](https://i.imgur.com/aPPOxSK.png)

# Home

Welcome to the [SeAT](https://github.com/eveseat/seat) documentation pages!

This site aims to provide you with useful, technical information about SeAT. Please refer to the index on the side for detailed installation instructions, documentation about SeAT internals and or development guidelines!

!!! info "Contributing to Documentation"
    Great software is coupled with even greater documentation. If you would like to contribute to making this documentation even better, please don't hesitate to fork the [documentation repository](https://github.com/eveseat/docs) and submit a pull request with your contribution. We are always looking for better information.

## Quick Start

There are many ways to install SeAT. In all cases you will need a dedicated Linux server as a minimum (except for Docker). Using the docker installation you are free to choose *any* Docker capable host (yes, even Windows!). However, if you choose to install SeAT in a VM, we suggest you choose an LTS version of Ubuntu, Debian or CentOS.

### Installation Options

Ignoring the details, to get SeAT installed quickly you have a few options. All of them will get you SeAT installed, but you still have to manually configure an SSO application on the EVE Online Developers portal.

| Method | Comments |
| ------------ |  ------------ |
| Docker | `bash <(curl -fsSL https://git.io/seat-docker)` <br> This will download and run a [helper script](https://github.com/eveseat/scripts/blob/master/docker-compose/bootstrap.sh) that will ensure `docker` and `docker-compose` is available and start SeAT in containers. |
| SeAT Tool | `bash <(curl -fsSL https://git.io/seat-installer)` <br> This will download and run a [helper script](https://github.com/eveseat/scripts/blob/master/install/installer.sh) to start the installation process. Once done, the SeAT Tool will be available to use and provide semi automated installation option for _Debian 8 / 9_, _Ubuntu LTS versions_ and _CentOS 7_. |
| Manually | You can always install SeAT using one of the detailed manual guides available. All you need is PHP, MariaDB, Redis and a web server and some Linux experience. Refer to the [manual guides](/installation/manual_installation/getting_started/) for more information. |

Best way to start your SeAT installation would be [Basic Installation](/installation/basic_installation/). However, if you know what you are doing or need more options, head over to [Advanced Installation](/installation/manual_installation/getting_started/)

## Upgrades / Updates

SeAT is being worked on continuously. New features are added, performance improvements are made and bug fixed are done too. If you wish to upgrade to the latest version of SeAT refer to the [upgrade-section](/upgrading/general).

## Contact

Want to get in touch with developers, or just other users of SeAT? Refer to the [contact](/about/contact/) details page to find out how!
