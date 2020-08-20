![SeAT](https://i.imgur.com/aPPOxSK.png)

# Email Setup - Using Mailgun

## Introduction

SeAT requires email to be setup to allow for things like notifications to be sent.
This guide will attempt to describe how to go about setting up your email using the [Mailgun] service.
Though Mailgun is a commercial service, you get to send 10k emails for free per month.
It also provides epic stats for you to track emails with etc.

## The config

As with anything Laravel, the config for mailgun will live in your installs `.env` file.
To use the Mailgun driver, first  set the `MAIL_DRIVER` option in your `.env` configuration file to `mailgun`.
Next, we will add two options to specify details about our mailgun account.

```php
// File: .env

MAILGUN_DOMAIN=whateveritis
MAILGUN_SECRET=anotherthing
```

To find out the values you need to populate, login to your mailgun account and browse to the [domains] section.
Pick the applicable domain name. The screen you will see should looks something similar to this:

![Mailgun Domain](https://i.imgur.com/11deaFQ.png)

The big title (`sandbox1XXXXXXX` in my case) is the domain name, and the field titled `API Key` is the `MAILGUN_SECRET`.

Done! To test, you can add some mail notification using the `Integrations` and `Notification groups`.

[Mailgun]: https://www.mailgun.com
[domains]: https://mailgun.com/app/domains
