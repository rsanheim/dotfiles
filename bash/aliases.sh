alias git=hub

alias be="bundle exec"
alias bi="bundle install"
alias rdm="bundle exec rake db:migrate"
alias rdt="bin/rake db:migrate db:test:prepare"
alias m="mvim ."
alias gh="cd ~/github/github"
alias mix="cd ~/src/mixcatcher"

# just make life easier
alias "edit-bash-profile"="vim /Users/rsanheim/src/dotfiles/.bash_profile"
alias "reload-bash-profile"=". ~/.bash_profile"

# rails and github stuff
alias sb="script/bootstrap"
alias sc="script/console"
alias ss="script/server"
alias t="bin/testrb_or_zt"
alias z="GH_ZEUS=1 bin/zeus"
alias pr="script/git-pr --push"
alias beg="bin/bundle exec guard"
alias pr="script/git-pr --push"

alias use_gcc="export CC=/usr/bin/gcc && export CXX=/usr/bin/g++ && export LD=/usr/bin/gcc"
alias "count-github-test-code"="sloccount test/models test/integration test/controllers test/jobs test/lib test/mailers test/view_models"
