FROM ubuntu:xenial

MAINTAINER Marius André Elsfjordstrand Beck <skaterase@gmail.com>

ARG GODOT_VERSION=2.1.2
ARG GODOT_VARIANT=stable

RUN buildDeps=' \
	wget \
	unzip \
    	build-essential \
    	scons \
        pkg-config \
        libx11-dev \
        libxcursor-dev \
        libasound2-dev \
        libpulse-dev \
        libfreetype6-dev \
        libgl1-mesa-dev \
        libglu-dev \
        libssl-dev \
        libxinerama-dev \
        libxrandr-dev \
        libudev-dev \
    ' \
    && set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps \
    && wget --progress=bar:force --no-check-certificate "https://github.com/godotengine/godot/archive/${GODOT_VERSION}-${GODOT_VARIANT}.zip" \
    && unzip ${GODOT_VERSION}-${GODOT_VARIANT}.zip \
    && rm ${GODOT_VERSION}-${GODOT_VARIANT}.zip \
    && cd godot-${GODOT_VERSION}-${GODOT_VARIANT} \
    && scons -j4 p=server target=release_debug tools=yes bits=64 \
    && cp bin/godot_server.server.opt.tools.64 /bin/godot \
    && cd .. \
    && rm -rf godot-${GODOT_VERSION}-${GODOT_VARIANT}/ \
    && wget --progress=bar:force --no-check-certificate "https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-${GODOT_VARIANT}_export_templates.tpz" \
    && unzip -d ~/.godot Godot_v${GODOT_VERSION}-${GODOT_VARIANT}_export_templates.tpz \
    && rm Godot_v${GODOT_VERSION}-${GODOT_VARIANT}_export_templates.tpz \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -rf /var/lib/apt/lists/*
