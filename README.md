# Personal Laravel Docker images
===

This repository is made of public php images that I have prepared to use with either Laravel or Lumen frameworks.

## How this works
In the `variables.sh` file, we can find some variables used in both `update.sh` and `build.sh` scripts.

The `update.sh` script generates a `Dockerfile` for each specified PHP version and variant, and also does update the `.travis.yml` file with the corresponding environments for generation.

The `build.sh` simply builds the previously generated `Dockerfiles` and tags them accordingly for later pushing.

## How to use this images
You can directly pull these images from [Docker Hub](https://hub.docker.com/r/iksaku/laravel-docker) and include them in your own `Dockerfile` or `docker-compose.yml`.

Currently, you must manually expose your ports, build along with another web service (apache/nignx) or link them with another container to make your app work. More on that could be found in the following links:
 - [PHP Official Docker Images Repo](https://hub.docker.com/_/php)
 - [Linking PHP7-FPM with Nginx](http://geekyplatypus.com/dockerise-your-php-application-with-nginx-and-php7-fpm/)
 - [Linking PHP7-FPM with Nginx on Windows 10](https://www.pascallandau.com/blog/php-php-fpm-and-nginx-on-docker-in-windows-10/)