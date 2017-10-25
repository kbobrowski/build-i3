sudo apt -y install i3

# basic dirs
mkdir -p ~/Downloads
mkdir -p ~/Pictures
mkdir -p ~/projects

# wallpaper
sudo cp wallpaper.jpg /etc/lightdm/


# i3-gaps
mkdir -p ~/projects 
sudo add-apt-repository ppa:aguignard/ppa -y
sudo apt update
sudo apt -y install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev
cd ~/projects
git clone https://github.com/Airblader/i3.git i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make -j8
sudo make install

# basic utilities
sudo apt -y install zip i3blocks thunar synapse feh rxvt-unicode bc lm-sensors

# google chrome
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -y install -f
sudo dpkg -i google-chrome-stable_current_amd64.deb

# spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get -y install spotify-client

# bluetooth
sudo apt -y install blueman

# slack
cd ~/Downloads
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.8.2-amd64.deb
sudo dpkg -i slack-desktop-2.8.2-amd64.deb
sudo apt-get -y install -f
sudo dpkg -i slack-desktop-2.8.2-amd64.deb

# dotfiles
cd ~/projects
git clone https://github.com/kbobrowski/dotfiles.git

# lightdm greeter config
sudo cp ~/projects/dotfiles/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/

# vim config
cd
ln -s ~/projects/dotfiles/vim/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# i3-gaps config
mkdir -p ~/.config
cd ~/.config
mkdir i3
cd i3
ln -s ~/projects/dotfiles/i3/config
ln -s ~/projects/dotfiles/i3/lock.sh
ln -s ~/projects/dotfiles/i3/volume.sh
ln -s ~/projects/dotfiles/i3/weather.sh
ln -s ~/projects/dotfiles/i3/workspace-calendar.json
ln -s ~/projects/dotfiles/i3/workspace-chat.json
ln -s ~/projects/dotfiles/i3/workspace-chrome.json
ln -s ~/projects/dotfiles/i3/workspace-inbox.json
ln -s ~/projects/dotfiles/i3/workspace-slack.json
ln -s ~/projects/dotfiles/i3/workspace-thunar.json
ln -s ~/projects/dotfiles/i3/i3blocks.conf
sudo apt -y install weather-util scrot imagemagick pasystray compton redshift pavucontrol
cd ~/Downloads
wget http://fontawesome.io/assets/font-awesome-4.7.0.zip
unzip font-awesome-4.7.0.zip
mkdir -p ~/.fonts
cp font-awesome-4.7.0/fonts/fontawesome-webfont.ttf ~/.fonts
cd /usr/share/weather-util
sudo gunzip stations
sudo sed -i 's/weather.noaa.gov\/pub/tgftp.nws.noaa.gov/g' stations
sudo gzip stations




# urxvt config
cd
ln -s ~/projects/dotfiles/urxvt/.Xdefaults
mkdir -p ~/.fonts
cd ~/.fonts
wget https://github.com/hbin/top-programming-fonts/raw/master/Menlo-Regular.ttf

# theme and icons
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
sudo apt-get update
sudo apt-get -y --allow-unauthenticated install arc-theme
sudo rm /etc/apt/sources.list.d/arc-theme.list

cd ~/projects
git clone https://github.com/snwh/faba-icon-theme.git
cd faba-icon-theme
bash autogen.sh
make
sudo make install

cd
ln -s ~/projects/dotfiles/gtk/.gtkrc-2.0
