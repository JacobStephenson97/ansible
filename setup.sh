#!/bin/sh
passwd
pacman-key --init 
pacman-key --populate
pacman -Syu --noconfirm
pacman -S archlinux-keyring --noconfirm
pacman -S sudo --noconfirm

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash jacob
passwd jacob
su jacob

#pacman -S ansible --noconfirm


