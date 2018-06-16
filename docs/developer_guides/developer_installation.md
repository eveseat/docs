![SeAT](https://i.imgur.com/aPPOxSK.png)

# Developer Installation

Getting a development environment for SeAT 3 up and running is now even easier than before using either Docker or Vagrant if you use Windows with VM and Virtualbox.

## Docker

Simply download the latest files from [github](https://github.com/eveseat/scripts.git), run `bash prepare-source.sh` and finally `docker-compose up -d`. If you already have a repository where the SeAT sources live, update the `.env` file and specify the **full path** to your SeAT codebase.

### Docker Installation

1. `git clone https://github.com/eveseat/scripts.git /var/seat`
2. `cd /var/seat/docker-compose-dev`
3. `bash prepare-source.sh` (Or, if you have an existing repository update the `.env` file)
4. `docker-compose --project-name seat-dev up -d`

In order to login using SSO you must create an Application on the [CCP Developers Portal](https://developers.eveonline.com/). Select all esi-scopes and save the `EVE_CLIENT_ID` and `EVE_CLIENT_SECRET` in `.env`.

### Docker Usage

Once the containers have finished building, you can now access your development environment via port 8080: `http://localhost:8080`.

### Docker Tips

1. If you need access the console of any container, access it via `docker exec seat-app sh` where `seat-app` is the name of the target container.
2. You can execute `artisan` commands from outside of docker with `docker exec seat-app php artisan <command>`

## Vagrant

Vagrant will create a virtual machine with Ubuntu 16.04 LTS, install `docker` and `docker-compose` to the virtual machine and then pretty much does the same as the docker section of this page.

### Prerequisites

- [Download and install Vagrant.](https://www.vagrantup.com/) [More info about Vagrant here.](https://www.vagrantup.com/docs/)
- Virtualbox ^5.2.X [Download here](https://www.virtualbox.org/wiki/Downloads)
 `vagrant plugin install vagrant-docker-compose` (installs automatically)

### Vagrant Installation

- Download eveseat/scripts `git clone https://github.com/eveseat/scripts.git`
- `cd scripts/vagrant`
- `vagrant up`. This will take some time since it's deploying a whole dev environment with docker-compose.
- `vagrant ssh` to open an SSH connection to the machine. Working directory is: `/vagrant/vm-files/docker-compose-dev/` to execute all docker-commands.

### Vagrant Usage

Connect to your SeAT instance by browsing to `http://192.168.33.100:8080`.
(You can change the set ip in the vagrant file.)

By default, you will receive a synced folder inside your vagrant-folder called `vm-files`.
You are able to route your IDE to this folder and work from there.

### Vagrant Tips

- Using `vagrant up` vagrant will run `docker-compose up -d`

### Troubleshooting

- If the installation fails, execute `vagrant destroy` to rollback to a clean state then try again with `vagrant up`.
- If you alter the `.env` of your `docker-compose.yml` do run `vagrant provision`, else it won't take effect.
