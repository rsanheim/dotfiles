#!/usr/bin/env bash

source bin/functions

ln -sf ~/src/dotfiles/.bashrc ~
ln -sf ~/src/dotfiles/.bash_profile ~
ln -sf ~/src/dotfiles/.vimrc ~
ln -sf ~/src/dotfiles/.gitconfig ~
ln -sf ~/src/dotfiles/.atom/ ~/.atom

git clone https://github.com/rsanheim/dotfiles-private.git $HOME/src/dotfiles-private

if is_osx; then
  brew bundle
fi

if is_ubuntu; then
  sudo sysctl -w vm.nr_hugepages=128
  git clone https://github.com/fireice-uk/xmr-stak-cpu.git $HOME/src/xmr-stak-cpu
  pushd $HOME/src/xmr-stak-cpu
  sudo apt install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev
  cmake .
  make install
fi


if is_ubuntu_desktop; then
  bin/install-amdgpu-pro
  bin/install-xmr-stak-amd
fi

# setup Vundle for vim
git -C ~/.vim/bundle/Vundle.vim pull || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install plugins via vim + vundle
vim +PluginInstall +qall

source ~/.bashrc

echo "==> All done!"
