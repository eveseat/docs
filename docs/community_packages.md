![SeAT](http://i.imgur.com/aPPOxSK.png)

Below is a list of packages contributed by the community. These packages normally follow the same installation procedure, however, its best you consult the documentation of the package itself in case there is anything special you need to get it working.

## generic package installation
Packages will normally come in the form of a composer package that you need to include in your SeAT install, as well as a Service Provider that you need to bootstrap. So, generically speaking, installing a package will mean that you:

- *Require* the package via composer:

```bash
composer require <package vendor>/<package-name>
```

- Bootstrap the packages service provider [here](https://github.com/eveseat/seat/blob/master/config/app.php#L164).

Installing packages like this will ensure that none of the core SeAT packages are affected and you should be free to upgrade SeAT core at anytime.

## package list

### SeAT specific packages
- [freedenizen/eveseat-notes](https://github.com/freedenizen/eveseat-notes)  
[![Latest Stable Version](https://poser.pugx.org/freedenizen/eveseat-notes/v/stable?format=flat-square)](https://packagist.org/packages/freedenizen/eveseat-notes)
a notes addon for seat 1.x
- [warlof/slackbot](https://github.com/warlof/slackbot)  
[![Latest Stable Version](https://poser.pugx.org/warlof/slackbot/v/stable?format=flat-square)](https://packagist.org/packages/warlof/slackbot)
a slack bot that handles invites and kicks based on an api key addon for seat 1.x and 2.x
- [warlof/seat-slack-sso](https://github.com/warlof/seat-slack-sso)  
[![Latest Stable Version](https://poser.pugx.org/warlof/seat-slack-sso/v/stable?format=flat-square)](https://packagist.org/packages/warlof/seat-slack-sso)
a slack SSO integration for seat 2.x
- [eve-scout/eveseat-oauth2-server](https://github.com/eve-scout/eveseat-oauth2-server)  
[![Latest Stable Version](https://poser.pugx.org/eve-scout/eveseat-oauth2-server/v/stable?format=flat-square)](https://packagist.org/packages/eve-scout/eveseat-oauth2-server)
This EVE SeAT package enables an OAuth2 server for Single sign-on.

### other SeAT related packages
- [Betriebsrat/err-seat](https://github.com/Betriebsrat/err-seat)  
Seat Api Interface for errbot
- [eve-scout/passport-eveseat](https://github.com/eve-scout/passport-eveseat)  
Passport strategy for authenticating with EVE SeAT using the OAuth 2.0 API.
- [eve-scout/nodebb-plugin-sso-eveseat](https://github.com/eve-scout/nodebb-plugin-sso-eveseat)  
This NodeBB plugin allows users login/register via their EVE SeAT account.
