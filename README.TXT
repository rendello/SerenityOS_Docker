A simple dockerfile that builds SerenityOS and creates a disk image that runs
in QEMU.

PREREQUISITES
    - Docker
    - xhost

USAGE
    ./build.sh  -- Clone SerenityOS and build it into a Debian Docker image.
    ./run.sh    -- Run SerenityOS in QEMU.

WARNINGS
    This is not a part of the SerenityOS project; don't expect support from the
    SerenityOS developers.
