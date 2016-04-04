#!/bin/sh

cd ../

mv dotfiles .dotfiles
ln -s .dotfiles/.zshrc .zshrc
ln -s .dotfiles/.vimrc .vimrc
ln -s .dotfiles/.tmux.conf .tmux.conf
ln -s .dotfiles/.vim .vim

cd .dotfiles

git submodule init
git submodule update

cd .vim/bundle/vimproc

make

cd ../../../../

echo "Finished!\nYou have to install silversearcher-ag, powerline, and get powerline fonts.\nCaution! these settings are available tmux 2.0 or higher"
