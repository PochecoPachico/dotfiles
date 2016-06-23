#!/bin/sh
git submodule init
git submodule update

ln -s .zshrc ../.zshrc
ln -s .tmux.conf ../.tmux.conf
ln -s .vimrc ../.vimrc
ln -s .vimrc_light ../.vimrc_light
ln -s .vim ../.vim

echo "Finished!\\nYou have to install silversearcher-ag and pyenv.\\nDon't forget to compile vimproc after update NeoBundle plugins.\\nCaution! tmux settings are available since version 2.0"
