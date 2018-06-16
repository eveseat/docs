![SeAT](https://i.imgur.com/aPPOxSK.png)

# Development Tips

This page contains general tips and tricks that may be useful during package development.

## Best practices

No doubt, there are no limits to what code you can write, how you structure it and how you name things. However, the last thing you want is to have conflicts with the SeAT core, or someone elses package! The following list contains some tips to help you avoid those conflicts and to help people better discover your packages:

- Prefix your github repository name with `seat` eg: `seat-teamspeak`.
- Tag your github repository with `seat`.
- Use a unique package namespace such as `Author\Seat\Package\` eg: `Warlof\Seat\Teamspeak\`.
- Prefix your database table names with something unique to your package. eg `warlof_teamspeak_users`.
- Do not modify core tables. This will break future updates for users of your package.
- Prefix your settings with both an author and package eg: `warlof.teamspeak.address`.
- Prefix redis records with both author and package eg: `warlof.teamspeak.channels`.
- In your `composer.json` file, set the `type` to `seat-plugin`.

## Model Observers

Depending on what your package does, it may be interesting for you to know when data is created / deleted. Given that SeAT makes use of Laravel, you have the ability to subscribe to events that occur on any model within SeAT.

For example, should a `User` model get deleted, the `deleted` event will get fired. Writing an observer class and subscribing to it with `\Seat\Web\Models\User::observer(\My\Namespace\UserObserver::class)` will allow you to define a `deleted()` method inside of your observer class and perform extra logic with the `User` that got deleted.

Examples of where this may be interesting could be if you need to have cleanup code for tables that your package includes.

For more information, checkout the Laravel documentation on [Eloquent Observers](https://laravel.com/docs/5.5/eloquent#observers).
