![SeAT](http://i.imgur.com/aPPOxSK.png)

At some stage, you may come to a point where a single install of SeAT might not be enough to process api key updates. Thankfully, it is actually very easy to scale SeAT horizontally in order to improve performance.
This document aims to share some *need to knows* before embarking on a tiered installation of SeAT.

## definitions
Lets get some definitions cleared up.

### server  
A *server* is defined as any VPS, hardware, docker container, or other form of virtualization. When talking performance though, keep in mind that there will probably be very little performance gains when everything runs on the same physical hardware instance.

### seat component
A *SeAT Component* is a collection of SeAT packages and configurations that is responsible for performing a specific task. Tasks include the SeAT Web Interface, the job workers or dispatchers.

## components
Before we can talk scale, we need to understand which components SeAT actually consists of. We will not talk about the [immutable resources](#immutable-resources) here as they will be mentioned in the next section.

So, which components are there to SeAT?

- The web front end.
- The queue workers.
- The job dispatcher.

Each of these components can live on their own [server](#server) and must share the same [immutable resources](#immutable-resources).

## immutable resources
While almost every component in SeAT can 'run on its own', there are some services that SeAT consumes that SeAT can not scale itself. Instead, SeAT can consume a clustered or load balanced instance of these services. There are various reasons for this where the most important is that state is maintained between queue workers using Redis and MySQL.

Services that should be shared between all SeAT components are:

- The Redis cache.
- The MySQL database.

When mentioning these components, they can definitely exist in their clustered/load balanced forms. For Redis, have a look at their [Redis cluster tutorial](https://redis.io/topics/cluster-tutorial) and for MySQL, you can have a look at their [MySQL cluster installation](https://dev.mysql.com/doc/refman/5.7/en/mysql-cluster-installation.html) documentation, or maybe resort to just setting up plain [master-master replication](https://dev.mysql.com/doc/refman/5.7/en/mysql-cluster-replication-multi-master.html).

## simple scaled setup
The following example setup is probably the most simple option to gain performance improvements by scaling out. The gist of it is that we simply add more *queue worker* components to the SeAT setup.

Lets start by taking a look at a diagram, showing the extra *queue worker* component added.

![simple scale](https://i.imgur.com/y1XSxIp.png)

Installing a new [server](#server) with only the queue worker component setup can bring a significant speed boost into the environment. A new queue worker could be configured to run an extra 4-6 jobs. This queue worker must be configured to make use of the [immutable resources](#immutable-resources).

## more complicated scaled setup
Of course, one can totally go full nelson and explode all of the components in use. Below is an example deployment (with data flow links, red for redis, blue for mysql) that shows how each SeAT component can live on its own server.

![complex scale](https://i.imgur.com/ZvCYCCE.png)

## component setups
Lets talk about component configurations quickly. Apart from the [immutable resources](#immutable-resources), all of the software needed can be sourced from SeAT packages. All of the standard requirements such as PHP7 and Supervisor 3 also apply. However, not all components would need a web server for example.

Below are the descriptions (and short requirements list) for the different SeAT components.

### web front end
To setup a web front end component, use the following steps:

- Ensure you have at least PHP7 installed.
- Ensure that you have a web server installed that can serve the `public/` directory from the SeAT project.
- Ensure that you have `composer` installed and available in `PATH`.
- Download SeAT somewhere like `/var/www/seat` using `composer create-project eveseat/seat /var/www/seat --no-dev`.
- Once installed, configure the `.env` files database and Redis settings to connect to your [immutable sources](#immutable-resources).

### queue worker
To setup a queue worker component, use the following steps:

- Ensure you have at least PHP7 installed.
- Ensure that you have supervisor3 installed.
- Ensure that you have `composer` installed and available in `PATH`.
- Download SeAT somewhere using `composer create-project eveseat/seat --no-dev`.
- Once installed, configure the `.env` files database and Redis settings to connect to your [immutable sources](#immutable-resources).
- Configure the workers in a `seat.ini` file for supervisor to start.

### job dispatcher
To setup a job dispatcher component, use the following steps:

- Ensure you have at least PHP7 installed.
- Ensure that you have `composer` installed and available in `PATH`.
- Download SeAT somewhere like `/var/www/seat` using `composer create-project eveseat/seat /var/www/seat --no-dev`.
- Once installed, configure the `.env` files database and Redis settings to connect to your [immutable sources](#immutable-resources).
- Setup the cronjob to run `php artisan schedule:run 1>> /dev/null 2>&1` every minute.
