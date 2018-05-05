![SeAT](http://i.imgur.com/aPPOxSK.png)

This page aims to give a brief overview of how configuration is handled in SeAT and its packages. To give some perspective, we have to have a quick look at how packages are built and bootstrapped.

### Quick-n-dirty-package summary
All of SeAT's core internals are built as packages. This means, every package has a service provider. All a service provider really is, is a class with 2 methods ie: `handle()` and `register()`. When a service provider is bootstrapped into the application, these 2 methods are called at some stage.

It is in these methods that we tell the Laravel framework more about our package. Amongst many things that we can tell it, one of them is configuration related. All we really telling the application is where the configuration file is, and under which namespace does it live. Another important fact is that SeAT package configurations are added with the `mergeConfigFrom()` method. This means, you can override the defaults in your installation without worrying about breaking the package itself.

### Overriding configuration
Lets take a look at a sample package configuration file: The [eveseat/web package](https://github.com/eveseat/web/blob/master/src/Config/web.config.php) for example. At the time of this writing, it has 2 configuration options. The first being a `version`, the next being `max_access_mask`. When this package is installed, this configuration file will live somewhere deep inside your `vendor` folder. Changing the value there is not impossible, but it will be lost with the next package upgrade. The better method will be to override the change locally, inside you `config/` folder [here](https://github.com/eveseat/seat/tree/master/config).

### An example, changing `max_access_mask`
To start, create the file `web.config.php` inside the `config` folder. Next, we add the contents in the file to return an array, specifying the `max_access_mask` key and its new value. The file would look something like this:

```php
<?php

// File: config/web.config.php

return [
    'max_access_mask' => 123456
];
```

That's it. The configuration should now have been overridden.
