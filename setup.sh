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
cd ~

sudo pacman -S ansible --noconfirm

curl -s https://raw.githubusercontent.com/JacobStephenson97/ansible/main/setup.yml >> setup.yml

ansible-playbook setup.yml
