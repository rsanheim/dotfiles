# dotfiles

My dotfiles built for ruby, javascript web dev nonsense, and general bash shell hackery.

These may work well as a jumping off point for you this sounds like your working style:

* mostly use apple silicon Macs, but spend most of your life in terminal
* prefer bash over zsh
* work daily in ruby, javascript, and shell, but don't mind diving into other languages
* use [homebrew bundle](https://github.com/Homebrew/homebrew-bundle) for installing most of your Mac apps
* use [asdf](https://asdf-vm.com) for your version switching

I tend to setup new machines or pave + reinstall on new Macs frequently, so these here dotfiles will get frequent housekeeping.

## Homebrew bundle

[homebrew-bundle](https://github.com/Homebrew/homebrew-bundle) is great. It makes installing all the things a breeze.

https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f has some handy tipstips
 
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

