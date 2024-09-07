#!/bin/bash
set -e
t="$HOME/.cache/depends/"
rm -rf $t
mkdir -p $t
cd $t
sudo zypper in python3-pip
sudo zypper in kernel-firmware-bluetooth bluez-firmware bluez-cups bluez-auto-enable-devices bluez
sudo zypper in opi gtk4-devel libadwaita-devel
sudo zypper in coreutils wl-clipboard xdg-utils cmake curl fuzzel rsync wget ripgrep gojq npm meson typescript gjs axel
wget https://github.com/sentriz/cliphist/releases/download/v0.5.0/v0.5.0-linux-amd64 -O cliphist
chmod +x cliphist
sudo cp cliphist /usr/local/bin/cliphist

sudo zypper in vim neovim btop 

sudo zypper in tinyxml-devel libtinyxml0 libtinyxml2-10 tinyxml2-devel gtkmm3-devel gtksourceviewmm-devel gtksourceviewmm3_0-devel libgtksourceviewmm-4_0-0 libgtksourceviewmm-3_0-0 cairomm-devel cairomm1_0-devel libcairomm-1_0-1 libcairomm-1_16-1

sudo zypper in python3-build python3-Pillow python3-pywal python3-setuptools_scm python3-wheel

sudo zypper in xrandr xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland

sudo zypper in pavucontrol wireplumber libdbusmenu-gtk3-devel libdbusmenu-gtk3-4 libdbusmenu-gtk4 playerctl swww

echo Now we need to install \"yad\" via opi. You should select multimedia_proaudio or Dead_Mozay repo
read -p "Press any key..."
opi yad
opi gnome-bluetooth-devel

sudo zypper in scdoc
# cd $t
# git clone  https://github.com/ReimuNotMoe/ydotool
# cd ydotool
# mkdir build && cd build
# cmake -DSYSTEMD_USER_SERVICE=OFF -DSYSTEMD_SYSTEM_SERVICE=ON ..
# make -j `nproc`
# sudo make install
# sudo chmod +s $(which ydotool)
# sudo systemctl daemon-reload
# sudo systemctl enable ydotoold
# sudo systemctl start ydotoold
# ln -sf /tmp/.ydotool_socket /run/user/$(id -u $(whoami))/.ydotool_socket

sudo zypper in webp-pixbuf-loader gtk-layer-shell-devel gtk3 libgtksourceview-3_0-1 gtksourceview-devel gobject-introspection upower

sudo zypper in polkit-gnome gnome-keyring gnome-control-center gnome-bluetooth NetworkManager gammastep gnome-bluetooth libgnome-bluetooth-3_0-13

sudo zypper in brightnessctl ddcutil

cd $t
git clone https://github.com/hyprwm/hyprutils.git
cd hyprutils/
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build

cd $t
git clone https://github.com/hyprwm/hyprpicker.git
cd hyprpicker
sudo zypper in wayland-protocols-devel Mesa-libGLESv3-devel
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target hyprpicker -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build

#dart-sass
cd $t
wget https://github.com/sass/dart-sass/releases/download/1.77.0/dart-sass-1.77.0-linux-x64.tar.gz
tar -xzf dart-sass-1.77.0-linux-x64.tar.gz
cd dart-sass
sudo cp -rf * /usr/local/bin/

sudo zypper in python3-pywayland python3-psutil hypridle wl-clipboard hyprlang-devel libwebp-devel file-devel libdrm-devel libgbm-devel pam-devel Mesa-libGLESv2-devel libsass-devel libsass-3_6_6-1

cd $t
git clone https://github.com/hyprwm/hyprlock.git
cd hyprlock
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hyprlock -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build

cd $t
git clone https://github.com/ArtsyMacaw/wlogout.git
cd wlogout
meson build
ninja -C build
sudo ninja -C build install


sudo zypper in cargo
cd $t
# git clone https://github.com/Kirottu/anyrun.git # Clone the repository
# cd anyrun # Change the active directory to it
# cargo build --release # Build all the packages
# cargo install --path anyrun/ # Install the anyrun binary
# sudo cp $HOME/.cargo/bin/anyrun /usr/local/bin/
# mkdir -p ~/.config/anyrun/plugins # Create the config directory and the plugins subdirectory
# cp target/release/*.so ~/.config/anyrun/plugins # Copy all of the built plugins to the correct directory
# cp examples/config.ron ~/.config/anyrun/config.ron # Copy the default config file

# ttf-material-symbols-variable-git ttf-space-mono-nerd ttf-readex-pro
# I do not know how to fix fonts, so I copied them from Arch (all from /usr/share/fonts/ on Arch to /usr/local/share/fonts/ on OpenSUSE)
sudo zypper in gtk3-metatheme-adwaita qt5ct libqt5-qtwayland qt6-wayland fontconfig jetbrains-mono-fonts gdouros-symbola-fonts lato-fonts fish foot starship

sudo zypper in swappy wf-recorder grim tesseract tesseract-data slurp

sudo zypper in gobject-introspection-devel gjs-devel libpulse-devel

# color-generation
sudo zypper in python3-material-color-utilities-python python3-base python3-regex unzip
sudo zypper in python3-gobject-devel libsoup-devel blueprint-compiler python3-anyascii
sudo zypper in python-base python3-svglib python3-libsass libxdp-devel typelib-1_0-Xdp-1_0 typelib-1_0-XdpGtk3-1_0 typelib-1_0-XdpGtk4-1_0
pip3 install https://github.com/T-Dynamos/materialyoucolor-python/archive/master.zip --break-system-packages

cd $t
git clone https://github.com/GradienceTeam/Gradience.git
cd Gradience
git submodule update --init --recursive
meson setup builddir
meson configure builddir -Dprefix=/usr/local
sudo ninja -C builddir install

