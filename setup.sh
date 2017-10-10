#!/bin/sh

ln -sv $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -sv $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sv $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -sv $HOME/.dotfiles/.vimrc_light $HOME/.vimrc_light
ln -sv $HOME/.dotfiles/.vim $HOME/.vim

mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -sv $HOME/.dotfiles/.vimrc $XDG_CONFIG_HOME/init.vim
ln -sv $HOME/.dotfiles/.vim $XDG_CONFIG_HOME/nvim
