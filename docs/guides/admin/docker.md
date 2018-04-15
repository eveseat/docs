![SeAT](https://i.imgur.com/aPPOxSK.png)

# Administrate your SeAT Docker

You ocasionally want to interact with your SeAT instance running in a docker. Be it because you would like to add
SSL certifications to your NGIX. Change the Port of SeAT or simply generate an admin-login

## Admin Login

Initially when you create your SeAT instance you have no superuser for SeAT, you can create an administrative user
with this command `docker-compose exec -it seat-app php artisan seat:admin:login`. The link you will receive allows you
to login as admin and is valid for 60 minutes.

## Take Change Of `.env`

Sometimes you wish to change your `.env` f.e. when you change the port of which SeAT is being served or you wish to save
ESI Secrets (see [Configure Eve Online ESI Scopes](/guides/installation/basic_installation/esi)). To do so, do the 
following:

1. Save your changes
2. `docker-compose up -d`

This will restart your containers

## Backup SeAT Database

It is very advisable to regularly backup your SeAT Database. To do so you run: 

```bash
docker-compose exec mariadb sh -c 'exec mysqldump "$MYSQL_DATABASE" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD"' > seat.db
```

## Update SeAT

To update your SeAT instance you need to run the following commands:

!!! info "Better safe then sorry"
    it is advisable to do a backup before every update/upgrade.

1. `docker-compose build`
2. `docker-compose up -d`