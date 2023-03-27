#!/bin/sh
passwd
pacman-key --init
pacman-key --populate
pacman -Syu
pacman -S archlinux-keyring
pacman -S sudo

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash jacob
passwd jacob
su jacob

pacman -S ansible


