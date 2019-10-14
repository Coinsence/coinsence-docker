# coinsence-docker
A Coinsence docker implementation

## Files & folders:

- `.env.local`: this file contains variables that will be used in the `docker-compose.yml` file, please consider renaming it to `.env` and change all variables before running the compose file.
- `docker-coinsence-entrypoint.sh`: this is the entrypoint that will get executed once the project is built.
- `docker-compose.yml`: the main file that will be used to execute the docker project, contains the structure of the docker images used to run the project.
- `Dockerfile`: used mainly to build a custom php-apache image
- `humhub`: folder that will contain the humhub repo files
- `modules`: you can put humhub modules there, this folder will be mounted on `/var/www/modules` in the container image, please consider adding that to the config file ([link](http://docs.humhub.org/dev-environment.html#external-modules-directory))

## Perquisites:

- docker
- docker-compose

## How to run:

- Make sure that you are in the folder containing the `.yml`file.
- To start the project, just type:
`docker-compose up -d --build` to run in background or without `-d` flag to keep it on console.
- To stop/down the project:
`docker-compose down`, you can add the `-v` flag to remove all attached volumes (i.e. databases)

## Access:

- To access main website: http://coinsence.localhost
- To access phpMyAdmin interface: http://pma.coinsence.localhost

## TODOs:

- Setup crons
- ..
