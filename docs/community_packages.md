![SeAT](https://i.imgur.com/aPPOxSK.png)

# Community Packages

Below is a list of packages contributed by the community. These packages normally follow the same installation procedure, however, its best you consult the documentation of the package itself in case there is anything special you need to get it working.

## Generic package installation
Packages will normally come in the form of a composer package that you need to include in your SeAT install, as well as a Service Provider that you need to bootstrap. So, generically speaking, installing a package will mean that you:

- Ensure that you are in the *path* where you installed. By default this should be 
`/var/www/seat`.

- Put your application into *maintenance mode*. This will ensure that no request from the outside will hit your applications logic, and also help you perform an upgrade uninterrupted. Do this with:

```bash
php artisan down
```

- *Require* the package via composer:

```bash
composer require <package vendor>/<package-name>
```

- *Publish* the assets with artisan:

```bash
php artisan vendor:publish --force --all
```

- *Run migration* in order to update database:

```bash
php artisan migrate
```

- *Clear SeAT cache* after installation:

```bash
php artisan seat:cache:clear
```
- Bring your application *live* and back out of maintenance mode:

```bash
php artisan up
```

Installing packages like this will ensure that none of the core SeAT packages are affected and you should be free to upgrade SeAT core at anytime.

## Package list

### SeAT specific packages

#### Maintained packages

| Package | Version | Description |
| ------- | ------- | ----------- |
| [denngarr/seat-fitting](https://github.com/dysath/seat-fitting) | [![Latest Stable Version](https://poser.pugx.org/denngarr/seat-fitting/v/stable)](https://packagist.org/packages/denngarr/seat-fitting) | Module to check fittings per character|
| [denngarr/seat-srp](https://github.com/dysath/seat-srp) | [![Latest Stable Version](https://poser.pugx.org/denngarr/seat-srp/v/stable)](https://packagist.org/packages/denngarr/seat-srp) | A module for SeAT that tracks SRP requests|
| [herpaderpaldent/seat-discourse](https://github.com/herpaderpaldent/seat-discourse) | [![Latest Stable Version](https://poser.pugx.org/herpaderpaldent/seat-discourse/v/stable)](https://packagist.org/packages/herpaderpaldent/seat-discourse) | SeAT Discourse enables SeAT to act as SSO provider for your Discourse-Forum instance. Groups and Categories do respect roles of members. With this package you can create hidden sections for your member and public sections for potential recruits to which members get automatically access to. **Important:** Check installation instructions on Github. |
| [herpaderpaldent/seat-groups](https://github.com/herpaderpaldent/seat-groups) | [![Latest Stable Version](https://poser.pugx.org/herpaderpaldent/seat-groups/v/stable)](https://packagist.org/packages/herpaderpaldent/seat-groups) | Module to create auto, open and managed role groups to which user can be automatically be assigned, user can opt-in or user can apply to. |
| [herpaderpaldent/seat-notifications](https://github.com/herpaderpaldent/seat-notifications) | [![Latest Stable Version](https://poser.pugx.org/herpaderpaldent/seat-notifications/v/stable)](https://packagist.org/packages/herpaderpaldent/seat-notifications) | This is a fully functional notification package for discord and slack notifications. This package is very easily extendable by other packages and should replace core notifications at some point. Currently seat-groups provide many useful notifications. Notifications are send out by slack or discord bot and uses twice a full oAuth2 authentication of the user. |
| [kassie/calendar](https://github.com/BenHUET/eveseat-calendar) | [![Latest Stable Version](https://poser.pugx.org/kassie/calendar/v/stable)](https://packagist.org/packages/kassie/calendar) | Calendar plugin for SeAT 2.x and 3.x |
| [warlof/seat-discord-connector](https://github.com/warlof/seat-discord-connector) | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-discord-connector/v/stable?format=flat-square)](https://packagist.org/packages/warlof/seat-discord-connector) | A connector that handles invites and roles management in a Discord Guild addon for seat 3.x |
| [warlof/seat-migrator](https://github.com/warlof/seat-migrator) | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-migrator/v/stable)](https://packagist.org/packages/warlof/seat-migrator) | A migration script between SeAT 2 and SeAT 3 |
| [warlof/slackbot](https://github.com/warlof/slackbot) | [![Latest Stable Version](https://poser.pugx.org/warlof/slackbot/v/stable?format=flat-square)](https://packagist.org/packages/warlof/slackbot) | A slack bot that handles invites and kicks based on an api key addon for seat 1.x, 2.x and 3.x |
| [warlof/seat-teamspeak](https://github.com/warlof/seat-teamspeak) | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-teamspeak/v/stable?format=flat-square)](https://packagist.org/packages/warlof/seat-teamspeak) | A connector that handles invites and roles management in a Teamspeak Server addon for seat 2.x and 3.x |

#### Deprecated packages

| Package | Version | Description |
| ------- | ------- | ----------- |
| [freedenizen/eveseat-notes](https://github.com/freedenizen/eveseat-notes) | [![Latest Stable Version](https://poser.pugx.org/freedenizen/eveseat-notes/v/stable?format=flat-square)](https://packagist.org/packages/freedenizen/eveseat-notes) | A notes addon for seat 1.x |
| [warlof/seat-slack-sso](https://github.com/warlof/seat-slack-sso) | [![Latest Stable Version](https://poser.pugx.org/warlof/seat-slack-sso/v/stable?format=flat-square)](https://packagist.org/packages/warlof/seat-slack-sso) | Slack SSO integration for seat 2.x |
| [warlof/eveseat-mining-ledger](https://github.com/warlof/eveseat-mining-ledger) | [![Latest Stable Version](https://poser.pugx.org/warlof/eveseat-mining-ledger/v/stable?format=flat-square)](https://github.com/warlof/eveseat-mining-ledger) | ESI capability that provides a mining ledger to SeAT 2.x |
| [eve-scout/eveseat-oauth2-server](https://github.com/eve-scout/eveseat-oauth2-server) | [![Latest Stable Version](https://poser.pugx.org/eve-scout/eveseat-oauth2-server/v/stable?format=flat-square)](https://packagist.org/packages/eve-scout/eveseat-oauth2-server) | This EVE SeAT package enables an OAuth2 server for Single sign-on. |

!!! danger

    The package in this section are provided as history and idea database. They will not work on the stable version since they are non longer maintained by their author or have been integrated in core.

### Other SeAT related packages

- [Betriebsrat/err-seat](https://github.com/Betriebsrat/err-seat)  
Seat Api Interface for errbot
- [eve-scout/passport-eveseat](https://github.com/eve-scout/passport-eveseat)  
Passport strategy for authenticating with EVE SeAT using the OAuth 2.0 API.
- [eve-scout/nodebb-plugin-sso-eveseat](https://github.com/eve-scout/nodebb-plugin-sso-eveseat)  
This NodeBB plugin allows users login/register via their EVE SeAT account.
- [tarioch/helm](https://github.com/tarioch/helm/tree/master/charts/eveseat)
Allows to install EVE SeAT on a Kubernetes Cluster
