![SeAT](http://i.imgur.com/aPPOxSK.png)

# Quick Install

## Introduction

The fastest way to get started with SeAT, is to start the installer with:

```bash
bash <(curl -fsSL https://git.io/seat-installer)
```

This will ask you to choose your operating system in order to prepare the seat tool for use.

Example usage:

```bash
$ apt-get update
$ bash <(curl -fsSL https://git.io/seat-installer)
 * SeAT Installer Operating System Selection
1) CentOS 6	 3) Ubuntu 14.04  5) Quit
2) CentOS 7	 4) Ubuntu 16.04
 * Please select the target operating system:

  ...

 $ php /var/www/seat/artisan seat:admin:reset
 $ php /var/www/seat/artisan seat:admin:email
```

A community provided installation video is available at the following
[link](https://screencast-o-matic.com/watch/cbjUQbIcl4), visually showing the installation process
