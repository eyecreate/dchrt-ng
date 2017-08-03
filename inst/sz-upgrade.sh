#!/bin/bash
set -x
set -e

# Add the dev-feed
cp szdev-feed.conf /etc/opkg/

# Load the feeds
opkg update

# Upgrading is hard.
opkg remove binutils-symlinks ncurses-tools ncurses-dev --force-depends

opkg upgrade ncurses

# Finish all the upgrades
opkg upgrade

# Install all the dev packages
opkg install $(echo `cat packages.txt`)

echo "/usr/ngcc/lib" >> /etc/ld.so.conf
ldconfig