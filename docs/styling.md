![SeAT](https://i.imgur.com/aPPOxSK.png)

# Styling

By default, SeAT uses [Bootstrap 4](https://getbootstrap.com/docs/4.6/) and the [Admin LTE](https://adminlte.io/) template.

You may want to customise SeAT design to match either your corporation or alliance colours.

To do so, you can use two available css hooks :

* `custom-layout-mini.css` used by the sign-in page
* `custom-layout.css` used by all the entire application, globally

# Bare Metal Installs

Both files must be located into your `public` directory.

!!! example
    Using the default base directory, you'll get the following path :
    - `/var/www/seat/public/custom-layout-mini.css`
    - `/var/www/seat/public/custom-layout.css`

These files are loaded automatically if they are detected - you have nothing else to do to enable them.

# Docker Installs

An example of adding these to your Web UI container is provided below:

!!! note

    Do note the version in `docker-compose.yml` and reflect this in your override file otherwise version mismatches will occur.

* Creating `custom` directory in `/opt/seat-docker/` and add files to new directory
* Creating `docker-compose.override.yml` in `/opt/seat-docker/` directory
* Adding following code to `docker-compose.override.yml` Note: Uncomment the needed file(s) by removing the `#`

=== "SeAT 4"

    ```YAML linenums="1"
    version: "3.2"
    
    services:
    
      seat-web:
        volumes:
    #      - /opt/seat-docker/custom/custom-layout-mini.css:/var/www/seat/public/custom-layout-mini.css
    #      - /opt/seat-docker/custom/custom-layout.css:/var/www/seat/public/custom-layout.css
    ```

    Once you have placed the files you will need to run `docker-compose up -d` for it to take effect.

=== "SeAT 5 (using Traefik)"

    ```YAML linenums="1"
    version: "3.2"
    
    services:
    
      front:
        volumes:
    #      - /opt/seat-docker/custom/custom-layout-mini.css:/var/www/seat/public/custom-layout-mini.css
    #      - /opt/seat-docker/custom/custom-layout.css:/var/www/seat/public/custom-layout.css
    ```

    Once you have placed the files you will need to run `docker-compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.traefik.yml up -d` for it to take effect.

=== "SeAT 5 (using proxy)"

    ```YAML linenums="1"
    version: "3.2"
    
    services:
    
      front:
        volumes:
    #      - /opt/seat-docker/custom/custom-layout-mini.css:/var/www/seat/public/custom-layout-mini.css
    #      - /opt/seat-docker/custom/custom-layout.css:/var/www/seat/public/custom-layout.css
    ```

    Once you have placed the files you will need to run `docker-compose -f docker-compose.yml -f docker-compose.mariadb.yml -f docker-compose.proxy.yml up -d` for it to take effect.

An example of a customized login page using `custom-layout-mini.css` would be:

!!! note

    Valid `corporations` or `alliances` ids in the URL can be used for `login.logo::before` section.

```CSS linenums="1"
/**
 * SeAT login page layout
 */
@media all {
    html, body {
        height: auto;
    }

    .login-page, .register.body {
        color: rgb(255,255,255);
        background-image: url(https://web.ccpgamescdn.com/aws/eveonline/sso/background.jpg);
        background-position: center center;
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed;
    }

    .login-box, .register-box {
        width: 360px;
        margin: 0;
        position: absolute;
        top: 50%;
        left: 50%;
        background: rgba(48,48,48,.8);
        transform: translate(-50%, -50%);
        border: 5px solid #ecf0f1;
        border-radius: 40px;
        box-shadow: 0 1px 1px rgba(0,0,0,0.05);
    }

    .login-logo, .register-logo {
        font-size: 35px;
        text-align: center;
        margin-bottom: 25px;
        font-weight: 300;
        content: url(https://images.evetech.net/corporations/98482334/logo?size=128);
        margin-top: 50px;
    }

    .login-logo::before, .register-logo::before {
        display: block;
        width: 128px;
        height:128px;
        margin: 0 auto;
        border-radius: 50%;
        margin-bottom: 50px;
    }

    .login-box-body, .register-box-body {
        background: transparent;
        padding: 20px;
        border-top: 0;
        color: inherit;
    }
}
```

The above code will create the login page below:

![Customized Login Page](img/customized-signin-page.png)
