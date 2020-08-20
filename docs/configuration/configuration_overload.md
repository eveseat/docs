![SeAT](https://i.imgur.com/aPPOxSK.png)

This page aims to give a brief overview of how configuration is handled in SeAT and its packages.
To give some perspective, we have to have a quick look at how packages are built and bootstrapped.

### Quick-n-dirty-package summary

All of SeAT's core internals are built as packages. This means, every package has a service provider.
All a service provider really is, is a class with 2 methods ie: `handle()` and `register()`.
When a service provider is bootstrapped into the application, these 2 methods are called at some stage.

It is in these methods that we tell the Laravel framework more about our package.
Amongst many things that we can tell it, one of them is configuration related.
All we really telling the application is where the configuration file is, and under which namespace does it live.
Another important fact is that SeAT package configurations are added with the `mergeConfigFrom()` method.
This means, you can override the defaults in your installation without worrying about breaking the package itself.

### Overriding configuration

Lets take a look at a sample package configuration file: The [eveseat/eveapi package] for example.
At the time of this writing, it has 5 configuration options. The first being a `version`, the last being `eseye_loglevel`.
When this package is installed, this configuration file will live somewhere deep inside your `vendor` folder.
Changing the value there is not impossible, but it will be lost with the next package upgrade.
The better method will be to override the change locally, inside you `config/` folder [here].

### An example, changing `eseye_loglevel`

To start, create the file `eveapi.config.php` inside the `config` folder.
Next, we add the contents in the file to return an array, specifying the `eseye_loglevel` key and its new value.
The file would look something like this:

```php
<?php

// File: config/eveapi.config.php

return [
    'eseye_loglevel' => 'debug',
];
```

That's it. The configuration should now have been overridden.

[eveseat/eveapi package]: https://github.com/eveseat/eveapi/blob/master/src/Config/eveapi.config.php
[here]: https://github.com/eveseat/seat/tree/master/config
