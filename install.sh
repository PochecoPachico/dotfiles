#!/bin/sh
git submodule init
git submodule update

cd ../

ln -s .dotfiles/.zshrc ./.zshrc
ln -s .dotfiles/.tmux.conf ./.tmux.conf
ln -s .dotfiles/.vimrc ./.vimrc
ln -s .dotfiles/.vimrc_light ./.vimrc_light
ln -s .dotfiles/.vim ./.vim
