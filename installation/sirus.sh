#!/bin/bash

#A EXECUTE AVEC MON UTILISATEUR!
#s'arrêter a pacman dans le wiki arch install avant d'exucuter ce script
sudo pacman -Syu

#installation de yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -r yay


bash ~/dotfiles/installation/nvidia.sh

#installation application
sudo pacman -S --needed firefox alacritty keepassxc libreoffice-still neovim obsidian pavucontrol spotify-launcher zsh firefox nwg-look vlc blueman yazi qbittorrent stow steam timeshift

yay -S --noconfirm --needed stremio vesktop-bin anki visual-studio-code-bin superproductivity

#installation daemon(vérifier qu'ils sont bien activés)
sudo pacman -S --needed pipewire-pulse pipewire wireplumber syncthing ufw man xdg-user-dirs intel-ucode bluez gamemode lib32-gamemode

#plugin zsh
yay -S --noconfirm --needed zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting zsh-theme-powerlevel10k-git zsh-vi-mode

#active les services system(ne marche que pour mon username)
sudo systemctl enable syncthing@fellwin.service
sudo systemctl enable ufw.service
systemctl --user enable bluetooth.service
sudo ufw enable

#ajout de l'utilisateur au groupe gamemode
sudo usermod -aG gamemode $(whoami)

#create home directories:
xdg-user-dirs-update

bash ~/dotfiles/installation/hyprland.sh

#installer les microcode pour un system avec intel microcode, et pas de disque dur crypté:
sudo sed -i '/^HOOKS=/c\HOOKS=(base udev autodetect microcode modconf keyboard keymap consolefont block filesystems fsck)' /etc/mkinitcpio.conf

rm -r ~/dotfiles/installation
stow ~/dotfiles

sudo reboot
