![SeAT](https://i.imgur.com/aPPOxSK.png)

# Developers Guides - Notifications Implementation

## Introduction

SeAT is shipped with a built-in notification system which is able to send message across the world to almost any platform.

It is supporting e-mail, Slack and Discord (with slack format compatible endpoint) out of the box.

However, thanks to Laravel, if you need to support another platform - you simply need to implement the related driver. See official [Laravel Notification Channels](https://laravel-notification-channels.com) website to get more about this.

## Configuration

All notifications must be declared inside `notifications.alerts.php`. This file is available at root of your SeAT installation under `config` directory.
Every entry must follow this pattern :

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
- the `handlers` key is containers a list of available formatter. There is a formatter per available platform - or so called - channel.

## Formatters

Formatters are class which will define how message targeting a specific channel must be structured.
In upper example, we have two formatters :

- [\Seat\Notifications\Notifications\Seat\Mail\CreatedUser](https://github.com/eveseat/notifications/blob/master/src/Notifications/Seat/Mail/CreatedUser.php) which is handling mail channel format
- [\Seat\Notifications\Notifications\Seat\Slack\CreatedUser](https://github.com/eveseat/notifications/blob/master/src/Notifications/Seat/Slack/CreatedUser.php) which is handling Slack channel format

Every formatter is composed of the following methods :

- `via(): array` which will return a list of channel supported by the formatter. In the way standard notifications are designed, this method is always returning a single element.
- `toX(): mixed` which will generate the structure message for the target platform

Formatter must extend abstract class [\Seat\Notifications\Notifications\AbstractNotification](https://github.com/eveseat/notifications/blob/master/src/Notifications/AbstractNotification.php) which will handle the queue mechanics.

## Observers

In SeAT, notification are event based and sent by jobs queued in `notifications` queue. This prevents to lock a system while sending the information.

To send your notification, you will listen for system events (ie: a character notification created in the database) in order to dispatch the selected notification.

### Characters

All characters related notifications are handled by [\Seat\Notifications\Observers\CharacterNotificationObserver](https://github.com/eveseat/notifications/blob/master/src/Observers/CharacterNotificationObserver.php)

It is waiting for an Eve Online notification targeting a character to be registered and dispatch the related message to the requested platform - if asked for.

SeAT is shipped with numerous notifications - but due to the amount of existing ones and the fact that there are regularly news notifications created by CCP attached to added features, it might append that a notification isn't handled.

You can track such cases using `debug` log level which will generated a log entry looking like this :

> Unsupported notification type.\
>   **type:** TheNotificationTypeAsPerESIDefinition (see: https://esi.evetech.net/ui/#/Character/get_characters_character_id_notifications)\
>   **sender_type:** character\
>   **notification:** the YAML structure of the notification

You'll find all standard notifications handler related to character into the following namespace: [\Seat\Notifications\Notifications\Characters](https://github.com/eveseat/notifications/tree/master/src/Notifications/Characters)

### Corporations

Most of the corporations related notifications are handled by [\Seat\Notifications\Observers\CharacterNotificationObserver](https://github.com/eveseat/notifications/blob/master/src/Observers/CharacterNotificationObserver.php)

It is waiting for an Eve Online notification targeting a corporation to be registered and dispatch the related message to the requested platform - if asked for.

SeAT is shipped with numerous notifications - but due to the amount of existing ones and the fact that there are regularly news notifications created by CCP attached to added features, it might append that a notification isn't handled.

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
