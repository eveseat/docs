![SeAT](https://i.imgur.com/aPPOxSK.png)

# Home

Welcome to the [SeAT](https://github.com/eveseat/seat) documentation pages!

This site aims to provide you with useful, technical information about SeAT. Please refer to the index on the side for detailed installation instructions, documentation about SeAT internals and/or development guidelines!

!!! info "Contributing to Documentation"

    Great software is coupled with even greater documentation. If you would like to contribute to making this documentation even better, please don't hesitate to fork the [documentation repository](https://github.com/eveseat/docs) and submit a pull request with your contribution. We are always looking for better information.

## Quick Start

There are many ways to install SeAT. In all cases you will need a dedicated server as a minimum.
Using the docker installation you are free to choose *any* Docker capable host (yes, even Windows!).
However, if you choose to install SeAT on bare metal, you'll need a linux distribution.
We suggest you choose an LTS version of Ubuntu, Debian or CentOS.

### Installation Options

Ignoring the details, to get SeAT installed quickly you have a few options.
All of them will get you SeAT installed, but you still have to manually configure an SSO application on the [EVE Online Developers Portal].

| Method   | Comments     |
| -------- | ------------ |
| Docker   | Follow our [docker installation] guide. This is the recommended way to install SeAT as it will handle near everything for you. |
| Manually | You can always install SeAT by following our [manual installation guide]. All you need is PHP, MariaDB, Redis and a web server and some Linux experience. |

!!! warning

    While installing SeAT - choose one method, and stick to it. Otherwise, you'll get SeAT installed multiple times.

## Upgrades / Updates

SeAT is being worked on continuously. New features are added, performance improvements are made and bugs are fixed. If you wish to upgrade to the latest version of SeAT refer to the [upgrade section].

## Contact

Want to get in touch with developers, or just other users of SeAT? Refer to the [contact] section to find out how!

[docker installation]: installation/docker_installation.md
[manual installation guide]: installation/manual_installation.md
[EVE Online Developers Portal]: https://developers.eveonline.com
[upgrade section]: upgrading/general.md
[contact]: about/contact.md