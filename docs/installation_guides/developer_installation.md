![SeAT](http://i.imgur.com/aPPOxSK.png)

Getting a development installation up and running is now even easier than before. Simply download the `seat` tool (if you havent already), and run `seat install:development`!

## installation

1. `curl -fsSL https://git.io/vXb0u -o /usr/local/bin/seat`
2. `chmod +x /usr/local/bin/seat`
3. `seat install:development`

This command also accepts an optional path specification for the installation. For example:

```
$ seat install:development --destination ~/code/seat-dev
Using /usr/bin/git for git
Using /usr/bin/unzip for unzip
Using /usr/local/bin/composer for composer
Using /usr/local/bin/php for php
Cloning Main SeAT repository to ~/code/seat-dev...
```

## manual development setup
If you dont want to use the `seat` tool to configure a development project for you, then you can refer to the following page for more information on a reccomended development environment setup for SeAT: [General Development](development/general/).
