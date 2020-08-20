![SeAT](https://i.imgur.com/aPPOxSK.png)

# Styling

By default, SeAT uses [Bootstrap 3](https://getbootstrap.com/docs/3.4/) and the [Admin LTE](https://adminlte.io/) template.

You may want to customise SeAT design to match either your corporation or alliance colours.

To do so, you can use two available css hooks :

* `custom-layout-mini.css` used by the sign-in page
* `custom-layout.css` used bu all the entier application, globally

Both of them must be located into your `public` directory.

!!! example
    Using the default base directory, you'll get the following path :
    - `/var/www/seat/public/custom-layout-mini.css`
    - `/var/www/seat/public/custom-layout.css`

These files are loaded automatically if they are detected - you have nothing else to do to enable them.
