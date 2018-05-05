![SeAT](http://i.imgur.com/aPPOxSK.png)

# Developer Installation

Getting a development environment for SeAT 3 up and running is now even easier than before using `docker-compose`. Simply download the latest files, run `bash prepare-source.sh` and finally `docker-compose up -d`.

## Installation

1. ` git clone https://github.com/eveseat/scripts.git /var/seat`
2. `cd /var/seat/docker-compose-dev`
3. `bash prepare-source.sh`
4. `docker-compose --project-name seat-dev up -d`

In order to login using SSO you must create an Application on the 
[CCP Developers Portal](https://developers.eveonline.com/). Select all esi-scopes and save the `EVE_CLIENT_ID` and `EVE_CLIENT_SECRET` in `.env`.

## Usage

Once the containers have finished building, you can now access your Dev-Enviroment via port 8080: `http://localhost:8080`.

## Helpful stuff

1. If you need access to the console you can access it via `docker exec -it seat-app sh`
2. You can execute `artisan` commands from outside of docker with `docker exec seat-app php artisan <command>`
