![SeAT](https://i.imgur.com/aPPOxSK.png)

# Env Reference

In both the case of a Docker installation as well as a host based installation (manual or via SeAT tool), SeAT has some configuration values that can be set via an `.env` file. Depending on your installation type, this file will be in either `/opt/seat-docker/.env` or in `/var/www/seat/.env`

## Configuration Value Reference

| Parameter Name | Default value | Description |
|-------------------|--------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| APP_URL | http://seat.local | This is the public address where SeAT instance is reachable. That should match with the `EVE_CALLBACK_URL` without `/auth/eve/callback` suffix |
| DB_HOST | 127.0.0.1 | This is the IP or domain from your SQL Server. |
| DB_PORT | 3306 | This is the port used by your SQL Server to receive query. |
| DB_DATABASE | seat | This is the name for your SeAT database. |
| DB_USERNAME | seat | This is the user which is granted to the SeAT database from SeAT server. |
| DB_PASSWORD | secret | This is the user password |
| MAIL_DRIVER | smtp | This is the driver used to send mail. It will be covered in a dedicated article. |
| MAIL_HOST | smtp.mailtrap.io | This is driver mail hostname. It will be covered in a dedicated article. |
| MAIL_PORT | 2525 | This is the driver mail port. It will be covered in a dedicated article. |
| MAIL_USERNAME | null | This is the driver mail username. It will be covered in a dedicated article. |
| MAIL_PASSWORD | null | This is the driver mail password. It will be covered in a dedicated article. |
| MAIL_ENCRYPTION | null | This is the driver mail encryption. It will be covered in a dedicated article. |
| MAIL_FROM_ADDRESS | noreply@localhost.local | This is the mail address which the user will chown when he will receive mail from SeAT. |
| MAIL_FROM_NAME | SeAT Administrator | This is the name which the user will chown when he will receive mail from SeAT. |
| EVE_CLIENT_ID | null | This is the EVE Application Client ID you'll get when you created an application over https://developers.eveonline.com |
| EVE_CLIENT_SECRET | null | This is the EVE Application Client Secret you'll get when you created an application over https://developers.eveonline.com |
| EVE_CALLBACK_URL | https://seat.local/auth/eve/callback | This is the EVE Application Callback URL you filled when you created an application over https://developers.eveonline.com. You should have only to fix `seat.local` |
| QUEUE_BALANCING_MODE | false | Determine the workers balancing mode used by the Jobs Manager. Value can be `false`, `auto` or `simple`. See [official Laravel documentation](https://laravel.com/docs/5.8/horizon#balance-options) for more details |
| QUEUE_WORKERS | 4 | Determine the amount of worker which have to be spawn to process jobs over all queues. In `auto` and `simple` balancing, this value cannot be lower than `4` as it's correspond to the available queues. |
