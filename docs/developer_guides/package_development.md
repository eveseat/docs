![SeAT](https://i.imgur.com/aPPOxSK.png)

# Developers Guides - Package Development

## Introduction

So, you want to write a SeAT package? Hopefully this guide helps you along the way! This guide was written while writing the API package for SeAT [here](https://github.com/eveseat/api). I figured it would be best to try and capture the process to help in case I miss any important details.

Be sure to also have a look at the [Development Tips](/developer_guides/development_tips/) page!

## Background notes

I think its important to keep in mind a few things about how SeAT is put together. The most important being a brief description of what each core package offers, and how you can integrate with them. For a breakdown on what the core packages provide, please refer the to breakdown [here](/developer_guides/core_package_breakdown/).

SeAT 3 is written on [Laravel 5.5](http://laravel.com/docs/5.5). A **very** good thing to do would be to actually read the documentation top->bottom and get an idea of what is possible with the framework. SeAT core packages make heavy use of many of the features, based directly of what has been interpreted by this very documentation.

If you really want to start contributing packages, but juts cant get your head around this whole Laravel thing, then I can suggest you have a look at this excellent free course material covering the basics of what you will encounter in the SeAT codebase. [https://laracasts.com/series/laravel-5-fundamentals](https://laracasts.com/series/laravel-5-fundamentals)

## Getting started

The very first thing to do is prepare the empty git repository on say Github, as well as the composer package itself. Clone a clean repository, and run `composer init`, answering any questions. Once that is done, edit the resultant `composer.json` and prepare the `autoload` block. SeAT core follows the [PSR-4](http://www.php-fig.org/psr/psr-4/) autoloading standard. I will suggest you do the same. For some more detailed composer info, refer to the docs [here](https://getcomposer.org/doc/01-basic-usage.md). For the API package, I am going to autoload **Seat\Api** from the `src` directory using PSR-4.

## Service provider

As mentioned in the package breakdowns [here](/developer_guides/core_package_breakdown/), the *eveseat/seat* repository bootstraps packages via service providers or package discovery. This is actually a Laravel convention that SeAT just follows. To get our package ready, we need to create a service provider. Thankfully there is a command to stub a new one for us. For the API package, I just ran `php artisan make:provider ApiServiceProvider` and copied the resultant file from `app/Providers` to my packages `src/` directory. Our packages file structure now looks as follows:

```text
├── composer.json
└── src
    └── ApiServiceProvider.php
```

## Package structure

From here you pretty much free to do what you want. How you structure the package will obviously depend on what exactly your package provides. In principle, I prefer to follow the same package structure as Laravel does for web / console features. Since we are going to be providing web features with the API, we will quickly create a few folders in preparation for this. I know beforehand that we are going to need a model to store API tokens; middleware to authenticate API requests; routes and controllers for the actual api logic (preferably making use of the *eveapi/services* repository classes for data access) as well as a few web views for administrators to generate API tokens for applications. With that in mind, the initial structure looks as follows:

```text
├── composer.json
└── src
    ├── ApiServiceProvider.php
    ├── Config
    ├── Http
    │   ├── Controllers
    │   └── Middleware
    ├── Models
    ├── database
    │   └── migrations
    └── resources
        └── views
```

This will obviously change as we progress building the package.

## Routes and controllers

To start testing the API, we need to add a route and controller to process some requests and responses. My `routes.php` file will have a global `Route::group()` to encapsulate the routes in the **Seat\Api** namespace as well as prefix them with `api/`.

```php
// File: routes.php
Route::group([ 'namespace' => 'Seat\Api\Http\Controllers',
    'prefix' => 'api'
], function () {

    // Logic here
});
```

See the final product [here](https://github.com/eveseat/api/blob/master/src/Http/routes.php) for a more complete example.

Next, I add some logic with a route to `/`, update the base frameworks `composer.json` to autoload the **Seat\Api** namespace from the directory where my package lives, run `composer dump-autoload` and add the service provider to the *eveseat/seat* repositories `app.php` providers array. Lastly, I add a method to the service provider to load the routes and call it form the `boot()` method in the generated stub.

See the complete service provider [here](https://github.com/eveseat/api/blob/master/src/ApiServiceProvider.php)

```php
/**
* Include the routes
*/
public function add_routes()
{

    if (!$this->app->routesAreCached()) {
        include __DIR__ . '/Http/routes.php';
    }
}
```

As a final test, I check that my route is accessible from a booted SeAT app. :)  

### Routes

#### Access Control

Obviously, some routes are not for everyone's eyes. SeAT comes with middleware that can be used to filter out requests that may not be authorized for your route. As can be seen in the example below (from [here](https://github.com/eveseat/api/blob/e8c713740fc571683130379acff0f39736b937ad/src/Http/routes.php#L32)), we are filtering out requests to `api-admin` for only superusers.

```php
Route::group([
        'namespace'  => 'Admin',
        'middleware' => 'bouncer:superuser', // The ACL specification.
        'prefix'     => 'api-admin'
    ], function () {
        Route::get('/', [
            'as'   => 'api-admin.list',
            'uses' => 'ApiAdminController@listTokens']);
    });
```

I suggest you have a look at the `eveseat/web` packages routes definitions for more examples on how the middleware is used. [https://github.com/eveseat/web/tree/master/src/Http/Routes](https://github.com/eveseat/web/tree/master/src/Http/Routes)

#### Middleware

To auth our API requests, we are going to go with token based authentication for now. We want users to present us with a `X-Token` header (from a valid allowed src IP address) before they may proceed with their request. To do this, we will filter requests using middleware. Thankfully, again, Laravel comes with a command to stub us some empty middleware. Run `php artisan make:middleware ApiToken` and copy it to your projects `Middleware` folder. Next we should register the middleware in our service provider. I do this by adding a method and calling it in `boot()`.

See the complete middleware [here](https://github.com/eveseat/api/blob/master/src/Http/Middleware/ApiToken.php)

```php
/**
 * Include the middleware needed
 *
 * @param $router
 */
public function add_middleware($router)
{

    // Authenticate checks that the token is valid
    // from an allowed IP address
    $router->middleware('api.auth', ApiToken::class);

}
```

## Views

Although almost all of our interfacing with this package will be via the json api endpoints, we need to add a few routes that will give an administrator the ability to generate API tokens as well as view logs etc. This will be for an administrator, so we will re-use the ACL features provided by the `eveseat/web` package to ensure that only admins an access our api-admin routes. Views live in `resources/views` and are bootstrapped to the `api` namespace in the service provider. See the service provider [here](https://github.com/eveseat/api/blob/master/src/ApiServiceProvider.php) for an example.

Note how we are re-using views that exist in the `web` namespace. All we have to do is extend one of the [grids](https://github.com/eveseat/web/tree/master/src/resources/views/layouts/grids) like [here](https://github.com/eveseat/api/blob/master/src/resources/views/list.blade.php#L1) and start without our blade template.

### Sidebar menu

Integrating with the sidebar is also really easy. All you have to do is create a config file, bootstrap it in the service provider and viola. The config file itself has a set structure for the `web` package to interpret and can be seen [here](https://github.com/eveseat/api/blob/master/src/Config/package.sidebar.php).

```php
return [
    'api' => [
        'permission'    => 'Superuser',
        'name'          => 'Api Tokens',
        'icon'          => 'fa-exchange',
        'route_segment' => 'api-admin',
        'entries'       => [
            [   // Manage API Tokens
                'name'  => 'Manage',
                'icon'  => 'fa-key',
                'route' => 'api-admin.list'
            ]
        ]
    ]
];
```

The format is generally an array, whereby the first key is the name of your package (`api` in this case). Thereafter you can specify the main entry, and any sub entries you want to add. The `route` key should refer to the named route. The sidebar loader will resolve the route itself for you. If you have any permissions requirements for your package, the `permission` key can be used together with a required SeAT permission to render the view.

### Character submenus

Integrating with the character sub menus is also really easy. Just like the sidebar, all you have to do is create a config file, bootstrap it in the service provider and viola. The namespace should be named `package.character.menu` in your service provider. A sample config file can be seen below:

```php
// file: package.character.menu.php

return [
    [
        'name'           => 'Research',
        'permission'     => 'character.research',
        'highlight_view' => 'research',
        'route'          => 'character.view.research'
    ]
];
```

### Corporation submenus

Integrating with the corporation sub menus is also really easy. Just like the sidebar and character menus, all you have to do is create a config file, bootstrap it in the service provider and viola. The namespace should be named `package.corporation.menu` in your service provider. A sample config file can be seen below:

```php
// file: package.corporation.menu.php

return [
    [
        'name'           => 'Research',
        'permission'     => 'corporation.research',
        'highlight_view' => 'research',
        'route'          => 'corporation.view.research'
    ]
];
```

### Bootstrapping menu items

In the above items, we refer to the files needing to be *bootstrapped* via the service provider. All this really means is that we have to tell the Laravel application where to find configuration information for a namespace. So, if we wanted to add a sidebar item, we would add the following line to the `register()` method of the service provider:

```php
// Include this packages menu items
$this->mergeConfigFrom(__DIR__ . '/Config/package.sidebar.php', 'package.sidebar');
```

The first argument is the file with the sidebar definitions, the second is the namespace.

## Database

For our API package, we have a database requirement. We need to store api tokens and the ip address that is allowed to use them. We are also going to store an access log (based on the config setting). We create migrations and models just like you would for a base Laravel 5.1 application. The only thing to remember is that your migrations for your package must be published (and specified in your service provider).
