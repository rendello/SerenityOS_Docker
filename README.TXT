A simple dockerfile that builds SerenityOS and creates a disk image that runs
in QEMU.

PREREQUISITES
    - Docker
    - xhost

USAGE
    ./serenity_docker.sh build: Build the Dockerfile.
    ./serenity_docker.sh build-no-cache: As above, without using cache.
    ./serenity_docker.sh run: Run SerenityOS Docker container (must be built first).

WARNINGS
    This is not a part of the SerenityOS project; don't expect support from the
    SerenityOS developers.
