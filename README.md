# dotfiles

here there be bash

## bootstrap


Requires xcode

```
# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# install the dotfiles - not that you can change the dotfile location with $DOTFILES_HOME, defined in .bashrc
git clone https://github.com/rsanheim/dotfiles.git ~/src/dotfiles
# set up all the things
cd ~/src/dotfiles && ./bootstrap.sh
```
