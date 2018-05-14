![SeAT](https://i.imgur.com/aPPOxSK.png)

# Webserver

The SeAT web interface requires a web server to serve the HTML goodies it has. We highly encourage you to use [nginx](/guides/installation/basic_installation/nginx) or [traefik](/guides/installation/basic_installation/traefik) and these we will covered in the next few pages. You don't have to use it, so if you prefer something else, feel free.

!!! warning "SeAT only installations"
    If you plan to run solely SeAT-Docker on your Server you can just use the built in nginx and alter your `.env` to serve Port 80 not Port 8080

If you have used the SeAT tool installation method then you already have a web server and these steps are not applicable to you.

## Guides

- [traefik](/guides/installation/basic_installation/traefik)
- [nginx](/guides/installation/basic_installation/nginx)
- [apache](/guides/installation/basic_installation/apache)
