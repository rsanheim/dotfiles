#!/usr/bin/env bash

# if [[ ! $SHELL == "/bin/bash" ]]; then
#   chsh -s /bin/bash
# fi

source bin/functions

export DOTFILES_HOME="$HOME/src/rsanheim/dotfiles"
export DOTFILES_PRIVATE_HOME="$HOME/src/rsanheim/dotfiles-private"

ln -sf "$DOTFILES_HOME"/.bashrc ~
ln -sf "$DOTFILES_HOME"/.bash_profile ~
ln -sf "$DOTFILES_HOME"/.vimrc ~
ln -sf "$DOTFILES_HOME"/.gitconfig ~
ln -sf "$DOTFILES_HOME"/.atom/ ~
ln -sf "$DOTFILES_HOME"/.gitignore ~

mkdir -p "$HOME"/src/rsanheim
mkdir -p "$HOME"/src/oss

if [[ ! -d $HOME/src/rsanheim ]]; then
  echo "SSH'ing to GitHub to setup .ssh dir (this is expected to fail...)"
  ssh git@github.com
fi

pushd "$HOME/src/rsanheim" || exit 1
if [[ ! -d $HOME/src/rsanheim ]]; then
  echo
  echo "Cloning personal repos..."
  curl -s https://api.github.com/users/rsanheim/repos | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone
fi
popd || exit 1

ln -sf "$DOTFILES_PRIVATE_HOME"/ssh_config ~/.ssh/config

if [[ ! -d $HOME/src/simpledotorg ]]; then
  echo
  echo "Cloning simple-server..."
  ./bin/install-simple
fi

if is_osx; then
  echo
  echo "Installing brew bundle..."
  pushd "$DOTFILES_HOME" || exit
  # brew bundle
  popd || exit 1
fi

echo
echo "Installing Rubies..."
./bin/install-rubies

# Install nvm and install latest 12.x LTS version of Node

# setup Vundle for vim
git -C ~/.vim/bundle/Vundle.vim pull || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install plugins via vim + vundle
vim +PluginInstall +qall

source "$HOME/.bashrc"

echo "==> All done!"
