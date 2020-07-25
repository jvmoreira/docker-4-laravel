## Docker for Laravel

Enjoy a complete Laravel development environment!\
Forget (boring) local dependencies.

### Setting up

1. Install [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/install/)
2. That's it =D You're ready to go!

### Running

1. From project's root, run `docker-compose up`
2. Access the Laravel App via `localhost:8000`
4. Access MySQL Database via `localhost:3306`
    - User: `root`
    - Password: `''`
5. The Laravel `app.local` container also forwards ports `3000` and `3001` in case you want to work with *frontend frameworks.*

#### Executing Commands

You can execute commands on the App's container with `docker exec`
```shell script
$ docker exec app.local php artisan inspire
    Simplicity is the ultimate sophistication. - Leonardo da Vinci
```

#### Composer & Node

The image contains both Composer and Node installed, so you can manage the packages the way you want.

I will try to keep the image up to date with the latest LTS versions, so remember to `docker pull` the newer ones ;)\
If you need a specific version just change the environment variables on `docker-compose.yml` to the ones you need:
``` yaml
environment:
  COMPOSER_VERSION: 1.10.9
  NODE_VERSION: 12.18.2
```

#### SSH Key

Optionally you can use your ssh key at the app's container by enabling the `secrets` key on `docker-compose.yml`
```yaml
secrets:
  sshkey:
    file: ~/.ssh/id_rsa
```
> Note: The key must not have a passphrase
