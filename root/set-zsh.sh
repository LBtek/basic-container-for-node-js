#!/bin/bash

apt-get install zsh -y
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mv -b ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k

echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

