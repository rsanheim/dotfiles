#!/usr/bin/env bash

source bin/functions

ln -sf ~/src/dotfiles/.bashrc ~
ln -sf ~/src/dotfiles/.bash_profile ~
ln -sf ~/src/dotfiles/.vimrc ~
ln -sf ~/src/dotfiles/.gitconfig ~
ln -sf ~/src/dotfiles/.atom/ ~/.atom

if is_osx; then
  brew bundle
fi

# setup Vundle for vim
git -C ~/.vim/bundle/Vundle.vim pull || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install plugins via vim + vundle
vim +PluginInstall +qall

source ~/.bashrc

echo "==> All done!"
