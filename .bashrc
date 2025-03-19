export DOTFILES_HOME="$HOME/src/rsanheim/dotfiles"
export DOTFILES_PRIVATE_HOME="$HOME/src/rsanheim/dotfiles-private"
export BUNDLE_CACHE_ALL_PLATFORMS=1
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

export FIREFOX="/Applications/Firefox.app/Contents/MacOS/firefox"
alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox"

PYTHON_PATH="/usr/local/opt/python/libexec/bin"

# Use Python from Homebrew if its available
if [ -d "$PYTHON_PATH" ]; then
  PATH="$PYTHON_PATH:$PATH"
fi

# homebrew pinned Mysql 8.0 setup
if [ -d "/opt/homebrew/opt/mysql@8.0/" ]; then
  export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"
  PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
  # To start mysql 8.0 interactively
  #   /opt/homebrew/opt/mysql@8.0/bin/mysqld_safe --datadir\=/opt/homebrew/var/mysql
fi

# Use a Postgres 14 in homebrew if its there
POSTGRES_BREW_PATH="$(brew --prefix)/opt/postgresql@14/bin"
if [ -d "$POSTGRES_BREW_PATH" ]; then
  PATH="$POSTGRES_BREW_PATH:$PATH"
  export LDFLAGS="-L$(brew --prefix)/opt/postgresql@14/lib"
  export CPPFLAGS="-I$(brew --prefix)opt/postgresql@14/include"
  export PKG_CONFIG_PATH="$(brew --prefix)/opt/postgresql@14/lib/pkgconfig"
fi

# Use a Postgres 17 in homebrew if its there
POSTGRES_BREW_PATH="$(brew --prefix)/opt/postgresql@17/bin"
if [ -d "$POSTGRES_BREW_PATH" ]; then
  PATH="$POSTGRES_BREW_PATH:$PATH"
  export LDFLAGS="-L$(brew --prefix)/opt/postgresql@17/lib"
  export CPPFLAGS="-I$(brew --prefix)opt/postgresql@17/include"
  export PKG_CONFIG_PATH="$(brew --prefix)/opt/postgresql@17/lib/pkgconfig"
fi

[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

# CircleCI CLI wants to auto update every day, which is far too frequent
# See https://github.com/CircleCI-Public/circleci-cli/issues/839
export CIRCLECI_CLI_SKIP_UPDATE_CHECK=true
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

export GIT_EDITOR="cursor --wait"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export DX_ALT_BROWSER="Google Chrome"
export JIRA_API_TOKEN="op://Private/jira-cli-token/credential"

# rbenv
# eval "$(rbenv init - bash)"

# mise - activate version manager
eval "$(mise activate bash)"

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

[ -f ~/.config/dx/completion ] && source ~/.config/dx/completion
