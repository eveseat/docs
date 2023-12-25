![SeAT](https://i.imgur.com/aPPOxSK.png)

# Developers Guides - Notifications Implementation

!!! warning "Seat 5"
    This guide is already updated for seat 5. Older versions of this guide can be found on [github](https://github.com/eveseat/docs/tree/8a33fdb141cb8d5f0733f0a936a06fdffd3781c4).

## Introduction

SeAT is shipped with a built-in notification system which is able to send message across the world to almost any platform.

It is supporting e-mail, Slack and Discord out of the box.

However, thanks to Laravel, if you need to support another platform - you simply need to implement the related driver. See official [Laravel Notification Channels](https://laravel-notification-channels.com) website to get more about this. 

Additionally, there is a system to mention certain users when a notification gets sent. Since we don't assume that many people need to implement this for a new platform, there is no written documentation. This is a good starting point to read the code: [Config/notifications.mentions.php](https://github.com/eveseat/notifications/blob/master/src/Config/notifications.mentions.php)

## Configuration

All notifications must be declared inside `notifications.alerts.php`. You will want to create a file named like this in the `Config` directory of your plugin and then use `mergeConfigFrom` in your service provider to merge the seat core and plugin notification configuration.
Every entry must follow this pattern:

```php linenums="1"
'created_user' => [
    'label' => 'notifications::alerts.created_user',
    'handlers' => [
        'mail' => \Seat\Notifications\Notifications\Seat\Mail\CreatedUser::class,
        'slack' => \Seat\Notifications\Notifications\Seat\Slack\CreatedUser::class,
    ],
]
```

- the entry key `created_user` must be unique overall system and will identify the very specific notification declaration. It will reference the notification definition composed of `label` and `handlers` keys.
- the `label` will reference a translation token - this is the value which will appear on user interface into notification settings
- the `handlers` key is containers a list of available formatters. There is a formatter per available platform - or so called - channel.
- the optional `visible` key hides the notification from the list of available notifications, but you can still use the seat notification infrastructure normally. Realistically, you don't need this for anything.

You can also look at the seat core [notifications.alerts.php](https://github.com/eveseat/notifications/blob/master/src/Config/notifications.alerts.php) file as an example.

## Formatters

Formatters are class which will define how message targeting a specific channel must be structured.
In upper example, we have two formatters:

- [\Seat\Notifications\Notifications\Seat\Mail\CreatedUser](https://github.com/eveseat/notifications/blob/master/src/Notifications/Seat/Mail/CreatedUser.php) which is handling mail channel format
- [\Seat\Notifications\Notifications\Seat\Slack\CreatedUser](https://github.com/eveseat/notifications/blob/master/src/Notifications/Seat/Slack/CreatedUser.php) which is handling Slack channel format

Formatter must extend a different abstract class depending on what kind of platform it supports:

- Discord: `Seat\Notifications\Notifications\AbstractDiscordNotification`
- Slack: `Seat\Notifications\Notifications\AbstractSlackDiscordNotification`
- Mail: `Seat\Notifications\Notifications\AbstractMailNotification`

Every formatter is composed of the following method:

- `populateMessage(Message $message, mixed $notifiable)` which will generate the structure message for the target platform. The type of `Message` differs slightly according to which platform you're on, e.g. on discord it is a `Seat\Notifications\Services\Discord\Messages\DiscordMessage`, on slack it is a `Illuminate\Notifications\Messages\SlackMessage`.


## Observers

In SeAT, notifications are event based and sent by jobs queued in `notifications` queue. This prevents to lock system while sending the information.

To send your notification, you will listen for system events (ie: a character notification created in the database) in order to dispatch the selected notification.

### Characters

All characters related notifications are handled by [\Seat\Notifications\Observers\CharacterNotificationObserver](https://github.com/eveseat/notifications/blob/master/src/Observers/CharacterNotificationObserver.php)

It is waiting for an Eve Online notification targeting a character to be registered and dispatch the related message to the requested platform - if asked for.

SeAT is shipped with numerous notifications - but due to the number of existing ones and the fact that there are regularly news notifications created by CCP attached to added features, it might append that a notification isn't handled.

You can track such cases using `debug` log level which will generate a log entry looking like this:

> Unsupported notification type.\
>   **type:** TheNotificationTypeAsPerESIDefinition (see: https://esi.evetech.net/ui/#/Character/get_characters_character_id_notifications)\
>   **sender_type:** character\
>   **notification:** the YAML structure of the notification

You'll find all standard notifications handler related to character into the following namespace: [\Seat\Notifications\Notifications\Characters](https://github.com/eveseat/notifications/tree/master/src/Notifications/Characters)

### Corporations

Most of the corporations related notifications are handled by [\Seat\Notifications\Observers\CharacterNotificationObserver](https://github.com/eveseat/notifications/blob/master/src/Observers/CharacterNotificationObserver.php)

It is waiting for an Eve Online notification targeting a corporation to be registered and dispatch the related message to the requested platform - if asked for.

SeAT is shipped with numerous notifications - but due to the number of existing ones and the fact that there are regularly news notifications created by CCP attached to added features, it might append that a notification isn't handled.

You can track such cases using `debug` log level which will generated a log entry looking like this :

> Unsupported notification type.\
>   **type:** TheNotificationTypeAsPerESIDefinition (see: https://esi.evetech.net/ui/#/Character/get_characters_character_id_notifications)\
>   **sender_type:** corporation\
>   **notification:** the YAML structure of the notification

Alternatively, notifications related to corporation member state are handled by [\Seat\Notifications\Observers\CorporationMemberTrackingObserver](https://github.com/eveseat/notifications/blob/master/src/Observers/CorporationMemberTrackingObserver.php)

You'll find all standard notifications handler related to corporation into the following namespace: [\Seat\Notifications\Notifications\Corporations](https://github.com/eveseat/notifications/tree/master/src/Notifications/Corporations)

### Killmails

All killmails related notifications are handled by [\Seat\Notifications\Observers\KillmailNotificationObserver](https://github.com/eveseat/notifications/blob/master/src/Observers/KillmailNotificationObserver.php)

It is waiting for a killmail being registered and dispatch the related message to the requested platform - if asked for.

### Squads

All squads related notifications are handled by [\Seat\Notifications\Observers\SquadApplicationObserver](https://github.com/eveseat/notifications/blob/master/src/Observers/SquadApplicationObserver.php) and [\Seat\Notifications\Observers\SquadMemberObserver](https://github.com/eveseat/notifications/blob/master/src/Observers/SquadMemberObserver.php)

It is waiting for squads members and applications to be registered and dispatch the related message to the requested platform - if asked for.

You'll find all standard notifications handler related to Squads into the following namespace: [\Seat\Notifications\Notifications\Seat](https://github.com/eveseat/notifications/tree/master/src/Notifications/Seat)

### Users

All users related notifications are handled by [\Seat\Notifications\Observers\UserObserver](https://github.com/eveseat/notifications/blob/master/src/Observers/UserObserver.php)

It is waiting for a user to be registered and dispatch the related message to the requested platform - if asked for.

You'll find all standard notifications handler related to character into the following namespace: [\Seat\Notifications\Notifications\Seat](https://github.com/eveseat/notifications/tree/master/src/Notifications/Seat)

## Porting Plugins from Seat 4 to 5
All notifications continue to work without any changes, even though there have been major refactors. However, to profit of the new mentions system behind discord pings, you need to change a few things to update to the new notification structure:

- Start extending from the platform specific classes instead of `Seat\Notifications\Notifications\AbstractNotification`. 
  - Discord: extend `Seat\Notifications\Notifications\AbstractDiscordNotification`
  - Slack: extend `Seat\Notifications\Notifications\AbstractSlackDiscordNotification`
  - Mail: extend `Seat\Notifications\Notifications\AbstractMailNotification`
- Remove the via method. It moved to the abstract notification class.
- Refactor your public `toX()` method to a protected `populateMessage(Messagetype $message, $notifiable)`. Instead of creating a new message, use the parameter `$message`. The type `Message` must be adjusted depending on your platform:
  - discord: `Seat\Notifications\Services\Discord\Messages\DiscordMessage`
  - slack: `Illuminate\Notifications\Messages\SlackMessage`
  - mail: `Illuminate\Notifications\Messages\MailMessage`
- Consider using the `Seat\Notifications\Traits\NotificationDispatchTool` trait to dispatch notification. It helps to deduplicate the most common logic.

The old plugin structure will stop working in seat 6.
