#!/usr/bin/env bash

set -Eeuo pipefail

source variables.sh

for version in ${versions[@]}; do
    for variant in ${variants[@]}; do
        tag="$version-$variant"
        tags=("$name:$tag-alpine")

        if [[ "$version" == "$latestVersion" ]]; then
            tags+=("$name:$majorVersion-$variant" "$name:$variant")

            if [[ "$variant" == "cli" ]]; then
                tags+=("$name:latest" "$name:$majorVersion")
            fi
        fi

        eval "docker build --squash -t $name:$tag$(printf " -t %s" "${tags[@]}") ${tag//-/\/}" > /dev/null &
    done
done

echo "Building images..."
wait
