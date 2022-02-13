![SeAT](https://i.imgur.com/aPPOxSK.png)

# Community Packages

Below is a list of packages contributed by the community. These packages normally follow the same installation procedure, however, its best you consult the documentation of the package itself in case there is anything special you need to get it working.

## Generic package installation

Packages will normally come in the form of a composer package that you need to include in your SeAT install, as well as a Service Provider that you need to bootstrap. So, generically speaking, installing a package will mean that you:

- Ensure that you are in the *path* where you installed. By default this should be 
`/var/www/seat`.

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

```bash
sudo -H -u www-data bash -c 'php artisan route:cache'
sudo -H -u www-data bash -c 'php artisan config:cache'
```

- *Clear SeAT cache* after installation:

```bash
sudo -H -u www-data bash -c 'php artisan seat:cache:clear'
```

- Bring your application *live* and back out of maintenance mode:

```bash
sudo -H -u www-data bash -c 'php artisan up'
```

Installing packages like this will ensure that none of the core SeAT packages are affected and you should be free to upgrade SeAT core at anytime.

## Docker package installation

Applying community packages to your SeAT instance with Docker requires you to update your .env file located in `/opt/seat-docker` and uncommenting SEAT_PLUGINS by removing '#' and entering the package(s) to be installed separating each package with a comma. An example of how to enter packages in your .env would be:

```yaml
# SeAT Plugins
# This is a list of the all of the third party plugins that you
# would like to install as part of SeAT. Package names should be
# comma seperated if multiple packages should be installed.

SEAT_PLUGINS=denngarr/seat-fitting,cryptaeve/seat-squad-sync
```

- Once you have entered the package(s) to be installed run the below command in `/opt/seat-docker`:

```bash
docker-compose up -d
```

After running the above command wait for containers affected to rebuild. If SeAT does not come back up refer to [Troubleshooting](https://eveseat.github.io/docs/troubleshooting/) for more insight.

## Package list

### SeAT specific packages

#### Maintained packages

| Package | Version | Description |
| ------- | ------- | ----------- |
| [alliancewaw/seat-mumble-register](https://github.com/waw-eve/seat-mumble-register) | [![Latest Stable Version](https://poser.pugx.org/alliancewaw/seat-mumble-register/v/stable)](https://packagist.org/packages/alliancewaw/seat-mumble-register) | This plugin provide an extension to generate a certificate for SeAT user and regist it to mumble server |
| [cryptaeve/seat-squad-sync](https://github.com/crypta-eve/seat-squad-sync ) | [![Latest Stable Version](https://poser.pugx.org/cryptaeve/seat-squad-sync/v/stable?format=flat-square)](https://packagist.org/packages/crypta-eve/seat-squad-sync ) | Adds the ability to sync squad members into filters of permissions |
| [cryptaeve/seat-text](https://github.com/crypta-eve/seat-text) | [![Latest Stable Version](https://poser.pugx.org/cryptaeve/seat-text/v/stable?format=flat-square)](https://packagist.org/packages/crypta-eve/seat-text) | A module to serve public static ascii, with editing access controlled by seat |
| [denngarr/seat-fitting](https://github.com/dysath/seat-fitting) | [![Latest Stable Version](https://poser.pugx.org/denngarr/seat-fitting/v/stable)](https://packagist.org/packages/denngarr/seat-fitting) | Module to check fittings per character |
| [denngarr/seat-srp](https://github.com/dysath/seat-srp) | [![Latest Stable Version](https://poser.pugx.org/denngarr/seat-srp/v/stable)](https://packagist.org/packages/denngarr/seat-srp) | A module for SeAT that tracks SRP requests |
| [humunuk/alliance-structure-mngmt](https://github.com/humunuk/alliance-structure-mngmt) | [![Latest Stable Version](https://poser.pugx.org/humunuk/alliance-structure-mngmt/v/stable?format=flat-square)](https://packagist.org/packages/humunuk/alliance-structure-mngmt) | Add "Structures" sub-menu to Alliance page and show all the structures that belong to corps in alliance |
| [kassie/calendar](https://github.com/BenHUET/eveseat-calendar) | [![Latest Stable Version](https://poser.pugx.org/kassie/calendar/v/stable)](https://packagist.org/packages/kassie/calendar) | Calendar plugin |
| [warlof/seat-connector](https://github.com/warlof/seat-connector) | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-connector/v/stable?format=flat-square)](https://packagist.org/packages/warlof/seat-connector) | A generic connector module that handles invites and roles management with any registered platform |
| [warlof/seat-discord-connector](https://github.com/warlof/seat-discord-connector) | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-discord-connector/v/stable?format=flat-square)](https://packagist.org/packages/warlof/seat-discord-connector) | A Discord driver to be used with `seat-connector` |
| [warlof/seat-teamspeak](https://github.com/warlof/seat-teamspeak) | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-teamspeak/v/stable?format=flat-square)](https://packagist.org/packages/warlof/seat-teamspeak) | A Teamspeak driver to be used with `seat-connector` |
| [recursivetree/seat-info](https://github.com/recursivetree/seat-info) | [![Latest Stable Version](https://poser.pugx.org/recursivetree/seat-info/v/stable?format=flat-square)](https://packagist.org/packages/recursivetree/seat-info) | A module that adds a small article systems for example as a corporation bulletin |
| [recursivetree/seat-rat](https://github.com/recursivetree/seat-rat) | [![Latest Stable Version](https://poser.pugx.org/recursivetree/seat-rat/v/stable?format=flat-square)](https://packagist.org/packages/recursivetree/seat-rat) | A module to monitor ratting usage in a system, e.g. to prevent dropping the bounty risk modifier in nullsec. |
| [simplyunnamed/seat-user-last-login](https://github.com/SimplyUnnamed/seat-user-last-logins) | [![Latest Stable Version](http://poser.pugx.org/simplyunnamed/seat-user-last-login/v)](https://packagist.org/packages/simplyunnamed/seat-user-last-login) | Tool to help find potential AFK's in your corporation. |

#### Incompatible packages with current stable SeAT version

| Package | Version | Description |
| ------- | ------- | ----------- |
| [denngarr/seat-billing](https://github.com/dysath/seat-billing) | [![Latest Stable Version](https://poser.pugx.org/denngarr/seat-billing/v/stable?format=flat-square)](https://packagist.org/packages/denngarr/seat-billing) | A billing module to help you with ore and rating taxes **(Looking for a new maintainer)** |
| [flyingferret/seat-whtools](https://github.com/flyingferret/seat-whtools) | [![Latest Stable Version](https://poser.pugx.org/flyingferret/seat-whtools/v/stable?format=flat-square)](https://packagist.org/packages/flyingferret/seat-whtools) | A small collection of tools for helping with Wh-Life corporation management, including calculating doctrine stocking levels (based on contracts and `denngarr/seat-fitting` plugin), a blue loot tax calculator, and a skill base certificate management.  Currently very much a  work in progress. |
| [warlof/slackbot](https://github.com/warlof/slackbot) | [![Latest Stable Version](https://poser.pugx.org/warlof/slackbot/v/stable?format=flat-square)](https://packagist.org/packages/warlof/slackbot) | A slack bot that handles invites and kicks based on an api key |

#### Deprecated packages

| Package | Version | Description |
| ------- | ------- | ----------- |
| [eve-scout/eveseat-oauth2-server](https://github.com/eve-scout/eveseat-oauth2-server) | [![Latest Stable Version](https://poser.pugx.org/eve-scout/eveseat-oauth2-server/v/stable?format=flat-square)](https://packagist.org/packages/eve-scout/eveseat-oauth2-server) | This EVE SeAT package enables an OAuth2 server for Single sign-on. |
| [freedenizen/eveseat-notes](https://github.com/freedenizen/eveseat-notes) | [![Latest Stable Version](https://poser.pugx.org/freedenizen/eveseat-notes/v/stable?format=flat-square)](https://packagist.org/packages/freedenizen/eveseat-notes) | A notes addon for seat 1.x |
| [herpaderpaldent/seat-discourse](https://github.com/herpaderpaldent/seat-discourse) | [![Latest Stable Version](https://poser.pugx.org/herpaderpaldent/seat-discourse/v/stable)](https://packagist.org/packages/herpaderpaldent/seat-discourse) | SeAT Discourse enables SeAT to act as SSO provider for your Discourse-Forum instance. Groups and Categories do respect roles of members. With this package you can create hidden sections for your member and public sections for potential recruits to which members get automatically access to. **Important:** Check installation instructions on Github. |
| [herpaderpaldent/seat-groups](https://github.com/herpaderpaldent/seat-groups) | [![Latest Stable Version](https://poser.pugx.org/herpaderpaldent/seat-groups/v/stable)](https://packagist.org/packages/herpaderpaldent/seat-groups) | Module to create auto, open and managed role groups to which user can be automatically be assigned, user can opt-in or user can apply to. |
| [herpaderpaldent/seat-notifications](https://github.com/herpaderpaldent/seat-notifications) | [![Latest Stable Version](https://poser.pugx.org/herpaderpaldent/seat-notifications/v/stable)](https://packagist.org/packages/herpaderpaldent/seat-notifications) | This is a fully functional notification package for discord and slack notifications. This package is very easily extendable by other packages and should replace core notifications at some point. Currently seat-groups provide many useful notifications. Notifications are send out by slack or discord bot and uses twice a full oAuth2 authentication of the user. |
| [warlof/seat-migrator](https://github.com/warlof/seat-migrator) | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-migrator/v/stable)](https://packagist.org/packages/warlof/seat-migrator) | A migration script between SeAT 2 and SeAT 3 |
| [warlof/seat-slack-sso](https://github.com/warlof/seat-slack-sso) | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-slack-sso/v/stable?format=flat-square)](https://packagist.org/packages/warlof/seat-slack-sso) | Slack SSO integration for seat 2.x |
| [warlof/eveseat-mining-ledger](https://github.com/warlof/eveseat-mining-ledger) | [![Latest Stable Version](https://poser.pugx.org/warlof/eveseat-mining-ledger/v/stable?format=flat-square)](https://github.com/warlof/eveseat-mining-ledger) | ESI capability that provides a mining ledger to SeAT 2.x |

!!! danger
    Packages in this section are provided as history and idea database. They will not work on the stable version since they are non longer maintained by their author or have been integrated in core.

### Other SeAT related packages

- [Betriebsrat/err-seat](https://github.com/Betriebsrat/err-seat)  
Seat Api Interface for errbot
- [eve-scout/passport-eveseat](https://github.com/eve-scout/passport-eveseat)  
Passport strategy for authenticating with EVE SeAT using the OAuth 2.0 API.
- [eve-scout/nodebb-plugin-sso-eveseat](https://github.com/eve-scout/nodebb-plugin-sso-eveseat)  
This NodeBB plugin allows users login/register via their EVE SeAT account.
- [tarioch/helm](https://github.com/tarioch/helm/tree/master/charts/eveseat)
Allows to install EVE SeAT on a Kubernetes Cluster
