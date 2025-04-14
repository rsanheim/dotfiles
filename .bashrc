export BUNDLE_CACHE_ALL_PLATFORMS=1
export CIRCLECI_CLI_SKIP_UPDATE_CHECK=true
export DOTFILES_HOME="$HOME/src/rsanheim/dotfiles"
export DOTFILES_PRIVATE_HOME="$HOME/src/rsanheim/dotfiles-private"
export DX_ALT_BROWSER="Google Chrome"
export EDITOR="cursor --wait"
export FIREFOX="/Applications/Firefox.app/Contents/MacOS/firefox"
export GIT_EDITOR="cursor --wait"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_NO_ANALYTICS=true
export JIRA_API_TOKEN="op://Private/jira-cli-token/credential"

# Set ulimit - see https://gist.github.com/tombigel/d503800a282fcadbee14b537735d202c
ulimit -n 65536
ulimit -u 2048

# Source Functions and Scripts
source "$DOTFILES_HOME/bin/functions"

if test "${PS1+set}"; then
  CDPATH=".:$HOME:$HOME/src:$HOME/work:$HOME/work/gems:$HOME/src/rsanheim:$HOME/src/oss"
fi

# Path Modifications
PATH="/usr/local/sbin:$PATH"
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$DOTFILES_HOME/bin" ]; then
  PATH="$DOTFILES_HOME/bin:$PATH"
fi

if [ -d "$DOTFILES_PRIVATE_HOME/bin" ]; then
  PATH="$DOTFILES_PRIVATE_HOME/bin:$PATH"
fi

if [ -d "$HOME/work/works-on-my-machine/bin" ]; then
  PATH="$PATH:$HOME/work/works-on-my-machine/bin"
fi

if is_osx; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -d "$HOME/go/bin" ]; then
  PATH="$PATH:$HOME/go/bin"
fi

for file in $DOTFILES_HOME/bash/*.sh; do
  [[ -r $file ]] && source $file
done

for file in $DOTFILES_PRIVATE_HOME/bash/*.sh; do
  [[ -r $file ]] && source $file
done

if [ -f "$HOME/local-docker.sh" ]; then
  source "$HOME/local-docker.sh"
fi

if [ -f "$DOTFILES_HOME/.private" ]; then
  source "$DOTFILES_HOME/.private"
fi

# Docker Desktop user install
# if [ -d "$HOME/.docker/bin" ]; then
#   PATH="$HOME/.docker/bin:$PATH"
# fi

# Homebrew pinned Mysql 8.0 setup
if [ -d "/opt/homebrew/opt/mysql@8.0/" ]; then
  export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"
  PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
fi

# Use a Postgres 17 in homebrew if it's there
POSTGRES_BREW_PATH="$(brew --prefix)/opt/postgresql@17/bin"
if [ -d "$POSTGRES_BREW_PATH" ]; then
  PATH="$POSTGRES_BREW_PATH:$PATH"
  export LDFLAGS="-L$(brew --prefix)/opt/postgresql@17/lib"
  export CPPFLAGS="-I$(brew --prefix)/opt/postgresql@17/include"
  export PKG_CONFIG_PATH="$(brew --prefix)/opt/postgresql@17/lib/pkgconfig"
else
  # Use a Postgres 14 in homebrew if it's there
  POSTGRES_BREW_PATH="$(brew --prefix)/opt/postgresql@14/bin"
  if [ -d "$POSTGRES_BREW_PATH" ]; then
    PATH="$POSTGRES_BREW_PATH:$PATH"
    export LDFLAGS="-L$(brew --prefix)/opt/postgresql@14/lib"
    export CPPFLAGS="-I$(brew --prefix)/opt/postgresql@14/include"
    export PKG_CONFIG_PATH="$(brew --prefix)/opt/postgresql@14/lib/pkgconfig"
  else
    # Print a warning if neither version is found, based on DEBUG_POSTGRES
    if [ "$DEBUG_BASH" = "1" ]; then
      echo "Warning: Neither PostgreSQL 17 nor PostgreSQL 14 is installed."
    fi
  fi
fi

[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

# History settings
export HISTCONTROL=ignoredups
export HISTSIZE=10000
shopt -s histappend histverify
shopt -s globstar


# For orbstack - currently disabled
# source ~/.orbstack/shell/init.bash 2>/dev/null || :

# Mise - activate version manager
eval "$(mise activate bash)"

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

[ -f ~/.config/dx/completion ] && source ~/.config/dx/completion
