![SeAT](http://i.imgur.com/aPPOxSK.png)

**Package**: eveseat/eveapi  
**Config**: [here](https://github.com/eveseat/eveapi/tree/master/src/Config)

### File: `eveapi.config.php`

```php

return [

    'enable_joblog' => true,

    'pheal'            => [
        'cache_path' => storage_path() . '/app/pheal/',
        'log_file'   => storage_path('logs/pheal.log')
    ],

    'cache_keys'       => [
        'down'                   => 'eve_api_down',
        'down_until'             => 'eve_api_down_until',
        'api_error_count'        => 'eve_api_error_count',
        'connection_error_count' => 'eve_api_conn_error_count'
    ],

    'limits'           => [
        'eveapi_errors'     => 150,
        'connection_errors' => 15
    ],

    'disabled_workers' => [
        'api'         => [],
        'character'   => [
            // Seat\Eveapi\Api\Character\AccountBalance::class,
        ],
        'corporation' => [],
        'eve'         => [],
        'map'         => [],
        'server'      => []
    ]
];
```

#### Options
* *enable_joblog*  
Specify wether job progress should be loggged to the joblog table.

* *pheal.cache_path*  
Specify the path to use for the Pheal XML cache. This cache is used to write the downloaded XML files for later retrieval if the cached_until timers have not yet expired.

* *pheal.log_file*  
Specify the log file to write Pheal access and error logs to.

* *cache_keys.down*  
The cache key to use when referring to the EVE API Down status

* *cache_keys.down_until*  
The cache key to use when updating the down until time for the EVE API.

* *cache_keys.api_error_count*  
The cache key to use when counting the number of eve api errors that have occurred.

* *cache_keys.connection_error_count*  
The cache key to use when counting the number of connection errors that have occurred.

* *limits.eveapi_errors*  
The maximum number of EVE API errors that may occur before the EVE API will be considered down for a while.

* *limits.connection_errors*  
The maximum number of connections errors that may occur to the EVE API before it will be considered down for a while.

For a reference of which workers are available for the next `disabled_workers` section, see the definition [here](https://github.com/eveseat/eveapi/blob/master/src/Config/eveapi.workers.php)

* *disabled_workers.api*  
An array of `Seat\Eveapi\Api\Api` worker classes that should not be run.

* *disabled_workers.character*  
An array of `Seat\Eveapi\Api\Character` worker classes that should not be run.

* *disabled_workers.corporation*  
An array of `Seat\Eveapi\Api\Corporation` worker classes that should not be run.

* *disabled_workers.eve*  
An array of `Seat\Eveapi\Api\Eve` worker classes that should not be run.

* *disabled_workers.map*  
An array of `Seat\Eveapi\Api\Map` worker classes that should not be run.

* *disabled_workers.server*  
An array of `Seat\Eveapi\Api\Server` worker classes that should not be run.
