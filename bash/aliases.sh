alias h="history"
alias be="bundle exec"
alias bi="bundle install"
alias l="lsd -al --group-directories-first"
alias ll="lsd -al --group-directories-first"
alias rdm="bundle exec rake db:migrate"
alias rdt="bin/rake db:migrate db:test:prepare"
alias mix="cd ~/src/rsanheim/mixcatcher-v1"
alias dotfiles="cd ~/src/rsanheim/dotfiles"

alias mg="echo mg starts micro emacs on Mac, and it can't be removed. Life is pain. I'm sorry"

alias console="script/console"
alias sc="script/console"
alias sd="script/dev"
alias sl="script/lint"
alias ss="script/server"
alias st="script/test"

# Easy access to `ci open` and such
# https://github.com/CircleCI-Public/circleci-cli
alias ci="circleci"

alias start-mysql8="/opt/homebrew/opt/mysql@8.0/bin/mysqld_safe --datadir\=/opt/homebrew/var/mysql"
alias cd-mysql="cd /opt/homebrew/opt/mysql@8.0"

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

alias clean-squashed-branches-master='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'

alias clean-squashed-branches='git checkout -q main && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base main $branch) && [[ $(git cherry main $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
