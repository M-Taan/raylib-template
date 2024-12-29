#!/usr/bin/env bash

set -eu

RAYLIB_PATH="raylib"

if [ ! -f "$RAYLIB_PATH/src/libraylib.a" ]; then
    sudo pacman -S --needed alsa-lib mesa libx11 libxrandr libxi libxcursor libxinerama base-devel git libxkbcommon
    cd "$RAYLIB_PATH/src"
    make USE_WAYLAND_DISPLAY=TRUE PLATFORM=PLATFORM_DESKTOP
fi

gcc main.c -o main -std=c99 -Wall -I. -I./raylib/src -I./raylib/src/external -lraylib -lm -ldl -pthread

set +eu
