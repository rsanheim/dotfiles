export DOTFILES_HOME="$HOME/src/rsanheim/dotfiles"
export DOTFILES_PRIVATE_HOME="$HOME/src/rsanheim/dotfiles-private"
source "$DOTFILES_HOME/bin/functions"

if [ "$(uname -m)" = "x86_64" ]; then
  brew_path="/usr/local/homebrew/bin"
  eval $(/usr/local/bin/brew shellenv)
else
  brew_path="/opt/homebrew/bin"
  eval $(/opt/homebrew/bin/brew shellenv)
fi
for file in $DOTFILES_HOME/bash/*.sh; do
  [[ -r $file ]] && source $file;
done

for file in $DOTFILES_PRIVATE_HOME/bash/*.sh; do
  [[ -r $file ]] && source $file;
done

if test "${PS1+set}"; then
  CDPATH=".:$HOME:$HOME/src:$HOME/src/monograph:$HOME/src/rsanheim:$HOME/src/oss"
fi

# More open files
# https://gist.github.com/tombigel/d503800a282fcadbee14b537735d202c
ulimit -n 65536
ulimit -u 2048

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
POSTGRES_BREW_PATH="$(brew --prefix)/opt/postgresql@10/bin"
if [ -d $POSTGRES_BREW_PATH ]; then
  PATH="$POSTGRES_BREW_PATH:$PATH"
  export LDFLAGS="-L$(brew --prefix)/opt/postgresql@10/lib"
  export CPPFLAGS="-I$(brew --prefix)opt/postgresql@10/include"
  export PKG_CONFIG_PATH="$(brew --prefix)/opt/postgresql@10/lib/pkgconfig"
fi

# nice bash completion
if is_osx && [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export AWS_PROFILE="default"
export HISTCONTROL=ignoredups;
export HISTSIZE=10000;
shopt -s histappend histverify;

# Ansible
export ANSIBLE_VAULT_PASSWORD_FILE="/Users/rsanheim/src/simpledotorg/deployment/.vault_password"

if [ -f "/usr/local/bin/code-insiders" ] ; then
  export EDITOR="code-insiders --wait"
else
  export EDITOR="code --wait"
fi

export GIT_EDITOR="vim"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# NVM setup
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
