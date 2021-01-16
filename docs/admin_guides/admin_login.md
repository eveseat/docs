![SeAT](https://i.imgur.com/aPPOxSK.png)

# Admin Login

SeAT is heavily relaying on EVE Online Single Sign-On to authenticate user.
However, it's also shipped with a built-in administrator user.

You need an admin account in order to do certain tasks like configuring your instances, roles, squads, etc...

In order to authenticate with built-in admin user, use command disclosed bellow (choose your context).

=== "Docker"
    ```bash
    cd /opt/seat-docker
    docker-compose exec seat-web php artisan seat:admin:login
    ```

=== "Bare metal"
    ```bash
    sudo -H -u www-data bash -c 'php /var/www/seat/artisan seat:admin:login'
    ```

You'll get a link after the command has finished running, which looks similar to the one bellow:

```txt
SeAT Admin Login URL Generator
User 'admin' does not exist. It will be created.
Checking if 'admin' is a super user
Adding 'admin' to the Superuser role
Generating authentication token

Your authentication URL is valid for 60 seconds.
http://localhost/auth/login/admin/9G3sb8hjMvrbIJrIf10KKtIj1c8e9mL5
```

Copy it and paste it inside your browser, and you will be authenticated as the built-in admin account.

!!! hint

    You can define a standard user account as an administrator from the user card.
    To do so, go into **Settings > Users**, search the user which need to be upgraded and clic on the edit button.
    On the displaying card, check **Administrator** and confirm change using edit button.

!!! warning

    If you have not configured the `APP_URL` setting in the `.env` file, then the admin url will be generated for `localhost`.
    This is most likely incorrect and you can simply replace `localhost` with your server IP address or domain name.
