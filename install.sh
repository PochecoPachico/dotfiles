#!/bin/sh
git submodule init
git submodule update

cd ../

ln -s .dotfiles/.zshrc ./.zshrc
ln -s .dotfiles/.tmux.conf ./.tmux.conf
ln -s .dotfiles/.vimrc ./.vimrc
ln -s .dotfiles/.vimrc_light ./.vimrc_light
ln -s .dotfiles/.vim ./.vim

echo "Finished!\\nYou have to install silversearcher-ag, peco and pyenv.\\nDon't forget to compile vimproc after update NeoBundle plugins.\\nCaution! tmux settings are available since version 2.0"
