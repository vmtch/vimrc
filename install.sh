#!/bin/sh

ln -sf ~/vimrc/.vimrc ~/.vimrc

mkdir -p ~/.vim/pack/themes/start
cd ~/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git dracula
