# zsh and oh-my-zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
zsh --version
cp ./.zshrc ~/.
sudo chsh -s /usr/bin/zsh
/usr/bin/zsh
# fonts
mv ./fonts/* ~/.local/share/fonts/
# powerlevel10k
cp ./.p10k.zsh ~/.
source ~/.p10k.zsh
# miniconda
curl -fsSL -o /tmp/miniconda-install.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash /tmp/miniconda-install.sh
conda create -n misc
