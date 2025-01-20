
# installation des drivers
sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils egl-wayland libva-nvidia-driver linux-headers

#modifcation de mkinitcpio
sudo sed -i 's/^MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf

# création et application de nvidia.conf
sudo touch /etc/modprobe.d/nvidia.conf
sudo bash -c "echo 'options nvidia_drm modeset=1 fbdev=1' > /etc/modprobe.d/nvidia.conf"

sudo mkinitcpio -P
