# dotfiles

here there be bash

## bootstrap

Requires homebrew. You can install homebrew via:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Clone and bootstrap

```
# install the dotfiles - note that you can change the dotfile location with $DOTFILES_HOME, defined in .bashrc
git clone https://github.com/rsanheim/dotfiles.git ~/src/rsanheim/dotfiles

# set up all the things
cd ~/src/rsanheim/dotfiles && ./bootstrap.sh
```

