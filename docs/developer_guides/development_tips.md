![SeAT](https://i.imgur.com/aPPOxSK.png)

# Development Tips

This page contains general tips and tricks that may be useful during package development.

## Best practices

No doubt, there are no limits to what code you can write, how you structure it and how you name things. However, the last thing you want is to have conflicts with the SeAT core, or someone elses package! The following list contains some tips to help you avoid those conflicts and to help people better discover your packages:

- Prefix your github repository name with `seat` eg: `seat-teamspeak`.
- Tag your github repository with `seat`.
- Use a unique package namespace such as `Author\Seat\Package\` eg: `Warlof\Seat\Teamspeak\`.
- Prefix your database table names with something unique to your package. eg `warlof_teamspeak_users`. 
  Although you shouldn't make your prefix too long, as there is a 64 character table length limit.
- Do not modify core tables. This will break future updates for users of your package.
- Prefix your settings with both an author and package eg: `warlof.teamspeak.address`.
- Prefix redis records with both author and package eg: `warlof.teamspeak.channels`.
- In your `composer.json` file, set the `type` to `seat-plugin`.
- Avoid altering core tables, especially introducing relationship - this might break core migrations. Prefer to use observer if you need to maintain your data across core models.
- If you need an API or something the SeAT core doesn't provide, consider contributing it. The SeAT core is not set in stone.
- Scope your routes: For example all routes from the seat core start with `seatcore`like this: `seatcore::my.route.to.someting`. You should follow a similar format: `seat<plugin name>::<route>`
- Use a [schedule seeder](package_development.md#jobs--schedules) for adding commands to the schedule. Compared to migrations, this has the advantage that accidentally deleted commands will be added back automatically on the next restart.
- For all your model, extend from `\Seat\Services\Models\ExtensibleModel` instead of the standard laravel `Model`. They are functionally equivalent, but `ExtensibleModel` allows [injectable relations](#injectable-relations).

## Model Observers

Depending on what your package does, it may be interesting for you to know when data is created / deleted. Given that SeAT makes use of Laravel, you have the ability to subscribe to events that occur on any model within SeAT.

For example, should a `User` model get deleted, the `deleted` event will get fired. Writing an observer class and subscribing to it with `\Seat\Web\Models\User::observer(\My\Namespace\UserObserver::class)` will allow you to define a `deleted()` method inside of your observer class and perform extra logic with the `User` that got deleted.

Examples of where this may be interesting could be if you need to have cleanup code for tables that your package includes.

For more information, checkout the Laravel documentation on [Eloquent Observers](https://laravel.com/docs/10.x/eloquent#observers).

## Useful SeAT-Specific Features
### Deferred Migrations
Sometimes you might want to run some business logic in a migration. For example, when adding a new column, you might want to fill that column with a computation that is part of your business logic.
If you have all the logic inside your migration class, and you don't depend on any other application code, you are good. However, when your migration depends on application code, it is likely that
you run into issues later down the line. Your business logic probably assumes that all your migrations have run. However, when calling business logic from migrations, this is not guaranteed. 
Later migrations have not yet run, meaning you are likely to run into issues.

Seat offers a solution to this: Deferred Migrations. These are functions that can be scheduled in a migration and that run after all other migrations have finished.
In your migration, you can schedule a deferred migration like this:

```php
\Seat\Services\Facades\DeferredMigration::schedule(function (){
    // this closure runs after all migrations have finished. It is save to call business logic from here.
});
```

### Injectable Relations
Cross-package interaction is at the heart of SeAT. For example, plugins use the ESI data pulled by `eveapi`. However, there is one issue: While a plugin can always assume that `eveapi` is there,
this is not possible the other way around. The seat core can run without any plugin. This implies that the plugin can have a relation pointing from a plugin model to a core model, but not the other
way around.

In SeAT, there is a system of injectable relations that helps with this. In short, to any model extending from `\Seat\Services\Models\ExtensibleModel`, you can attach relations similar to how you
attach observers. 

First, you create a model extension class containing the relations you want to add to the base model. This extension class should extend from the base model.

Second, you register the extension classes in your service provider's boot method like this:
```php
BaseModel::injectRelationsFrom(ModelExtension::class);
```

The relations defined in the model extension class should now be usable on the base model. 

Even though the model extension extends from the base class and behaves the same for the most part, you should always use the base class in your code, as otherwise observers aren't working properly.
