![SeAT](http://i.imgur.com/aPPOxSK.png)

Getting a development installation up and running is now even easier than before. 
SeAT 3.0 will be profit from the extensive functionality of `docker-compose`.
Simply download the latest dev-docker files, run `bash prepare-source.sh` and finally `docker-compose up -d`.


## installation

1. ` git clone https://github.com/eveseat/scripts.git /var/seat`
2. `cd /var/seat/docker-compose-dev`
3. `bash prepare-source.sh`
4. `docker-compose up -d`

In order to have a running test-enviroment you must create an Application on 
[CCP-Developers](https://developers.eveonline.com/). Select all esi-scopes and save `EVE_CLIENT_ID` and
`EVE_CLIENT_SECRET` in `.env`.

## usage

you can now access your Dev-Enviroment via port 8080: `http://localhost:8080`.

## helpful stuff

1. If you need access to console (f.e. to run `php artisan`) you can access it via `docker exec -it eveseat-app sh`