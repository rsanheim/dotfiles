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
alias nb="cd ~/src/3dna/nbuild"

# just make life easier
alias "edit-bash-profile"="vim /Users/rsanheim/src/dotfiles/.bash_profile"
alias "reload-bash-profile"=". ~/.bash_profile"

# rails stuff
alias sb="script/bootstrap"
alias sc="script/console"
alias ss="script/server"
alias beg="bin/bundle exec guard"

alias use_gcc="export CC=/usr/bin/gcc && export CXX=/usr/bin/g++ && export LD=/usr/bin/gcc"

alias touchssl="find spec -path *ssl*.rb -exec touch {} \+"
