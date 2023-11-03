![SeAT](https://i.imgur.com/aPPOxSK.png)

# Updating Plugins

This page aims to help with porting a SeAT plugin to a newer version of seat.

## From SeAT 4
SeAT 5 mainly upgrades the php and laravel version as well as all dependencies to their newest version. However, there are a few other breaking changes that can't be ignored.

- PHP 8.2: SeAT now runs on php 8.2, enabling new features like enums and better type hinting, but also breaking a few things.
- Route Prefixing: All routes from the seat core start with `seatcore::`. For example, `notifications.integrations.list` turns into `seatcore::notifications.integrations.list`. If your plugin uses routes pointing to the seat core, you will have to update them.
- Notifications: All notifications from SeAT 4 continue to work, but by updating them you can unlock more features like discord pings. See the [notifications guide](notifications_implementation.md) for more details.
- The `Seat\Eveapi\Jobs\Middleware\WithoutOverlapping` job middleware backport is now provided by laravel and got removed from the SeAT core. Use `Illuminate\Queue\Middleware\WithoutOverlapping` instead. Just swapping the import should be enough, as they are compatible.
- Some, but not all ways of exporting data from DataTables are broken. Just check whether they work and fix if required.
- There are a few minor breaking changes between Laravel 6 and 10:
  - `MyJob::dispatchNow()` got replaced with `MyJob::dispatchSync()`
  - For a full list, head over to the [laravel documentation](https://laravel.com/docs/10.x/upgrade).

## From SeAT 3

If you're upgrading a SeAT 3.x plugin, the cheat sheet bellow will probably helps you.

| SeAT 3.x                                      | SeAT 4.x                         | Purpose                                                                 |
|-----------------------------------------------|----------------------------------|-------------------------------------------------------------------------|
| `auth()->user()`                              | `auth()->user()`                 | Retrieve the currently authenticated user.                              |
| `auth()->user()->group->main_character`       | `auth()->user()->main_character` | Retrieve the main character from the currently authenticated user.      |
| `auth()->user()->group->main_character->name` | `auth()->user()->name`           | Retrieve the main character name from the currently authenticated user. |
| `auth()->user()->group->characters`           | `auth()->user()->characters`     | Retrieve all characters from the currently authenticated user.          |
| `auth()->user()->refresh_token`               | `CharacterInfo()->refresh_token` | Retrieve the refresh token attached to a character.                     |
| `auth()->user()->group->refresh_tokens`       | `auth()->user()->refresh_tokens` | Retrieve all refresh tokens attached to authenticated user.             |

Also, if you need it, a table called `mig_groups` is available in database containing a list of all converted group into standalone user.
This table will stay here until next SeAT major update.

| Field               | Purpose                                                                                  |
|---------------------|------------------------------------------------------------------------------------------|
| `group_id`          | The unique ID from SeAT 3 user group                                                     |
| `old_user_id`       | The unique ID from SeAT 3 user (match to Character ID)                                   |
| `new_user_id`       | The unique ID from SeAT 4 user                                                           |
| `main_character_id` | The SeAT 3 registered main character ID - or random from the User Group if none were set |
