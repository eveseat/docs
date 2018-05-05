![SeAT](http://i.imgur.com/aPPOxSK.png)

# Reporting Bugs

So, the inevitable happened. Something broke! Its ok. The first thing to do is to relax, and prepare some info for a bug report.

### The more info, the better
In order to best understand the bug, we need as much info as possible about your environment. For that, you can run the following command (from your SeAT directory), and copy / paste the output as part of your bug report:

```bash
php artisan seat:admin:diagnose
```

### Log files
Log files are a fantastic resource. Check out the laravel log for any `Exception` type errors, and add them to your bug report. The log file is located (relative to where you installed SeAT) at:

```text
storage/logs/laravel.log
```

### Screenshots and debug mode
Screenshots may also help, so don't be shy to take some and attach them to your bug report! If you flip your installation into debug mode then it may be possible to capture the error that is occurring via a screenshot.

To flip to debug mode, open your applications `.env` file, and set `DEBUG=false` to `DEBUG=true`. See: [https://github.com/eveseat/seat/blob/master/.env.example#L2](https://github.com/eveseat/seat/blob/master/.env.example#L2)

### Report the bug
Finally, to report the bug, head over to [https://github.com/eveseat/seat/issues](https://github.com/eveseat/seat/issues) and click on **New Issue**.
