![SeAT](http://i.imgur.com/aPPOxSK.png)

**Package**: eveseat/notifications  
**Config**: [here](https://github.com/eveseat/notifications/tree/master/src/Config)

### File: `notifications.config.php`

```php

return [

];
```

#### Options 

### File: `notifications.notifiers.php`

```php

return [
    Seat\Notifications\Notifiers\EmailNotifier::class
];
```

#### Options 
This configuration file simply returns an array of notifier classes.
