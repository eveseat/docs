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
- [freedenizen/eveseat-notes](https://github.com/freedenizen/eveseat-notes)  
a notes addon for seat 1.x
- [warlof/slackbot](https://github.com/warlof/slackbot) [![Latest Stable Version](https://poser.pugx.org/warlof/slackbot/v/stable?format=flat-square)](https://packagist.org/packages/warlof/slackbot)
a slack bot which handle invite and kick based on Api Key addon for seat 1.x