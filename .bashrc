export DOTFILES_HOME="$HOME/src/rsanheim/dotfiles"
export DOTFILES_PRIVATE_HOME="$HOME/src/rsanheim/dotfiles-private"
source $DOTFILES_HOME/bin/functions

for file in $DOTFILES_HOME/bash/*.sh; do
  [[ -r $file ]] && source $file;
done

for file in $DOTFILES_PRIVATE_HOME/bash/*.sh; do
  [[ -r $file ]] && source $file;
done

if test "${PS1+set}"; then
  CDPATH=".:$HOME:$HOME/src:$HOME/src/simpledotorg:$HOME/src/rsanheim:$HOME/src/oss"
fi

# More open files
# https://gist.github.com/tombigel/d503800a282fcadbee14b537735d202c
ulimit -n 65536
ulimit -u 2048

# for M1 homebrew compat homebrew
if [ "$(sysctl -n sysctl.proc_translated)" = "1" ]; then
  brew_path="/usr/local/homebrew/bin"
else
  brew_path="/opt/homebrew/bin"
fi
export PATH="${brew_path}:${PATH}"

PATH="/usr/local/sbin:$PATH"

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$DOTFILES_HOME/bin" ] ; then
  PATH="$DOTFILES_HOME/bin:$PATH"
fi

PYTHON_PATH="/usr/local/opt/python/libexec/bin"

# Use Python from Homebrew if its available
if [ -d "$PYTHON_PATH" ]; then
  PATH="$PYTHON_PATH:$PATH"
fi

# Lock to current Postgres if installed - https://postgresapp.com/
POSTGRES_PATH="/Applications/Postgres.app/Contents/Versions/10/bin"
if [ -d $POSTGRES_PATH ]; then
  PATH="$POSTGRES_PATH:$PATH"
fi

# Use a pinned Postgres@10 install in homebrew if its there
POSTGRES_BREW_PATH="/opt/homebrew/opt/postgresql@10/bin"
if [ -d $POSTGRES_BREW_PATH ]; then
  PATH="$POSTGRES_BREW_PATH:$PATH"
fi

# nice bash completion
if is_osx && [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export AWS_PROFILE="default"
export HISTCONTROL=ignoredups;
export HISTSIZE=10000;
shopt -s histappend histverify;

# jenv for ze java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# ansible
export ANSIBLE_VAULT_PASSWORD_FILE="/Users/rsanheim/src/simpledotorg/deployment/.vault_password"

if [ -f "/usr/local/bin/code-insiders" ] ; then
  export EDITOR="code-insiders --wait"
else
  export EDITOR="code --wait"
fi

export GIT_EDITOR="vim"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
