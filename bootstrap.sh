#!/usr/bin/env bash

source bin/functions

export DOTFILES_HOME="$HOME/src/rsanheim/dotfiles"
export DOTFILES_PRIVATE_HOME="$HOME/src/rsanheim/dotfiles-private"

mkdir -p "$HOME"/src/rsanheim
mkdir -p "$HOME"/src/oss
mkdir -p "$HOME"/work

ln -sf "$DOTFILES_HOME"/.atom/ ~
ln -sf "$DOTFILES_HOME"/.bash_profile ~
ln -sf "$DOTFILES_HOME"/.bashrc ~
ln -sf "$DOTFILES_HOME"/.default-gems ~
ln -sf "$DOTFILES_HOME"/.gitconfig ~
ln -sf "$DOTFILES_HOME"/.gitignore ~
ln -sf "$DOTFILES_HOME"/.vimrc ~

# ./bin/clone-personal

if is_osx; then
  echo
  echo "Installing brew bundle..."
  pushd "$DOTFILES_HOME" || exit
  brew bundle
  popd || exit 1
fi

if [[ $SHELL != "/opt/homebrew/bin/bash" ]]; then
  echo "Changing shell to homebrew bash..."
  echo "/opt/homebrew/bin/bash" | sudo tee -a /etc/shells
  chsh -s /opt/homebrew/bin/bash
fi

echo "Setting up mise..."
./bin/install-mise

echo
echo "Installing Rubies..."
./bin/install-rubies

# setup Vundle for vim
git -C ~/.vim/bundle/Vundle.vim pull || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install plugins via vim + vundle
vim +PluginInstall +qall

source "$HOME/.bashrc"

echo "==> All done!"
