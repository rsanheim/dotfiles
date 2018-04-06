#!/usr/bin/env bash

source bin/functions

export DOTFILES_HOME="$HOME/src/rsanheim/dotfiles"
ln -sf $DOTFILES_HOME/.bashrc ~
ln -sf $DOTFILES_HOME/.bash_profile ~
ln -sf $DOTFILES_HOME/.vimrc ~
ln -sf $DOTFILES_HOME/.gitconfig ~
ln -sf $DOTFILES_HOME/.atom/ ~

if [[ ! -d $HOME/src/rsanheim/dotfiles-private ]]; then
  git clone https://github.com/rsanheim/dotfiles-private.git $HOME/src/rsanheim/dotfiles-private
fi

if [[ ! -L "$HOME/Documents" && -d "$HOME/Dropbox/Documents" ]]; then
  echo "Symlinking Dropbox documents to $HOME/Documents"
  if [[ -d "$HOME/Documents" ]]; then
    sudo mv $HOME/Documents $HOME/Documents.old
  fi
  ln -sv $HOME/Dropbox/Documents $HOME
fi

if is_osx; then
  brew bundle
  brew install --HEAD macvim-dev/macvim/macvim
fi

if is_ubuntu; then
  # install xmr-stak-cpu
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
