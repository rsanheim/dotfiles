if command_exists hub ; then
  alias git=hub
fi

alias h="history"
alias be="bundle exec"
alias bi="bundle install"
alias rdm="bundle exec rake db:migrate"
alias rdt="bin/rake db:migrate db:test:prepare"
alias mix="cd ~/src/rsanheim/mixcatcher-v1"
alias dotfiles="cd ~/src/rsanheim/dotfiles"

alias m="cd ~/src/monograph/monograph/"
alias mb="cd ~/src/monograph/monograph/apps/api"
alias mf="cd ~/src/monograph/monograph/apps/web"

alias mart="cd ~/src/monograph/monograph-art/"
alias mbart="cd ~/src/monograph/monograph-art/apps/api"
alias mfart="cd ~/src/monograph/monograph-art/apps/web"

# alias m="cd ~/src/monograph/monograph-dashboard"
# alias mg="cd ~/src/monograph/monograph-dashboard"
# alias mgs="cd ~/src/monograph/mg-schematic"

alias console="script/console"
alias sc="script/console"
alias sd="script/dev"
alias ss="script/server"

# just make life easier
alias "edit-bash-profile"='code $DOTFILES_HOME/'
alias "reload-bash-profile"=". ~/.bash_profile"
alias "preflight"="~/src/rsanheim/preflight/preflight.rb"

# Rosetta things
alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias ibash="arch -x86_64 /bin/bash --login"

# rails stuff
alias beg="bin/bundle exec guard"

alias use_gcc="export CC=/usr/bin/gcc && export CXX=/usr/bin/g++ && export LD=/usr/bin/gcc"

alias clean-squashed-branches='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

alias clean-squashed-branches-main='git checkout -q main && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base main $branch) && [[ $(git cherry main $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'