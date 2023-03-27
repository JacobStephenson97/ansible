#!/bin/sh
pacman-key --init
pacman-key --populate
pacman -Syu
pacman -S archlinux-keyring
pacman -S sudo
pacman -S ansible
