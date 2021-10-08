![SeAT](https://i.imgur.com/aPPOxSK.png)

# Styling

By default, SeAT uses [Bootstrap 3](https://getbootstrap.com/docs/3.4/) and the [Admin LTE](https://adminlte.io/) template.

You may want to customise SeAT design to match either your corporation or alliance colours.

To do so, you can use two available css hooks :

* `custom-layout-mini.css` used by the sign-in page
* `custom-layout.css` used bu all the entier application, globally

For bare metal installs, both of them must be located into your `public` directory.

!!! example
    Using the default base directory, you'll get the following path :
    - `/var/www/seat/public/custom-layout-mini.css`
    - `/var/www/seat/public/custom-layout.css`
    
These files are loaded automatically if they are detected - you have nothing else to do to enable them.
    

For Docker installs, you can create a new directory in `/opt/seat-docker/` called `custom` placing the above mentioned files into this directory.
However for SeAT to recognize these files you must enter a new volume path for seat-web in your `.env` file. An example of this would be:

`- /opt/seat-docker/custom/custom-layout-mini.css:/var/www/seat/public/custom-layout-mini.css`

Once you have placed the files you will need to run `docker-compose up -d` for it to take affect.

An example of a customized login page using `custom-layout-mini.css` would be: <br>
NOTE: Either `corporations` or `alliances` for ID's the can be used for login.logo section.

```CSS
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
        margin-top: 50px;
    }

    .login-logo::before, .register-logo::before {
        content: " ";
        display: block;
        width: 128px;
        height:128px;
        margin: 0 auto;
        background-image: url(https://images.evetech.net/corporations/98482334/logo?size=128);
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

The above code will create the login page below:<br>
<img src="https://i.imgur.com/ONUeYOi.png" width="600">
