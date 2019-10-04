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
alias pe="cd ~/src/boldpenguin/partner-engine"
alias ce="cd ~/src/boldpenguin/carrier-engine"

# just make life easier
alias "edit-bash-profile"="vim $DOTFILES_HOME/.bash_profile"
alias "reload-bash-profile"=". ~/.bash_profile"
alias "preflight"="~/src/rsanheim/preflight/preflight.rb"

# rails stuff
alias sb="script/bootstrap"
alias sc="script/console"
alias ss="script/server"
alias beg="bin/bundle exec guard"

alias use_gcc="export CC=/usr/bin/gcc && export CXX=/usr/bin/g++ && export LD=/usr/bin/gcc"
