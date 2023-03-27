#!/bin/sh
passwd
pacman-key --init 
pacman-key --populate
pacman -S --noconfirm archlinux-keyring 
pacman -Syu --noconfirm
pacman -S --needed --noconfirm base-devel git sudo ansible

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash jacob
passwd jacob

su -c "curl -s https://raw.githubusercontent.com/JacobStephenson97/ansible/main/setup.yml >> /home/jacob/setup.yml" jacob

ansible-playbook /home/jacob/setup.yml
