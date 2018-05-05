![SeAT](http://i.imgur.com/aPPOxSK.png)

# Developers Guides - Core Package Breakdown

## Understanding the core SeAT packages

* **eveseat/api** [link](https://github.com/eveseat/api)  
Namespace: **Seat\Api**  
This repository contains all of the SeAT Api Endpoints. A full description of available methods can be found here: [[SeAT API Reference|SeAT-API-Reference]]

* **eveseat/console** [link](https://github.com/eveseat/console)  
Namespace: **Seat\Console**  
This repository contains all of the SeAT console applications. Console apps are accessed via the `artisan` command line eg: `php artisan seat:version`. The console applications typically make use of repository classes (more on these later) in the *eveseat/services* repo to retrieve and set information from the database. For more information on how to write a Laravel Console Command, see the [documentation here](http://laravel.com/docs/5.1/artisan)

* **eveseat/eveapi** [link](https://github.com/eveseat/eveapi)  
Namespace: **Seat\Eveapi**  
This repository is the heart of the EVE API update logic. It is responsible for doing the **actual** update work, pulling the EVE API XML documents, parsing them and storing the resultant data in the database. Most of the date models live in this repository

* **eveseat/notifications** [link](https://github.com/eveseat/notifications)  
Namespace: **Seat\Notifications**  
This repository contains a set of scheduled jobs that perform notifications type tasks. A notification can be something as simple as an alert about a corporation member that has been inactive for a period of time.

* **eveseat/web** [link](https://github.com/eveseat/eveapi)  
Namespace: **Seat\Eveapi**  
This repository contains the web interface for SeAT. It contains by far the most complex [service provider](https://github.com/eveseat/web/blob/master/src/WebServiceProvider.php) and will undoubtedly become the prime example/reference when developing packages for SeAT. This package is also the only one that has a permissions / ACL concept. Refer the to the permissions wiki document for more information.

* **eveseat/seat** [link](https://github.com/eveseat/seat)  
Namespace: **App**  
This is the main SeAT repository. It does not really contain much logic. It should actually be seen as the glue between all of the packages. This is the repository that is cloned when a new installation is done.  
The most important part of this repository is the service providers that are bootstrapped with the application. The [providers array](https://github.com/eveseat/seat/blob/master/config/app.php#L111) has the default Laravel providers as well as the SeAT providers at the end. These providers tell the application where to find routes, views, configs etc. For more detailed information, refer to the [Laravel 5.1 documentation](http://laravel.com/docs/5.1/providers). When you write your package, the user will have to add your provider to this very providers array for the package to become available, just like the SeAT core packages.

* **eveseat/services** [link](https://github.com/eveseat/services)  
Namespace: **Seat\Services**  
This repository contains 'services'. A service is defined as any form of helper and or repository that other packages can depend on. The *eveseat/web* package (amongst others) make heavy use of the repository classes in this package.
