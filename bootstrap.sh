#!/usr/bin/env bash

ln -sf ~/src/dotfiles/.bash_profile ~
ln -sf ~/src/dotfiles/.vimrc ~
source ~/.bash_profile
brew bundle
echo "==> All done!"
