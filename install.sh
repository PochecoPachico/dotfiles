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
