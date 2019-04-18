#!/usr/bin/env bash

set -Eeuo pipefail
set -x

source variables.sh

for version in "${versions[@]}"; do
    for variant in "${variants[@]}"; do
        tag="$version-$variant"
        echo "Generating $name:$tag docker image..."
        docker build \
            -t "$name:$tag" \
            -t "$name:$tag-alpine" \
            "${tag//-/\/}"
        
        if [[ "$version" == "$latestVersion" ]]; then
            docker tag "$name:$tag" "$name:$variant"

            if [[ "$variant" == "cli" ]]; then
                docker tag "$name:$tag" "latest"
                docker tag "$name:$tag" "$name:$majorVersion"
            fi
        fi
    done
done