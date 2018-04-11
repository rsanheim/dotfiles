export DOTFILES_HOME="$HOME/src/rsanheim/dotfiles"
source $DOTFILES_HOME/bin/functions

for file in $DOTFILES_HOME/bash/*.sh; do
  [[ -r $file ]] && source $file;
done

if test "${PS1+set}"; then
  CDPATH=".:$HOME:$HOME/src:$HOME/src/firstleads:$HOME/src/rsanheim"
fi


if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$DOTFILES_HOME/bin" ] ; then
  PATH="$DOTFILES_HOME/bin:$PATH"
fi

# Lock to Postgres 9.5 if installed - https://postgresapp.com/
POSTGRES_PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin"
if [ -d $POSTGRES_PATH ]; then
  PATH="$POSTGRES_PATH:$PATH"
fi

# for homebrew
PATH="/usr/local/sbin:$PATH"

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
export EDITOR="atom --wait"
export GIT_EDITOR="vim"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
