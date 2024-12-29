#!/usr/bin/env bash

set -eu

should_run=${1:-no}

RAYLIB_PATH="raylib"

if [ ! -d "RAYLIB_PATH/.git" ]; then
    git submodule update --init --recursive
fi

if [ ! -f "$RAYLIB_PATH/src/libraylib.a" ]; then
    sudo pacman -S --needed alsa-lib mesa libx11 libxrandr libxi libxcursor libxinerama base-devel git libxkbcommon
    cd "$RAYLIB_PATH/src"
    make USE_WAYLAND_DISPLAY=TRUE PLATFORM=PLATFORM_DESKTOP
    cd -
fi

gcc main.c -o main -std=c99 -Wall -I. -I./raylib/src -I./raylib/src/external -lraylib -lm -ldl -pthread

if [ "$should_run" = "run" ]; then
    ./main
fi

set +eu
