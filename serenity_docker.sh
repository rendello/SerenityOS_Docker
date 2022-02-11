#!/bin/bash

serenity_run() {
    xhost +
    sudo docker run --privileged --rm -it \
        -e DISPLAY=$DISPLAY \
        --device /dev/snd \
        --name=serenityos \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        serenityos ./serenity.sh run
}

help_str="Usage:\n
\tbuild: Build the Dockerfile.\n
\tbuild-no-cache: Build the Dockerfile without using the cache.\n
\trun: Run SerenityOS Docker container (must be built first)."

case $1 in
    build)          sudo docker build -t serenityos . ;;
    build-no-cache) sudo docker build --no-cache -t serenityos . ;;
    run)            serenity_run ;;
    *)              echo -e $help_str ;;
esac
