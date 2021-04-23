# DOCKER SYMFONY SKELETON
## How to rapidly start a Symfony project using Docker

The goal of this project is to offer a quick and easy setup for a symfony application developpement.
It provide basic tools and requirements to run a symfony application for developpement purposes.
##### Authors : GUICHARD Anthony & HAUSELMANN Charlie

## Features

- Dockerfile
- Docker-compose
- Symfony Skeleton

## Tech
### Dockerfile
Custom PHP image based on offical image [php:7.4-apache](https://github.com/docker-library/php/blob/1bc63c1ce4294a4ecb50c60dcf6a57d6749cba7d/7.4/buster/apache/Dockerfile)
Adding required librairies to run symfony project especially composer and setup workdir.

### Docker-compose
Docker-compose file in version 3 containing various containers:
- PHP (with previous Dockerfile)
- MYSQL ([mysql:5.7](https://github.com/docker-library/mysql/blob/b11f06b0d202e7b0f97b000e158fc4fc869d2194/5.7/Dockerfile.debian))
- PhpMyAdmin ([phpmyadmin:5.0.1](https://hub.docker.com/_/phpmyadmin))
- Mailhog ([mailhog](https://hub.docker.com/r/mailhog/mailhog))
- Traefik ([Traefik](https://hub.docker.com/_/traefik))
- Alpine

A php container set for running symfony and routed with traefik to allow https and setup the workir (Symfony project).
Mysql container to create the database for the symfony application using doctrine command line and exposed on port 3306.
Php my admin to ease database administration exposed on port 8081:80
Mailhog for disposing local smtp server to test email sending locally
Traefik to set https and defined custom domain name (https://app1.traefik.me)
Reverse-proxy-https-helper temporary container running on alpine to set up ssl certificate for traefik

All the containers are linking in a network called "dev"

### Resources
video link for setting up traefik with ssl: https://www.youtube.com/watch?v=nKkwRBkB93k
