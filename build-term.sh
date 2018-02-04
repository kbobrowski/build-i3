sudo apt -y install rxvt-unicode

# dotfiles
cd ~/projects
git clone https://github.com/kbobrowski/dotfiles.git

# vim config
cd
ln -s ~/projects/dotfiles/vim/.vimrc
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# urxvt config
cd
ln -s ~/projects/dotfiles/urxvt/.Xdefaults
mkdir -p ~/.fonts
cd ~/.fonts
wget https://github.com/hbin/top-programming-fonts/raw/master/Menlo-Regular.ttf

