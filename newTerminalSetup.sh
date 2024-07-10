echo '******************************************************************'
echo '* you will have to create the bin directory and clone bin.git manually'
echo '* setup new linux install'
echo '* git clone https://github.com/DatuPuti/bin.git'
echo '******************************************************************'

echo ' '
echo ' '

echo '******************************************************************'
echo '** clone gitCmd '
echo '******************************************************************'
cd ~/bin
git clone https://github.com/DatuPuti/gitCmd.git
export PATH=$PATH:~/bin/gitCmd

echo '******************************************************************'
echo '* install homebrew'
echo '******************************************************************'
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc

echo '******************************************************************'
echo '** install neovim'
echo '******************************************************************'
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
# add neovim to path for instant use
# if using the .dotfiles repository then the .zshrc will have the path set
export PATH="$PATH:/opt/nvim-linux64/bin"

echo '******************************************************************'
echo '** get desired nerd fonts - install manually'
echo '******************************************************************'
cd ~/Downloads
rm -rf Hack.zip
rm -rf JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip

echo '******************************************************************'
echo '** install oh-my-zsh and power10k'
echo '******************************************************************'
cd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo '******************************************************************'
echo '** install colorls using ruby gem'
echo '******************************************************************'
gem install colorls

echo '******************************************************************'
echo '** install commandline tools '
echo '******************************************************************'
sudo apt install stow -y
brew install thefuck
sudo apt install zoxide -y
sudo apt ripgrep -y
sudo apt install tmux
sudo apt bat -y
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

echo '******************************************************************'
echo '** install/remove universal-ctags'
echo '** sudo apt remove universal-ctags'
echo '** sudo apt install universal-ctags'
echo '** install/remove exuberant-ctags'
echo '******************************************************************'
sudo apt remove exuberant-ctags -y
sudo apt install exuberant-ctags -y

echo '******************************************************************'
echo '** last thing to do is source the .zshrc to get things going'
echo '** make sure we are using zsh shell'
echo '******************************************************************'
cd ~
sudo apt install zsh -y
chsh -s /bin/zsh

echo '******************************************************************'
echo '** clone the configs from github'
echo '******************************************************************'
cd ~
mkdir dotfileBackup
mv -Rv ~/.config/nvm dotfileBackup
mv .bashrc dotfileBackup
mv .p10k.zsh dotfileBackup
mv .tmux.conf dotfileBackup
mv .zshrc dotfileBackup
git clone https://github.com/DatuPuti/.dotfiles.git
cd .dotfiles
stow --target=/home/$USER .

echo '******************************************************************'
echo '** newTerminalSetup.sh - end'
echo '******************************************************************'
