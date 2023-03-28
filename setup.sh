#!/bin/sh
passwd
pacman-key --init 
pacman-key --populate
pacman -Syy --noconfirm
pacman -S --noconfirm archlinux-keyring 
pacman -Syu --noconfirm
pacman -S --needed --noconfirm base-devel git sudo ansible

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash jacob
passwd jacob

su -c "git clone https://aur.archlinux.org/yay.git ~/yay" jacob
su -c "cd ~/yay && makepkg -Ssi && rm -rf ~yay" jacob


su -c "git clone https://github.com/JacobStephenson97/ansible ~/setup" jacob

su -c "ansible-playbook ~/setup/local.yml --ask-vault-pass --ask-become-pass" jacob



