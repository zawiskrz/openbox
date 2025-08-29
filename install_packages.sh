#!/bin/bash

LOGFILE="install_log.txt"

echo "🔧 Aktualizacja pakietów..." | tee -a "$LOGFILE"
sudo apt update 2>&1 | tee -a "$LOGFILE"

echo "📦 Instalacja środowiska Openbox..." | tee -a "$LOGFILE"
sudo apt install -y \
xorg lightdm lightdm-gtk-greeter \
openbox obconf lxappearance xdg-utils python3-xdg \
upower dmz-cursor-theme \
compton conky-all \
rxvt-unicode tmux pkexec \
tint2 spacefm udevil \
geany geany-plugin-spellcheck \
qt5ct \
gtk2-engines gtk2-engines-murrine gtk2-engines-pixbuf murrine-themes libgtk2.0-bin \
gnome-icon-theme gnome-icon-theme-symbolic gnome-themes-extra at-spi2-core \
mate-themes papirus-icon-theme \
dconf-editor dconf-cli \
thunar xfce4-terminal network-manager-gnome feh jgmenu menu \
x11-xserver-utils \
mc htop 2>&1 | tee -a "$LOGFILE"

echo "🔄 Restart LightDM..." | tee -a "$LOGFILE"
sudo systemctl restart lightdm 2>&1 | tee -a "$LOGFILE"

echo "🗂️ Tworzenie pliku autostartu Openbox..." | tee -a "$LOGFILE"
mkdir -p ~/.config/openbox 2>> "$LOGFILE"
xrandr --output Virtual-1  --mode 1920x1080 --rate 60 &
cat <<EOF > ~/.config/openbox/autostart
# Automatyczne uruchamianie komponentów pulpitu
# feh --bg-scale /ścieżka/do/tapety.jpg &

tint2 &
nm-applet &
xfce4-terminal &
compton &
conky &
EOF

echo "✅ Plik autostartu utworzony w ~/.config/openbox/autostart" | tee -a "$LOGFILE"
