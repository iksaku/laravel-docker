#!/usr/bin/env bash

set -Eeuo pipefail
set -x

source variables.sh

generated_warning() {
    cat <<-EOL
#
# NOTE: Automatically generated via "update.sh"
# DON'T EDIT MANUALLY
#

EOL
}

travisEnv=
for version in "${versions[@]}"; do
    mkdir -p "$version"
    
    template=Dockerfile.template

    dockerfiles=()

    for variant in "${variants[@]}"; do
        mkdir -p "$version/$variant"

        newDockerfile="$version/$variant/Dockerfile"
        
        echo "Generating $newDockerfile from $template..."
        { generated_warning; cat "$template"; } > "$newDockerfile"

        sed -ri \
            -e 's!%%PHP_TAG%%!'"$version-$variant"'!' \
            "$newDockerfile"
        
        dockerfiles+=( "$newDockerfile" )
    done

    newTravisEnv=
    for dockerfile in "${dockerfiles[@]}"; do
		dir="${dockerfile%Dockerfile}"
		dir="${dir%/}"
		variant="${dir#$version}"
		variant="${variant#/}"
		newTravisEnv+='\n  - VERSION='"$version VARIANT=$variant"
	done
    travisEnv="$newTravisEnv$travisEnv"

done

travis="$(awk -v 'RS=\n\n' '$1 == "env:" { $0 = "env:'"$travisEnv"'" } { printf "%s%s", $0, RS }' .travis.yml)"
echo "$travis" > .travis.yml