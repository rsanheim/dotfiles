#!/usr/bin/env bash

source bin/functions

export DOTFILES_HOME="$HOME/src/rsanheim/dotfiles"
ln -sf $DOTFILES_HOME/.bashrc ~
ln -sf $DOTFILES_HOME/.bash_profile ~
ln -sf $DOTFILES_HOME/.vimrc ~
ln -sf $DOTFILES_HOME/.gitconfig ~
ln -sf $DOTFILES_HOME/.atom/ ~
ln -sf $DOTFILES_HOME/.gitignore ~

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
fi

# setup Vundle for vim
git -C ~/.vim/bundle/Vundle.vim pull || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install plugins via vim + vundle
vim +PluginInstall +qall

source ~/.bashrc

echo "==> All done!"
