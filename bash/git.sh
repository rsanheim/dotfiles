# Thanks to Geoffrey's peepcode for many of these
alias g='git '
alias gst='git status'
alias gap='git add --patch'
alias gs='git status'
alias gl='git pull'
alias gp='git push -u --no-verify'
alias gpv='git push -u'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcap='git commit -v -a && git push'
alias gpp='git pull --prune; git push'
alias gpr='git-pr -p'
alias gup='gpp && clean-squashed-branches'
alias git-prune="git pull --prune && clean-local-branches"

# From: http://www.commandlinefu.com/commands/view/2345/show-git-branches-by-date-useful-for-showing-active-branches
alias git-recent-branches="git for-each-ref --count=20 --sort=-committerdate refs/heads --format='%(authordate:short) %(color:red)%(objectname:short) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset)) %(authorname)'"
alias grb="git-recent-branches"

alias git-recent-branches-remote="git for-each-ref --count=20 --sort=-committerdate refs/heads refs/remotes --format='%(authordate:short) %(color:red)%(objectname:short) %(color:yellow)%(refname:short)%(color:reset) (%(color:green)%(committerdate:relative)%(color:reset)) %(authorname)'"
alias grrb="git-recent-branches-remote"

# Throw a timestamp in README.markdown and commit and push
alias random_commit="echo $(date) >> README.markdown \
  && git ci -am 'random commit' \
  && git push"

function clean-local-branches {
  target=$(git branch -l main master --format '%(refname:short)')
  git branch --merged "$target" | grep -v "$target$" | xargs git branch -d
}

alias "git-sync"="git co main && git pull && clean-local-branches"
alias "github-sync"="git-sync && rdt && git checkout db/structure.sql"

# copy current branch to clipboard
alias "copy-current-branch"="git branch | grep '^\*' | cut -d' ' -f2 | pbcopy"
