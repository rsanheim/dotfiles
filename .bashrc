export DOTFILES_HOME="$HOME/src/rsanheim/dotfiles"
export DOTFILES_PRIVATE_HOME="$HOME/src/rsanheim/dotfiles-private"
source "$DOTFILES_HOME/bin/functions"

if [ "$(uname -m)" = "x86_64" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
else
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

PATH="/usr/local/sbin:$PATH"
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

for file in $DOTFILES_HOME/bash/*.sh; do
  [[ -r $file ]] && source $file
done

for file in $DOTFILES_PRIVATE_HOME/bash/*.sh; do
  [[ -r $file ]] && source $file
done

if test "${PS1+set}"; then
  CDPATH=".:$HOME:$HOME/src:$HOME/work:$HOME/work/gems:$HOME/src/rsanheim:$HOME/src/oss"
fi

if [ -f "$DOTFILES_HOME/.private" ]; then
  source "$DOTFILES_HOME/.private"
fi

# More open files
# https://gist.github.com/tombigel/d503800a282fcadbee14b537735d202c
ulimit -n 65536
ulimit -u 2048

# Docker Desktop user install
# if [ -d "$HOME/.docker/bin" ]; then
#   PATH="$HOME/.docker/bin:$PATH"
# fi

if [ -d "$DOTFILES_HOME/bin" ]; then
  PATH="$DOTFILES_HOME/bin:$PATH"
fi

if [ -d "$DOTFILES_PRIVATE_HOME/bin" ]; then
  PATH="$DOTFILES_PRIVATE_HOME/bin:$PATH"
fi

if [ -d "$HOME/work/works-on-my-machine/bin" ]; then
  PATH=$PATH:$HOME/work/works-on-my-machine/bin
fi

# for switching between local and cloud dev
if [ -f "$HOME/local-docker.sh" ]; then
  source "$HOME/local-docker.sh"
fi

PYTHON_PATH="/usr/local/opt/python/libexec/bin"

# Use Python from Homebrew if its available
if [ -d "$PYTHON_PATH" ]; then
  PATH="$PYTHON_PATH:$PATH"
fi

# Use a pinned Postgres install in homebrew if its there
POSTGRES_BREW_PATH="$(brew --prefix)/opt/postgresql@14/bin"
if [ -d "$POSTGRES_BREW_PATH" ]; then
  PATH="$POSTGRES_BREW_PATH:$PATH"
  export LDFLAGS="-L$(brew --prefix)/opt/postgresql@14/lib"
  export CPPFLAGS="-I$(brew --prefix)opt/postgresql@14/include"
  export PKG_CONFIG_PATH="$(brew --prefix)/opt/postgresql@14/lib/pkgconfig"
fi

# nice bash completion
if is_osx && [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# rbenv
if which rbenv >/dev/null; then eval "$(rbenv init -)"; fi

export HOMEBREW_NO_ANALYTICS=true
export HISTCONTROL=ignoredups
export HISTSIZE=10000
shopt -s histappend histverify
# set '**' to match all files and zero or more directories and subdirectories
shopt -s globstar

if [ -f "/usr/local/bin/code-insiders" ]; then
  export EDITOR="code-insiders --wait"
else
  export EDITOR="code --wait"
fi

export GIT_EDITOR="vim"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# asdf direnv
# PATH="$PATH:~/.asdf/bin"
# source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"

if [ -f "/Users/rsanheim/work/dox-compose/bin/dox-init" ]; then
  eval "$("/Users/rsanheim/work/dox-compose/bin/dox-init")"
fi

# Normal asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
