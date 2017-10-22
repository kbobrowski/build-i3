# update system
sudo apt update
sudo apt -y upgrade
mkdir -p ~/projects

# zsh
sudo apt -y install build-essential zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# pure prompt
cd ~/projects
git clone https://github.com/sindresorhus/pure.git
cd pure
sudo ln -s "$PWD/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
sudo ln -s "$PWD/async.zsh" /usr/local/share/zsh/site-functions/async
sed -i 's/\"robbyrussell\"/\"\"/g' ~/.zshrc
echo 'autoload -U promptinit; promptinit' >> ~/.zshrc
echo 'prompt pure' >> ~/.zshrc
echo 'export EDITOR=vim' >> ~/.zshrc

echo
echo 'Change your shell with: "chsh -s /bin/zsh" and reboot: "sudo reboot now"'
