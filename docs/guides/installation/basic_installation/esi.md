![SeAT](https://i.imgur.com/aPPOxSK.png)

# Configuring Eve Online ESI-Scopes

## Introduction
SeAT requires authenticating users using CCP's EVE SSO services and receive esi.scopes to retrieve the users data. 
Technical details behind the SSO implementation can be found 
[here](https://eveonline-third-party-documentation.readthedocs.io/en/latest/sso/index.html).

Authenticating users using SSO effectively means that users may authenticate to SeAT using only their existing EVE 
Online credentials. SeAT *does not* have access to the credentials itself as that is handled entirely by CCP. 
Only once authentication is successful from an EVE Online perspective, the user will be asked if he allows your SeAT
installation to receive the presented set of scopes. Once the user agrees to these scopes, the users browser is redirect
back to SeAT and he will be logged in.

![initial login screen](https://i.imgur.com/B6qhwO8.png)

## The config
A bit of setup work is needed in order to have your SeAT setup ready for SSO integration. The gist of it is:

- [Step I](#i-register-your-application): Register your application on the EVE Online Developers portal [here](https://developers.eveonline.com/applications).
- [Step II](#ii-set-config-parameters-in-env-file): Set your `EVE_CLIENT_ID`, `EVE_CLIENT_SECRET` and `EVE_CALLBACK_URL` in the `.env` configuration [file](https://github.com/eveseat/seat/blob/b067bd3e742a79c35b5fa44ff77380a9187a27cf/.env.example#L21-L23).

### I Register your application

Browse to [https://developers.eveonline.com/applications](https://developers.eveonline.com/applications) and create a new Application.

![new sso application](https://i.imgur.com/QcedExJ.png)

Give your application a **meaningful** *Name* and a *Description*.

![new sso application](https://i.imgur.com/zqhQ69H.png)

Next, set the connection type to *Authentication & API Access* (1), select all *ESI Scopes* (2) and specify the *Callback URL* (3)

To select *ESI Scopes* you can search for them in *Available Scopes* (2) and select the wished scope. The selected scope
then will moved to (3).

!!! note "Note on the Callback URL"

    This is the URL where the user should be redirected to, once authentication was successful.
    In the example, we can see it is `https://seat.local/auth/eve/callback`.
    You should replace the `seat.local` part with *your* domain!
    In other words, lets say you are hosting SeAT at `https://this.is.seat/`, then the Callback URL will be
    `https://this.is.seat/auth/eve/callback`. If you have SeAT in a sub folder on your web server,
    remember to prepend the folder name before `/auth/eve/callback`.

![new sso application](https://i.imgur.com/70vLD6V.png)

With the new application created, you will now have the `EVE_CLIENT_ID`, `EVE_CLIENT_SECRET` that you need to configure in SeAT itself. Take note of these values.

![new sso application](https://i.imgur.com/bjEip1X.png)

### II Set config parameters in `.env` file
We almost done. We just have to add the configuration parameters to our SeAT installs `.env` file.
Browse to your SeAT installation directory and edit the `.env` file (note this is a hidden file and wont show up when you just type `ls`).

Look for the following section of the file and populate the values with those you got when you created an application on the developers site:

```bash
EVE_CLIENT_ID=null
EVE_CLIENT_SECRET=null
EVE_CALLBACK_URL=http://seat.local/auth/eve/callback
```

!!! warning "For Docker installation"
     Rebuild your app after setting the ESI Details to `.env`.
     
     `docker-compose up --force-recreate -d`
