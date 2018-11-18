![SeAT](https://i.imgur.com/aPPOxSK.png)

# Basic SeAT Installation

This guide provides information about the automated options available to install SeAT. Generally, these are the best ways to getting started with SeAT. There are two options for you to choose from, which include a Docker setup or a host-based setup.

If you would prefer less automation, or you  already have existing services on your server which may interfere with SeAT, check out some of the [advanced installation](/installation/manual/getting_started/) guides.

## Installation

!!! note

    Make sure you review the [hardware](/installation/requirements/#hardware-requirements) requirements before installing anything intended for production use!

### Docker Installation

Using docker, all of SeAT's dependencies is neatly abstracted away from your hosts operating system and does not conflict with any pre-existing software you might have on your server. With a little bit of extra work, Docker installations are also possible on Windows. 

If you have either `docker` or `docker-compose` already installed on your server, make sure you have the latest versions as detailed on the [requirements](/installation/requirements/) page. If you do not have them installed yet, the following script will install them if needed and then download the SeAT `docker-compose.yml` and `.env` files to `/opt/seat-docker` on your server:

```bash
bash <(curl -fsSL https://git.io/seat-docker)
```

Once downloaded, `docker-compose up -d` is run from that folder to start the SeAT stack. To see this script in action on a fresh Digital Ocean VPS, check out the following asciinema: 
<script src="https://asciinema.org/a/c0EM0kQnj86JkNX40TBdhA4Ua.js" id="asciicast-c0EM0kQnj86JkNX40TBdhA4Ua" async></script>

Once the docker installation is complete, you should have SeAT available on the server, listening on port 8080. For more detailed docker related information as well as next steps to configure a web server, please refer to the [Manual Installation: Docker](/installation/docker_installation/) section.

!!! hint

    Please have a look at [Docker Admin Page](/admin_guides/docker_admin/) for commands for Docker.

---

### SeAT Tool

An automated installation option for Debian, Ubuntu and CentOS is available. To get started with this method, a helper script should be downloaded and run.

```bash
bash <(curl -fsSL https://git.io/seat-installer)
```

!!! warning
    
    This installer assumes that <i>nothing else</i> is configured on the host operating system. If you have an existing database server or web server on the host this script is run on there is a high chance it will fail!
    
This will ask you to choose your operating system in order to prepare the <code>seat</code> tool for use.

Example usage:
```bash
$ bash <(curl -fsSL https://git.io/seat-installer)
    * SeAT Installer Operating System Selection
    1) CentOS 6    3) Ubuntu 16x  5) Debian 8x   7) Quit
    2) CentOS 7    4) Ubuntu 18x  6) Debian 9x
    * Please select the target operating system:
```

Once the preparations are done, the installer will prompt you to run `seat install:production`.


!!! success "Installation complete"

    You now have SeAT installed.
    
---

## Next steps

1. [Configure ESI](/configuration/esi_configuration/) for SSO and API pulls
2. Create a SeAT account with a character of yours
3. Log off or use new browser
4. Create admin link: `php artisan seat:admin:login`
5. assign `Superuser` to your character/user you created in step 2
6. Log off with admin (You won't be needing to login again with this account in the future, unless in an emergency)

!!! hint
    to execute any command with docker prepend the command with the following: `docker-compose exec seat-app`. F.e. `docker-compose exec seat-app php artisan seat:admin:login`
