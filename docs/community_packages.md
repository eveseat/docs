![SeAT](https://i.imgur.com/aPPOxSK.png)

# Community Packages

Below is a list of packages contributed by the community. These packages normally follow the same installation procedure, however, its best you consult the documentation of the package itself in case there is anything special you need to get it working.

## Blade package installation

Packages will normally come in the form of a composer package that you need to include in your SeAT install, as well as a Service Provider that you need to bootstrap. So, generically speaking, installing a package will mean that you:

- Ensure that you are in the *path* where you installed. By default, this should be `/var/www/seat`.

- Put your application into *maintenance mode*. This will ensure that no request from the outside will hit your applications logic, and also help you perform an upgrade uninterrupted. Do this with the following commands issued as the webserver user:

```bash
sudo -H -u www-data bash -c 'php artisan down'
```

- *Require* the package via composer:

```bash
sudo -H -u www-data bash -c 'composer require <package vendor>/<package-name>'
```

- *Publish* the assets with artisan:

```bash
sudo -H -u www-data bash -c 'php artisan vendor:publish --force --all'
```

- *Run migration* in order to update database:

```bash
sudo -H -u www-data bash -c 'php artisan migrate'
```

- *Renew config and route cache* to benefit of newly added functionalities:

```bash linenums="1"
sudo -H -u www-data bash -c 'php artisan route:cache'
sudo -H -u www-data bash -c 'php artisan config:cache'
```

- *Clear SeAT cache* after installation:

```bash
sudo -H -u www-data bash -c 'php artisan seat:cache:clear'
```

- *Seed schedule* so that new and missing commands get added to your schedule:

```bash
sudo -H -u www-data bash -c 'php /var/www/seat/artisan db:seed --class=Seat\\Services\\Database\\Seeders\\PluginDatabaseSeeder'
```

- Bring your application *live* and back out of maintenance mode:

```bash
sudo -H -u www-data bash -c 'php artisan up'
```

Installing packages like this will ensure that none of the core SeAT packages are affected and you should be free to upgrade SeAT core at anytime.

## Docker package installation

Applying community packages to your SeAT instance with Docker requires you to update your .env file located in `/opt/seat-docker` and uncommenting SEAT_PLUGINS by removing '#' and entering the package(s) to be installed separating each package with a comma. An example of how to enter packages in your .env would be:

```yaml linenums="1"
# SeAT Plugins
# This is a list of the all of the third party plugins that you
# would like to install as part of SeAT. Package names should be
# comma seperated if multiple packages should be installed.

SEAT_PLUGINS=denngarr/seat-fitting,cryptaeve/seat-squad-sync
```

- Once you have entered the package(s) to be installed run the below command in `/opt/seat-docker`:

=== "Docker (SeAT 4.x)"
    
    ```bash
    docker-compose up -d
    ```

=== "Docker (SeAT 5.x - using Traefik)"

    ```bash
    docker-compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.traefik.yml up -d
    ```

=== "Docker (SeAT 5.x - using reverse proxy)"

    ```bash
    docker-compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.proxy.yml up -d
    ```

After running the above command wait for containers affected to rebuild. If SeAT does not come back up refer to [Troubleshooting](https://eveseat.github.io/docs/troubleshooting/) for more insight.

## Package list

### SeAT specific packages

#### Maintained packages

| Package                                                                                         | Version (SeAT 4.x)                                                                                                                                                                                                                  | Version (SeAT 5.x)                                                                                                                                                                                                                  | Installation                                                                              | Description                                                                                                                                                                                                                                                |
|-------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [alliancewaw/seat-mumble-register](https://github.com/waw-eve/seat-mumble-register)             | [![Latest Stable Version](https://poser.pugx.org/alliancewaw/seat-mumble-register/v/stable?style=flat-square)](https://packagist.org/packages/alliancewaw/seat-mumble-register)                                                     | ![SeAT 5.x incompatible](https://img.shields.io/badge/SeAT%205.x-not--available--yett-critical?style=flat-square)                                                                                                                   |                                                                                           | [Read the docs](https://github.com/waw-eve/seat-mumble-register-backend/blob/main/README.md)                                                     This plugin provide an extension to generate a certificate for SeAT user and regist it to mumble server   |
| [cryocaustik/seat-hr](https://github.com/cryocaustik/seat-hr)                                   | [![Latest Stable Version](http://poser.pugx.org/cryocaustik/seat-hr/v/stable?style=flat-square)](https://packagist.org/packages/cryocaustik/seat-hr)                                                                                | [![Latest Unstable Version](http://poser.pugx.org/cryocaustik/seat-hr/v/unstable)](https://packagist.org/packages/cryocaustik/seat-hr)                                                                                              |                                                                                           | Human Resources plugin for SeAT with Applications (with customized questions per corporation), Blacklist, Intel, Kick History, Notes, and Sheet                                                                                                            |
| [cryptaeve/seat-squad-sync](https://github.com/crypta-eve/seat-squad-sync )                     | [![Latest Stable Version](https://img.shields.io/github/v/tag/crypta-tech/seat-squad-sync?filter=4.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/cryptaeve/seat-squad-sync)                     | [![Latest Stable Version](https://poser.pugx.org/cryptaeve/seat-squad-sync/v/stable?style=flat-square)](https://packagist.org/packages/cryptaeve/seat-squad-sync)                                                                   |                                                                                           | Adds the ability to sync squad members into filters of permissions                                                                                                                                                                                         |
| [cryptaeve/seat-text](https://github.com/crypta-eve/seat-text)                                  | [![Latest Stable Version](https://img.shields.io/github/v/tag/crypta-tech/seat-text?filter=1.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/cryptaeve/seat-text)                                 | [![Latest Stable Version](https://poser.pugx.org/cryptaeve/seat-text/v/stable?style=flat-square)](https://packagist.org/packages/cryptaeve/seat-text)                                                                               |                                                                                           | A module to serve public static ascii, with editing access controlled by seat                                                                                                                                                                              |
| [denngarr/seat-fitting](https://github.com/dysath/seat-fitting)                                 | [![Latest Stable Version](https://poser.pugx.org/denngarr/seat-fitting/v/stable?style=flat-square)](https://packagist.org/packages/denngarr/seat-fitting)                                                                           | See cryptatech-seat-fitting                                                                                                                                                                                                         |                                                                                           | Module to check fittings per character                                                                                                                                                                                                                     |
| [denngarr/seat-srp](https://github.com/dysath/seat-srp)                                         | [![Latest Stable Version](https://poser.pugx.org/denngarr/seat-srp/v/stable?style=flat-square)](https://packagist.org/packages/denngarr/seat-srp)                                                                                   | See cryptatech/seat-srp                                                                                                                                                                                                             |                                                                                           | A module for SeAT that tracks SRP requests                                                                                                                                                                                                                 |
| [cryptatech/seat-fitting](https://github.com/crypta-tech/seat-fitting)                          | See denngarr/seat-fitting                                                                                                                                                                                                           | [![Latest Stable Version](https://poser.pugx.org/cryptatech/seat-fitting/v/stable?style=flat-square)](https://packagist.org/packages/cryptatech/seat-fitting)                                                                       | [Read the docs](https://github.com/crypta-tech/seat-fitting/releases/tag/5.0.4)           | Module to check fittings per character                                                                                                                                                                                                                     |
| [cryptatech/seat-srp](https://github.com/crypta-tech/seat-srp)                                  | See denngarr/seat-srp                                                                                                                                                                                                               | [![Latest Stable Version](https://poser.pugx.org/cryptatech/seat-srp/v/stable?style=flat-square)](https://packagist.org/packages/cryptatech/seat-srp)                                                                               |                                                                                           | A module for SeAT that tracks SRP requests                                                                                                                                                                                                                 |
| [h4zz4rddev/seat-buyback](https://github.com/h4zz4rddev/seat-buyback)                           | [![Latest Stable Version](https://poser.pugx.org/h4zz4rddev/seat-buyback/v/stable?style=flat-square)](https://packagist.org/packages/h4zz4rddev/seat-buyback)                                                                       | ![SeAT 5.x incompatible](https://img.shields.io/badge/SeAT%205.x-not--available--yett-critical?style=flat-square)                                                                                                                   |                                                                                           | A SeAT module for buyback functionality                                                                                                                                                                                                                    |
| [humunuk/alliance-structure-mngmt](https://github.com/humunuk/alliance-structure-mngmt)         | [![Latest Stable Version](https://poser.pugx.org/humunuk/alliance-structure-mngmt/v/stable?style=flat-square)](https://packagist.org/packages/humunuk/alliance-structure-mngmt)                                                     | ![SeAT 5.x incompatible](https://img.shields.io/badge/SeAT%205.x-not--available--yett-critical?style=flat-square)                                                                                                                   |                                                                                           | Add "Structures" sub-menu to Alliance page and show all the structures that belong to corps in alliance                                                                                                                                                    |
| [kassie/calendar](https://github.com/BenHUET/eveseat-calendar)                                  | [![Latest Stable Version](https://poser.pugx.org/kassie/calendar/v/stable?style=flat-square)](https://packagist.org/packages/kassie/calendar)                                                                                       | ![SeAT 5.x incompatible](https://img.shields.io/badge/SeAT%205.x-not--available--yett-critical?style=flat-square)                                                                                                                   | [Read the docs](https://github.com/BenHUET/eveseat-calendar/blob/master/README.md)        | Calendar plugin                                                                                                                                                                                                                                            |
| [pyTonicis/seat-corp-mining-tax](https://github.com/pyTonicis/seat-corp-mining-tax)             | [![Latest Stable Version](https://img.shields.io/github/v/tag/pytonicis/seat-corp-mining-tax?filter=v1.2.0&style=flat-square&label=stable)](https://packagist.org/packages/pytonicis/seat-corp-mining-tax#v1.2.0)                   | [![Latest Stable Version](http://poser.pugx.org/pytonicis/seat-corp-mining-tax/v)](https://packagist.org/packages/pytonicis/seat-corp-mining-tax)                                                                                   | [Read the docs](https://github.com/pyTonicis/seat-corp-mining-tax/blob/master/README.md)  | A module to manage corporation mining taxes, mining statistics, corporation moon minings                                                                                                                                                                   |
| [warlof/seat-discord-connector](https://github.com/zenobio93/seat-discord-connector)            | [![Latest Stable Version](https://img.shields.io/github/v/tag/zenobio93/seat-discord-connector?filter=5.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/warlof/seat-discord-connector#5.1.1)      | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-discord-connector/v/stable?style=flat-square)](https://packagist.org/packages/warlof/seat-discord-connector)                                                           | [Read the docs](https://github.com/zenobio93/seat-discord-connector/blob/6.0.x/README.md) | A Discord driver to be used with `seat-connector`                                                                                                                                                                                                          |
| [warlof/seat-teamspeak](https://github.com/zenobio93/seat-teamspeak)                            | [![Latest Stable Version](https://img.shields.io/github/v/tag/zenobio93/seat-teamspeak?filter=5.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/warlof/seat-teamspeak#5.1.0)                      | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-teamspeak/v/stable?style=flat-square)](https://packagist.org/packages/warlof/seat-teamspeak)                                                                           | [Read the docs](https://github.com/zenobio93/seat-teamspeak/blob/6.0.x/README.md)         | A Teamspeak driver to be used with `seat-connector`                                                                                                                                                                                                        |
| [recursivetree/seat-info](https://github.com/recursivetree/seat-info)                           | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-info?filter=1.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-info)                           | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-info?filter=2.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-info)                           | [Read the docs](https://github.com/recursivetree/seat-info/blob/master/README.md)         | A module that adds a small wiki-like article systems for example as a corporation bulletin.<br/><br/>**SeAT 5.x**<br/>You need to follow [special steps](https://github.com/recursivetree/seat-info#4x---5x) after upgrading to retain your resource files. |
| [recursivetree/seat-rat](https://github.com/recursivetree/seat-rat)                             | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-rat?filter=1.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-rat)                             | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-rat?filter=2.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-rat)                             |                                                                                           | A module to monitor ratting usage in a system, e.g. to prevent dropping the bounty risk modifier in nullsec.                                                                                                                                               |
| [simplyunnamed/seat-user-last-login](https://github.com/SimplyUnnamed/seat-user-last-logins)    | [![Latest Stable Version](http://poser.pugx.org/simplyunnamed/seat-user-last-login/v?style=flat-square)](https://packagist.org/packages/simplyunnamed/seat-user-last-login)                                                         | ![SeAT 5.x incompatible](https://img.shields.io/badge/SeAT%205.x-not--available--yett-critical?style=flat-square)                                                                                                                   |                                                                                           | Tool to help find potential AFK's in your corporation.                                                                                                                                                                                                     |
| [recursivetree/seat-billing](https://github.com/recursivetree/seat-billing)                     | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-billing?filter=4.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-billing)                     | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-billing?filter=5.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-billing)                     |                                                                                           | A billing module to help you with ore and rating taxes.                                                                                                                                                                                                    |
| [recursivetree/seat-pushx-blamer](https://github.com/recursivetree/seat-pushx-blamer)           | [![Latest Stable Version](https://poser.pugx.org/recursivetree/seat-pushx-blamer/v/stable?style=flat-square)](https://packagist.org/packages/recursivetree/seat-pushx-blamer)                                                       | ![SeAT 5.x incompatible](https://img.shields.io/badge/SeAT%205.x-not--available--yett-critical?style=flat-square)                                                                                                                   |                                                                                           | A module to tell you who's guilty of blocking the PushX queue.                                                                                                                                                                                             |
| [recursivetree/seat-alliance-industry](https://github.com/recursivetree/seat-alliance-industry) | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-alliance-industry?filter=1.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-alliance-industry) | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-alliance-industry?filter=2.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-alliance-industry) |                                                                                           | A corporation/alliance/coalition industry order marketplace                                                                                                                                                                                                |
| [recursivetree/seat-inventory](https://github.com/recursivetree/seat-inventory)                 | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-inventory?filter=1.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-inventory)                 | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-inventory?filter=2.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-inventory)                 |                                                                                           | Inventory manager for contracts and corporation hangars.                                                                                                                                                                                                   |
| [recursivetree/seat-transport](https://github.com/recursivetree/seat-transport)                 | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-transport?filter=1.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-transport)                 | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-transport?filter=2.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-transport)                 |                                                                                           | This plugin is a calculator for hauling costs, for example for an alliance JF service.                                                                                                                                                                     |
| [recursivetree/seat-mineral-hauling](https://github.com/recursivetree/seat-mineral-hauling)     | ![SeAT 4.x incompatible](https://img.shields.io/badge/SeAT%204.x-not--available-critical?style=flat-square)                                                                                                                         | [![Latest Stable Version](https://img.shields.io/github/v/tag/recursivetree/seat-mineral-hauling?filter=1.*&style=flat-square&label=stable&color=%2328a3df)](https://packagist.org/packages/recursivetree/seat-mineral-hauling)     |                                                                                           | Calculates the most efficient way to move minerals in refined ore form.                                                                                                                                                                                    |

#### Price Provider Packages
These packages implement different prices sources for the [recursivetree/seat-prices-core](https://github.com/recursivetree/seat-prices-core) price provider system. If you are on SeAT 5 and use a plugin that uses [recursivetree/seat-prices-core](https://github.com/recursivetree/seat-prices-core) internally, you can install and use any of the following price provider packages.

| Price Provider                                                                                    | Version                                                                                                                                                                                   | Description                                |
|---------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------|
| [recursivetree/seat-prices-evepraisal](https://github.com/recursivetree/seat-prices-evepraisal)   | [![Latest Stable Version](https://poser.pugx.org/recursivetree/seat-prices-evepraisal/v/stable?style=flat-square)](https://packagist.org/packages/recursivetree/seat-prices-evepraisal)   | Prices from evepraisal clones              |
| [recursivetree/seat-prices-evemarketer](https://github.com/recursivetree/seat-prices-evemarketer) | [![Latest Stable Version](https://poser.pugx.org/recursivetree/seat-prices-evemarketer/v/stable?style=flat-square)](https://packagist.org/packages/recursivetree/seat-prices-evemarketer) | Prices from evemarketer.com                |
| [cryptatech/seat-prices-janice](https://github.com/crypta-tech/seat-prices-janice)                | [![Latest Stable Version](https://poser.pugx.org/cryptatech/seat-prices-janice/v/stable?style=flat-square)](https://packagist.org/packages/cryptatech/seat-prices-janice)                 | Prices from https://janice.e-351.com/      |
| [cryptatech/seat-prices-fuzzwork](https://github.com/crypta-tech/seat-prices-fuzzwork)            | [![Latest Stable Version](https://poser.pugx.org/cryptatech/seat-prices-fuzzwork/v/stable?style=flat-square)](https://packagist.org/packages/cryptatech/seat-prices-fuzzwork)             | Prices from https://market.fuzzwork.co.uk/ |

#### Library Packages
These packages provide utilities for other packages and usually don't need to be installed manually.

| Package                                                                             | Version                                                                                                                                                                     | Description                                                                                       |
|-------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| [warlof/seat-connector](https://github.com/zenobio93/seat-connector)                | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-connector/v/stable?style=flat-square)](https://packagist.org/packages/warlof/seat-connector)                   | A generic connector module that handles invites and roles management with any registered platform |
| [recursivetree/seat-treelib](https://github.com/recursivetree/seat-treelib)         | [![Latest Stable Version](https://poser.pugx.org/recursivetree/seat-treelib/v/stable?style=flat-square)](https://packagist.org/packages/recursivetree/seat-treelib)         | A module that contains shared code for all `recursivetree/*` plugins                              |
| [recursivetree/seat-prices-core](https://github.com/recursivetree/seat-prices-core) | [![Latest Stable Version](https://poser.pugx.org/recursivetree/seat-prices-core/v/stable?style=flat-square)](https://packagist.org/packages/recursivetree/seat-prices-core) | This plugin provides a price provider system for all plugins dealing with prices. Seat 5.x only.  |


#### Deprecated packages

| Package | Version                                                                                                                                                                       | Description |
| ------- |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| ----------- |
| [eve-scout/eveseat-oauth2-server](https://github.com/eve-scout/eveseat-oauth2-server) | [![Latest Stable Version](https://poser.pugx.org/eve-scout/eveseat-oauth2-server/v/stable?style=flat-square)](https://packagist.org/packages/eve-scout/eveseat-oauth2-server) | This EVE SeAT package enables an OAuth2 server for Single sign-on. |
| [flyingferret/seat-whtools](https://github.com/flyingferret/seat-whtools) | [![Latest Stable Version](https://poser.pugx.org/flyingferret/seat-whtools/v/stable?style=flat-square)](https://packagist.org/packages/flyingferret/seat-whtools)            | A small collection of tools for helping with Wh-Life corporation management, including calculating doctrine stocking levels (based on contracts and `denngarr/seat-fitting` plugin), a blue loot tax calculator, and a skill base certificate management.  Currently very much a  work in progress. |
| [freedenizen/eveseat-notes](https://github.com/freedenizen/eveseat-notes) | [![Latest Stable Version](https://poser.pugx.org/freedenizen/eveseat-notes/v/stable?style=flat-square)](https://packagist.org/packages/freedenizen/eveseat-notes)            | A notes addon for seat 1.x |
| [herpaderpaldent/seat-discourse](https://github.com/herpaderpaldent/seat-discourse) | [![Latest Stable Version](https://poser.pugx.org/herpaderpaldent/seat-discourse/v/stable?style=flat-square)](https://packagist.org/packages/herpaderpaldent/seat-discourse)                     | SeAT Discourse enables SeAT to act as SSO provider for your Discourse-Forum instance. Groups and Categories do respect roles of members. With this package you can create hidden sections for your member and public sections for potential recruits to which members get automatically access to. **Important:** Check installation instructions on Github. |
| [herpaderpaldent/seat-groups](https://github.com/herpaderpaldent/seat-groups) | [![Latest Stable Version](https://poser.pugx.org/herpaderpaldent/seat-groups/v/stable?style=flat-square)](https://packagist.org/packages/herpaderpaldent/seat-groups)                           | Module to create auto, open and managed role groups to which user can be automatically be assigned, user can opt-in or user can apply to. |
| [herpaderpaldent/seat-notifications](https://github.com/herpaderpaldent/seat-notifications) | [![Latest Stable Version](https://poser.pugx.org/herpaderpaldent/seat-notifications/v/stable?style=flat-square)](https://packagist.org/packages/herpaderpaldent/seat-notifications)             | This is a fully functional notification package for discord and slack notifications. This package is very easily extendable by other packages and should replace core notifications at some point. Currently seat-groups provide many useful notifications. Notifications are send out by slack or discord bot and uses twice a full oAuth2 authentication of the user. |
| [warlof/seat-migrator](https://github.com/warlof/seat-migrator) | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-migrator/v/stable?style=flat-square)](https://packagist.org/packages/warlof/seat-migrator)                                         | A migration script between SeAT 2 and SeAT 3 |
| [warlof/seat-slack-sso](https://github.com/warlof/seat-slack-sso) | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-slack-sso/v/stable?style=flat-square)](https://packagist.org/packages/warlof/seat-slack-sso)                    | Slack SSO integration for seat 2.x |
| [warlof/eveseat-mining-ledger](https://github.com/warlof/eveseat-mining-ledger) | [![Latest Stable Version](https://poser.pugx.org/warlof/eveseat-mining-ledger/v/stable?style=flat-square)](https://github.com/warlof/eveseat-mining-ledger)                  | ESI capability that provides a mining ledger to SeAT 2.x |
| [warlof/slackbot](https://github.com/warlof/slackbot) | [![Latest Stable Version](https://poser.pugx.org/warlof/slackbot/v/stable?style=flat-square)](https://packagist.org/packages/warlof/slackbot)                                | A slack bot that handles invites and kicks based on an api key |

### Other SeAT related packages

- [nullsecurity-australia/helm-charts](https://github.com/nullsecurity-australia/helm-charts/tree/main/charts/eveseat)
Allows to install EVE SeAT on a Kubernetes Cluster

!!! danger
    Packages after this message are provided as history and idea database. They will not work on the stable version since they are non longer maintained by their author or have been integrated in core.

- [Betriebsrat/err-seat](https://github.com/Betriebsrat/err-seat)  
Seat Api Interface for errbot
- [eve-scout/passport-eveseat](https://github.com/eve-scout/passport-eveseat)  
Passport strategy for authenticating with EVE SeAT using the OAuth 2.0 API.
- [eve-scout/nodebb-plugin-sso-eveseat](https://github.com/eve-scout/nodebb-plugin-sso-eveseat)  
This NodeBB plugin allows users login/register via their EVE SeAT account.

### Installing different versions

Sometimes it can be useful to install a version different from the latest version, for example if you want to install an older version of a plugin or if you want to test a bugfix. The easiest way to find all available versions is to go to the packagist site of the plugin by clicking on the version in the available plugins list. On packagist, if you scroll down, to the right you will find a list of all available versions.

=== "Blade"

    Follow the normal installation steps, but change the `composer require` command to include the package according to the following example:

    ```bash
    sudo -H -u www-data bash -c 'composer require <package vendor>/<package-name>:<version-name>'
    ```

=== "Docker (SeAT 4.x)"

    In your `.env` file, add the version to the package like this:
    
    ```
    SEAT_PLUGINS=<vendor>/<package>:<version>,cryptaeve/seat-squad-sync:4.0.2
    ```
    Next, restart the stack as usual.
    
    ```bash linenums="1"
    docker-compose down
    docker-compose up -d
    ```

=== "Docker (SeAT 5.x - using Traefik)"

    In your `.env` file, add the version to the package like this:
    
    ```
    SEAT_PLUGINS=<vendor>/<package>:<version>,cryptaeve/seat-squad-sync:4.0.2
    ```
    Next, restart the stack as usual.
    
    ```bash linenums="1"
    docker-compose down
    docker-compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.traefik.yml up -d
    ```

=== "Docker (SeAT 5.x - using proxy)"

    In your `.env` file, add the version to the package like this:
    
    ```
    SEAT_PLUGINS=<vendor>/<package>:<version>,cryptaeve/seat-squad-sync:4.0.2
    ```
    Next, restart the stack as usual.
    
    ```bash linenums="1"
    docker-compose down
    docker-compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.proxy.yml up -d
    ```
