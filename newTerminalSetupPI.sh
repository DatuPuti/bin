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
echo '** get desired nerd fonts - install manually'
echo '******************************************************************'
cd ~/Downloads
if [ ! -f ~/Downloads/JetBrainsMono.zip ]; then 
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
fi

echo '******************************************************************'
echo '** install oh-my-zsh and power10k'
echo '******************************************************************'
cd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo '******************************************************************'
echo '** install ruby for colorls'
echo '** install colorls using ruby gem'
echo '******************************************************************'
sudo apt install ruby-full -y
echo 'export PATH="$PATH:$HOME/.rbenv/bin' >> .zshrc
echo 'export PATH="$PATH:$HOME/.rbenv/bin' >> .bashrc
echo 'eval "$(rbenv init -)"' >> .zshrc
echo 'eval "$(rbenv init -)"' >> .bashrc
export PATH=$PATH:$HOME/.rbenv/bin
eval "$(rbenv init -)"
sudo gem install colorls

echo '******************************************************************'
echo '* install homebrew'
echo '******************************************************************'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)" 
echo 'export PATH="$PATH:$HOME/.linuxbrew/bin"' >> .zshrc
echo 'export PATH="$PATH:$HOME/.linuxbrew/bin"' >> .bashrc
export PATH="$PATH:$HOME/.linuxbrew/bin"

echo '******************************************************************'
echo '** install neovim'
echo '******************************************************************'
sudo apt install snapd -y
sudo snap install snapd 
sudo snap install neovim

echo '******************************************************************'
echo '** install commandline tools '
echo '******************************************************************'
#brew install thefuck
sudo apt install thefuck -y
sudo apt install stow -y
sudo apt install zoxide -y
sudo apt install ripgrep -y
sudo apt install tmux -y
sudo apt install bat -y
sudo apt install zsh-syntax-highlighting -y
sudo apt install font-manager -y
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

echo '******************************************************************'
echo '** install/remove universal-ctags'
echo '** sudo apt remove universal-ctags'
echo '** sudo apt install universal-ctags'
echo '** install/remove exuberant-ctags'
echo '******************************************************************'
sudo apt remove universal-ctags -y
sudo apt install exuberant-ctags -y

echo '******************************************************************'
echo '** clone the configs from github'
echo '******************************************************************'
cd ~
mkdir dotfileBackup
mv ~/.config/nvm dotfileBackup
mv .bashrc dotfileBackup
mv .p10k.zsh dotfileBackup
mv .tmux.conf dotfileBackup
mv .zshrc dotfileBackup
git clone https://github.com/DatuPuti/.dotfiles.git
cd .dotfiles
rm -rf .config/nvim/lua
rm -rf .config/nvim/init.lua
rm -rf .config/nvim/lazy-lock.json
stow --target=/home/$USER .
rm -rf ~/pull_request_template.md

echo '******************************************************************'
echo '** git clone tmux plugin manager '
echo '******************************************************************'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo '******************************************************************'
echo '** first thing to do is install zsh'
echo '** make sure we set zsh as the new default shell'
echo '******************************************************************'
cd ~
sudo apt install zsh -y
#chsh -s /bin/zsh

echo '******************************************************************'
echo '** last thing to do is source the .zshrc to get things going'
echo '** make sure we are using zsh shell'
echo '******************************************************************'
cd ~
source .zshrc

echo '******************************************************************'
echo '** newTerminalSetup.sh - end'
echo '******************************************************************'
