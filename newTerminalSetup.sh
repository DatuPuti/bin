
# you will have to create the bin directory and clone bin.git manually
# setup new linux install
# git clone https://github.com/DatuPuti/bin.git
#
# clone gitCmd 
cd ~/bin
git clone https://github.com/DatuPuti/gitCmd.git
export PATH=$PATH:~/bin/gitCmd

# install homebrew
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc

# install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
# add neovim to path for instant use
# if using the .dotfiles repository then the .zshrc will have the path set
export PATH="$PATH:/opt/nvim-linux64/bin"

# get desired nerd fonts - install manually
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip

# install oh-my-zsh and power10k
cd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install colorls using ruby gem
gem install colorls

# install commandline tools 
sudo apt install stow -y
brew install thefuck
sudo apt install zoxide -y
sudo apt ripgrep -y
sudo apt install tmux
sudo apt bat -y
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# install/remove universal-ctags
# sudo apt remove universal-ctags
# sudo apt install universal-ctags
# install/remove exuberant-ctags
sudo apt remove exuberant-ctags
sudo apt install exuberant-ctags

# clone the configs from github
cd ~
mkdir dotfileBackup
cp -Rv ~/.config/nvm dotfileBackup
cp .bashrc dotfileBackup
cp .p10k.zsh dotfileBackup
cp .tmux.conf dotfileBackup
cp .zshrc dotfileBackup
git clone https://github.com/DatuPuti/.dotfiles.git
cd .dotfiles
stow --target=/home/tborland .

# last thing to do is source the .zshrc to get things going
# make sure we are using zsh shell
cd ~
sudo apt install zsh -y
chsh -s /bin/zsh

echo "export PATH=$PATH:~/bin:/opt/nvim-linux64/bin:~/bin/gitCmd" >> ~/.zshrc
