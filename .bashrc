source ~/src/dotfiles/bin/functions

for file in ~/src/dotfiles/bash/*.sh; do
  [[ -r $file ]] && source $file;
done

if test "${PS1+set}"; then
  CDPATH=".:/Users/rsanheim:/Users/rsanheim/src:/Users/rsanheim/src/3dna"
fi

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/src/dotfiles/bin" ] ; then
  PATH="$HOME/src/dotfiles/bin:$PATH"
fi

# nice bash completion
if is_osx && [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export HISTCONTROL=ignoredups;
export HISTSIZE=10000;
shopt -s histappend;

export ACK_OPTIONS="--ignore-dir=log --ignore-dir=tmp --ignore-dir=public/assets"
export EDITOR=atom
export GIT_EDITOR="vim"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
