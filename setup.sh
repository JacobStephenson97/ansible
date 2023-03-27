#!/bin/sh
passwd
pacman-key --init 
pacman-key --populate
pacman -Syu --noconfirm
pacman -S archlinux-keyring --noconfirm
pacman -S sudo --noconfirm
pacman -S ansible --noconfirm

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash jacob
passwd jacob

curl -s https://raw.githubusercontent.com/JacobStephenson97/ansible/main/setup.yml >> /home/jacob/setup.yml
chown jacob /home/jacob/setup.yml

