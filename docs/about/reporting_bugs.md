![SeAT](https://i.imgur.com/aPPOxSK.png)

# Reporting Bugs

So, you think its time to report an issue. Awesome! However, before you do this, *please* go through the [troubleshooting](/troubleshooting/) steps first to identify any common errors that you might be able to to fix yourself.

## The more info, the better

In order to best understand the bug, we need as much info as possible about your environment. For that, you can run the following command (from your SeAT directory), and copy / paste the output as part of your bug report:

```bash
php artisan seat:admin:diagnose
```

## Log files

Log files are a fantastic resource. Check out the Laravel log for any `Exception` type errors, and add them to your bug report. The log file is located (relative to where you installed SeAT) at:

```text
storage/logs/laravel-<todays-date>.log
```

## Screenshots and debug mode

Screenshots may also help, so don't be shy to take some and attach them to your bug report! If you flip your installation into debug mode then it may be possible to capture the error that is occurring via a screenshot.

## Report the bug

Finally, to report the bug, head over to [https://github.com/eveseat/seat/issues](https://github.com/eveseat/seat/issues) and click on **New Issue**.
