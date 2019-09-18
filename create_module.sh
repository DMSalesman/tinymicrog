#!/bin/bash

set -e

get_value() {
    echo -n "$1" | grep -F "$2" | cut -d "=" -f2
}

pack_module() {
    zip -9r "$1" META-INF README.md install.sh module.prop system
}

main() {
    data="$(cat "module.prop")"

    modid="$(get_value "$data" "id=")"
    modver="$(get_value "$data" "version=")"

    pack_module "$modid-$modver.zip"
}

main
