![SeAT](https://i.imgur.com/aPPOxSK.png)

# Developer Installation

Getting a development environment for SeAT 3 up and running is now even easier than before using Docker.

## Docker

Simply download the latest files from [github](https://github.com/eveseat/scripts.git), run `bash prepare-source.sh` and finally `docker-compose up -d`. If you already have a repository where the SeAT sources live, update the `.env` file and specify the **full path** to your SeAT codebase.

### Setup

1. `git clone https://github.com/eveseat/scripts.git /var/seat`
2. `cd /var/seat/docker-compose-dev`
3. `bash prepare-source.sh` (Or, if you have an existing repository update the `.env` file)
4. `docker-compose --project-name seat-dev up -d --build`

In order to login using SSO you must create an Application on the [CCP Developers Portal](https://developers.eveonline.com/). Select all esi-scopes and save the `EVE_CLIENT_ID` and `EVE_CLIENT_SECRET` in `.env`.

!!! info

    You can follow the install of the seat-web container by issuing the `docker logs -f seat-app` command. When you see something like the below, seat should be ready to go.

    ```text
    seat-web_1     | [Sat Aug 15 17:46:13.327701 2020] [core:notice] [pid 32] AH00094: Command line: 'apache2 -D FOREGROUND'
    ```

## Webserver host

The webserver used is Traefik, which will serve the SeAT Web UI at <https://web.seat.local/>. Just browsing to localhost will not work as this relies on SNI (Server Name Indication). To reach the UI, add new hosts entries to your hosts file.

!!! info
    (`/etc/hosts` for 'nix systems or `c:\windows\system32\drivers\etc\hosts` for windows):

```text
127.0.0.1   web.seat.local
127.0.0.1   traefik.seat.local
```

Note that if you have the developer install on a machine other than your own local machine, replace the IP above with the IP address of the relevant machine.

## Configuring .env file with the app url and SSO settings

Use a text editor to edit `.env` in this directory and change your `WEB_DOMAIN=` to the domain seat will live on (for the dev env you can leave this as is). Enter your `EVE_CLIENT_ID` `EVE_CLIENT_SECRET` from the application you made. Save and close the file.

## Setup admin account

Login with your EVE account into the instance. Next, run `docker-compose exec seat-web php artisan seat:admin:login` and copy / paste the link provided into your browser. Finally, go to Settings -> Users -> Edit your user and tick the "Administrator" toggle.

### Docker Tips

1. If you need access the console of any container, access it via `docker exec seat-app sh` where `seat-app` is the name of the target container.
2. You can execute `artisan` commands from outside of docker with `docker exec seat-app php artisan <command>`
