![SeAT](https://i.imgur.com/aPPOxSK.png)

# Webserver

The SeAT web interface requires a web server to serve the HTML goodies it has. We highly encourage you to use [nginx](/installation/webserver_extra/nginx/) or [traefik](/installation/webserver_extra/traefik/) and these we will covered in the next few pages. You don't have to use it, so if you prefer something else, feel free.

!!! warning "SeAT only installations"
    If you plan to run solely SeAT-Docker on your Server you can just use the built in nginx and alter your `.env` to serve Port 80 not Port 8080

If you have used the SeAT tool installation method then you already have a web server and these steps are not applicable to you.

## Guides

- [nginx](/installation/webserver_extra/nginx/)
- [apache](/installation/webserver_extra/apache/)
- [traefik](/installation/webserver_extra/traefik/)
