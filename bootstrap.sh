#!/usr/bin/env bash

chsh -s /bin/bash

source bin/functions

export DOTFILES_HOME="$HOME/src/rsanheim/dotfiles"
export DOTFILES_PRIVATE_HOME="$HOME/src/rsanheim/dotfiles-private"

ln -sf $DOTFILES_HOME/.bashrc ~
ln -sf $DOTFILES_HOME/.bash_profile ~
ln -sf $DOTFILES_HOME/.vimrc ~
ln -sf $DOTFILES_HOME/.gitconfig ~
ln -sf $DOTFILES_HOME/.atom/ ~
ln -sf $DOTFILES_HOME/.gitignore ~

if [[ ! -d $HOME/src/rsanheim/dotfiles-private ]]; then
  git clone https://github.com/rsanheim/dotfiles-private.git $HOME/src/rsanheim/dotfiles-private
fi

ln -sf $DOTFILES_PRIVATE_HOME/ssh_config ~/.ssh/config

if [[ ! -d $HOME/src/rsanheim/preflight ]]; then
  git clone https://github.com/rsanheim/preflight.git $HOME/src/rsanheim/preflight
fi

pushd "$HOME/src/rsanheim"
curl -s https://api.github.com/users/rsanheim/repos | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone
popd

if is_osx; then
  cd $HOME
  brew bundle
fi

# Install nvm and install latest 12.x LTS version of Node

# setup Vundle for vim
git -C ~/.vim/bundle/Vundle.vim pull || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install plugins via vim + vundle
vim +PluginInstall +qall

source ~/.bashrc

echo "==> All done!"
