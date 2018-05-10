![SeAT](https://i.imgur.com/aPPOxSK.png)

# Home

Welcome to the [SeAT](https://github.com/eveseat/seat) documentation pages!

This site aims to provide you with useful, technical information about SeAT. Please refer to the index on the side for 
detailed installation instructions, documentation about SeAT internals and or development guidelines!


!!! info "Contributing to Documentation"
    
    Great software is coupled with even greater documentation. If you would like to contribute to making this 
    documentation even better, please don't hesitate to fork the 
    [documentation repository](https://github.com/eveseat/docs) and submit a pull request with your contribution. 
    We are always looking for better information.



## Quick Start

There are many ways to install SeAT. In all cases you will need a dedicated Linux server as a minimum (except for Docker). Using the docker installation (which is recommended) you are free to choose *any* docker capable host (yes, even Windows!). However, if you choose to install SeAT in a VM, we suggest you choose an LTS version of Ubuntu.

### Installation Options

Ignoring the details, to get SeAT installed quickly you have a few options. All of them will get you SeAT installed, but you still have to manually configure an SSO application on the EVE Online Developers portal.

Method | command + comments
------------ |  ------------
via Docker (recommended) | `bash <(curl -fsSL https://git.io/seat-docker)` <br> This will download and run a [helper script](https://github.com/eveseat/scripts/blob/master/docker-compose/bootstrap.sh) that will ensure `docker` and `docker-compose` is available and start up SeAT in containers.
SeAT Tool | `bash <(curl -fsSL https://git.io/seat-installer)`  <br> This will download and run a helper script to start the installation process. Once done, the SeAT Tool will be available to use and provide semi automated installation option for _Debian 8 / 9_, _Ubuntu LTS versions_ and _CentOS 7_. To get started with this method, a helper script should be downloaded and run.
Manually | see instructions in (Advanced) Installations. You can always install SeAT using one of the detailed manual guides available. All you need is PHP, MariaDB, Redis and a web server and some Linux experience.

Best way to start your SeAT installation would be [Basic Installation](/guides/installation/basic_installation/installation)
if you know what you are doing head to: [(Advanced) Installation](/guides/installation/manual_installation/getting_started)

## Upgrades / Updates

SeAT is developed continuously, new features are developed, performance improvements made and bug fixed are. If you
wish to upgrade to the latest version of SeAT refer to the [upgrade-section](/guides/admin/upgrade/general_upgrades).
Refer to the upgrade guides applicable to your chosen installation method.

## Contact

Want to get in touch with developers, or just other users of SeAT? Refer to the [contact](/about/contact/) details page to find out how!
