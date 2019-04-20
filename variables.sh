#!/usr/bin/env bash

versions=( 7.1 7.2 7.3 )
variants=( cli fpm zts )
name="iksaku/laravel-docker"

IFS=$'\n'
latestVersion="$(echo "${versions[*]}" | sort -nr | head -n1)"
majorVersion="${latestVersion%%.*}"