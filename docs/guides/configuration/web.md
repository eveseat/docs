![SeAT](http://i.imgur.com/aPPOxSK.png)

**Package**: eveseat/web  
**Config**: [here](https://github.com/eveseat/web/tree/master/src/Config)

### File: `web.config.php`

```php

return [
    'max_access_mask'          => 1073741823,
    'queue_status_update_time' => 10 * 1000,
];
```

#### Options 
* *max_access_mask*  
The current maximum possible access_mask

* *queue_status_update_time*  
Amount of seconds (calculated as _seconds x 1000_) to wait before requesting a queue status update.
