# dotfiles

here there be bash

## bootstrap (Mac)

Requires xcode

    # install homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # install the dotfiles
    git clone https://github.com/rsanheim/dotfiles.git ~/src/dotfiles
    # set up all the things
    cd ~/src/dotfiles && ./bootstrap.sh

## bootstrap (assumes you are on Ubuntu 14+)

*this is still a work in progress*

    sudo apt install git
    git clone https://github.com/rsanheim/dotfiles.git ~/src/dotfiles
    cd ~/src/dotfiles && ./bootstrap.sh
