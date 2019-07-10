![SeAT](https://i.imgur.com/aPPOxSK.png)

# Caddy

This is a general [Caddy](https://caddyserver.com/) configuration for SeAT, the path to SeAT's public directory and
the path to Caddy's log will depend on how you decided to install the two.

## Installation

Optionally this guide includes Cloudflare and will be pointed to the subdomain `seat.example.space`. 
Caddy will automatically pull LetsEncrypt certificates 
to enable [HTTPS](https://caddyserver.com/docs/automatic-https), 
hence the need for the email within the configuration's block.
Simply fill in and add the following to your [`Caddyfile`](https://caddyserver.com/tutorial/caddyfile):

```text
https://seat.example.space {
	root /your/path/to/seat/public
	# optional log path
	# log /your/path/to/caddy/logs/seat-access.log
	rewrite {
		to {path} {path}/ /index.php?{query}
	}
	fastcgi / 127.0.0.1:9000 php
	tls example_email@example.com
}
```

If you'd like to enable Cloudflare you'll need the 
[`tls.dns.cloudflare`](https://caddyserver.com/docs/tls.dns.cloudflare) plugin for Caddy.
```text
https://seat.example.space {
	root /your/path/to/seat/public
	# optional log path
	# log /your/path/to/caddy/logs/seat-access.log
	rewrite {
		to {path} {path}/ /index.php?{query}
	}
	fastcgi / 127.0.0.1:9000 php
	tls example_email@example.com
	tls {
		dns cloudflare
	}
}
```

`127.0.0.1:9000` points to php-fpm's address, so if you changed that, 
be sure those changes are reflected in your `Caddyfile`

