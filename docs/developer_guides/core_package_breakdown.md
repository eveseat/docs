![SeAT](https://i.imgur.com/aPPOxSK.png)

# Developers Guides - Core Package Breakdown

## Understanding the core SeAT packages

This section aims to describe the functional differences between the various SeAT packages.

### eveseat/api

Namespace: **Seat\Api**

Source Code: [link](https://github.com/eveseat/api)

This repository contains all the SeAT Api Endpoints, as well as the routes and views for API key management.

### eveseat/eveapi

Namespace: **Seat\Eveapi**

Source Code: [link](https://github.com/eveseat/eveapi)

This repository is the heart of the API update logic. It is responsible for doing the **actual** update work, pulling the EVE API documents from ESI, parsing them and storing the resultant data in the database. Most of the data models live in this repository too.

### eveseat/notifications

Namespace: **Seat\Notifications**

Source Code: [link](https://github.com/eveseat/notifications)

This repository contains a set of scheduled jobs that perform notifications type tasks. A notification can be something as simple as an alert about a corporation member that has been inactive for a period of time.

### eveseat/web

Namespace: **Seat\Web**

Source Code: [link](https://github.com/eveseat/web)

This repository contains the web interface for SeAT. It contains by far the most complex [service provider](https://github.com/eveseat/web/blob/master/src/WebServiceProvider.php) and will undoubtedly become the prime example/reference when developing packages for SeAT. This package is also the only one that has a permissions / ACL concept. Refer the to the permissions document for more information.

### eveseat/seat

Namespace: **App**

Source Code: [link](https://github.com/eveseat/seat)

This is the main SeAT repository. It does not really contain much logic. In fact, it should just be seen as the glue between all the core packages. This is the repository that is cloned when a new installation is done.

The most important part of this repository is the service providers that are bootstrapped with the application. The [providers array](https://github.com/eveseat/seat/blob/39ff75beb8185acd46f8490129e9178a9f190a70/config/app.php#L168) has the default Laravel providers as well as the SeAT providers at the end. These providers tell the application where to find routes, views, configs etc. For more detailed information about providers, refer to the [Laravel 5.5 documentation](http://laravel.com/docs/5.5/providers). When you write your package though, you should make use of package discovery as described in the [Laravel 5.5 documenation](https://laravel.com/docs/5.5/packages#package-discovery). This will make the installation of your package super simple without the need to edit any files.

### eveseat/services

Namespace: **Seat\Services**

Source Code: [link](https://github.com/eveseat/services)

This repository contains 'services'. A service is defined as any form of helper and or repository that other packages can depend on. The *eveseat/web* package (amongst others) make heavy use of the repository classes in this package.
