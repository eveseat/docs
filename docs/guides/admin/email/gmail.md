![SeAT](http://i.imgur.com/aPPOxSK.png)

# Email Setup - Using Gmail

## Introduction
SeAT requires email to be setup to allow for things like password reminders and notifications to be sent. This guide will attempt to describe how to go about setting up your email using [gmail](https://www.gmail.com/) as an SMTP.

## The config
As with anything Laravel, the config for your email setup will live in your installs `.env` file. To use gmail as an SMTP service, set the `MAIL_DRIVER` option in your `.env` configuration file to `smtp`. Next, specify the SMTP details:

```php
// File: .env

MAIL_DRIVER=smtp
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=username@gmail.com
MAIL_PASSWORD=gmailpassword
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=username@gmail.com
```

Done! To test, you can send yourself a password reset email.
