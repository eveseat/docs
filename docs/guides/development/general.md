![SeAT](https://i.imgur.com/aPPOxSK.png)

# General Development Guide

## General

So, you have a bug / feature / curiosity to test out. Hopefully this article will help you quickly get set up to do that!

SeAT packages are developed as a standalone packages. The general idea being that you should be including them in the main `seat` projects `composer.json` like [here](https://github.com/eveseat/seat/blob/c80f13440ff67d1d21b484a9922893cf67cf7e43/composer.json#L21-L26). This of course will install all of the sources in the projects `vendor/` directory, though this is not always ideal from a development perspective.

Instead, you may decide to follow the next few steps to create a loadable package directory that you can commit to your fork. The following flow is generally how I work on the SeAT packages:

* From the main [seat](https://github.com/eveseat/seat) project, create a sub folder called `packages`. For clarities sake, this folder will be at the same level as say the `app` folder as well as the `composer.json` file.
* Next, I like to create the vendors directory for the package I am going to work on, so, create a folder in under `packages` and call it `eveseat`. (This is optional. If you skip it, make sure you keep that in mind when setting up the autoloader later).
* Clone your fork under the `eveseat` folder.
* Next, we move back to the original `composer.json` file, and add the following for PSR-4 class mapping (for the eveapi package):

```json
"psr-4": {
    "App\\": "app/",
    "Seat\\Eveapi\\": "packages/eveseat/eveapi/src/"
}
```

* Set up the autoloader by running `composer dump-autoload`
* You should now have the `Seat\Eveapi` namespace autoloaded and ready for your testing :D

Take special note of any dependencies that may be missing. You can resolve them by adding them to your `composer.json` and running `composer update`.
