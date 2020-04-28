if command_exists hub ; then
  alias git=hub
fi

alias h="history"
alias be="bundle exec"
alias bi="bundle install"
alias rdm="bundle exec rake db:migrate"
alias rdt="bin/rake db:migrate db:test:prepare"
alias m="mvim ."
alias mix="cd ~/src/mixcatcher"
alias ss="cd ~/src/simpledotorg/simple-server"

# just make life easier
alias "edit-bash-profile"="code $DOTFILES_HOME/"
alias "reload-bash-profile"=". ~/.bash_profile"
alias "preflight"="~/src/rsanheim/preflight/preflight.rb"

# rails stuff
alias beg="bin/bundle exec guard"

alias use_gcc="export CC=/usr/bin/gcc && export CXX=/usr/bin/g++ && export LD=/usr/bin/gcc"
