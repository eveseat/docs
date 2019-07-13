![SeAT](https://i.imgur.com/aPPOxSK.png)

# Styling

By default, SeAT is shipped using Bootstrap 3 and the template Admin LTE.

You may want to customise a bit your own SeAT design to either your corporation or alliance colors.

To doing so, you can use two available css hooks :
 - `custom-layout-mini.css` which is used by the sign-in page
 - `custom-layout.css` which is used for all the application

Both of them must be located into your `public` directory.

!!! exemple
    Using the default base directory, you'll get the following path :
    - `/var/www/seat/public/custom-layout-mini.css`
    - `/var/www/seat/public/custom-layout.css`

Those file are loaded automatically by the core if detected - you have nothing else to do to enable them.
