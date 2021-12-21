# This script is needed to ensure Linux has 2 different audio outputs for the Razer Nari speakers

sudo cp razer-nari-pulseaudio-profile/razer-nari-input.conf /usr/share/pulseaudio/alsa-mixer/paths/
sudo cp razer-nari-pulseaudio-profile/razer-nari-output-game.conf /usr/share/pulseaudio/alsa-mixer/paths/
sudo cp razer-nari-pulseaudio-profile/razer-nari-output-chat.conf /usr/share/pulseaudio/alsa-mixer/paths/
sudo cp razer-nari-pulseaudio-profile/razer-nari-usb-audio.conf /usr/share/pulseaudio/alsa-mixer/profile-sets/
sudo cp razer-nari-pulseaudio-profile/91-pulseaudio-razer-nari.rules /lib/udev/rules.d/