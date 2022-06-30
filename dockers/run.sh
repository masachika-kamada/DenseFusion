#!/bin/sh

XSOCK=/tmp/.X11-unix

XAUTH=/root/.Xauthority

SRC_CONTAINER=/root/dense_fusion
SRC_HOST="$(pwd)"

xhost local:root

docker run \
    --name dense_fusion \
    -it --rm \
    --volume=$XSOCK:$XSOCK:rw \
    --volume=$XAUTH:$XAUTH:rw \
    --volume=$SRC_HOST:$SRC_CONTAINER:rw \
    --env="XAUTHORITY=${XAUTH}" \
    --env="DISPLAY=${DISPLAY}" \
    --privileged -v /dev/bus/usb:/dev/bus/usb \
    --gpus all \
    dense_fusion
