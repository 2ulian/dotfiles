#!/bin/bash

#installation de pywal et police et theme
yay -S --noconfirm --needed python-pywal16 python-pywalfox pywal-spicetify ttf-press-start-2p material-gtk-theme-deepocean-git bibata-cursor-theme

sudo pacman -S --needed ttf-hack-nerd papirus-icon-theme

#installation de hyprland:
yay -S --noconfirm --needed hyprpicker-git waypaper hyprshade ags-hyprpanel-git hyprpolkitagent-git hyprsunset matugen-bin

sudo pacman -S --needed swww wofi kitty hyprland

# modification du launcher de spotify
sudo sed -i 's/^#extra_arguments = \["--enable-features=UseOzonePlatform", "--ozone-platform=wayland"]/extra_arguments = \["--enable-features=UseOzonePlatform", "--ozone-platform=wayland"]/' /etc/spotify-launcher.conf
