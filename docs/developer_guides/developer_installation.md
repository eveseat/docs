![SeAT](https://i.imgur.com/aPPOxSK.png)

# Developer Installation

Getting a development environment for SeAT 3 up and running is now even easier than before using Docker.

## Docker

Simply download the latest files from [github](https://github.com/eveseat/scripts.git), run `bash prepare-source.sh` and finally `docker-compose up -d`. If you already have a repository where the SeAT sources live, update the `.env` file and specify the **full path** to your SeAT codebase.

### Docker Installation

1. `git clone https://github.com/eveseat/scripts.git /var/seat`
2. `cd /var/seat/docker-compose-dev`
3. `bash prepare-source.sh` (Or, if you have an existing repository update the `.env` file)
4. `docker-compose --project-name seat-dev up -d --build`

In order to login using SSO you must create an Application on the [CCP Developers Portal](https://developers.eveonline.com/). Select all esi-scopes and save the `EVE_CLIENT_ID` and `EVE_CLIENT_SECRET` in `.env`.

### Docker Usage

Once the containers have finished building, you can now access your development environment via port 8080: `http://localhost:8080`.

### Docker Tips

1. If you need access the console of any container, access it via `docker exec seat-app sh` where `seat-app` is the name of the target container.
2. You can execute `artisan` commands from outside of docker with `docker exec seat-app php artisan <command>`
