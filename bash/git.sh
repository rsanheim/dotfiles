# Thanks to Geoffrey's peepcode for many of these
alias g='git '
alias gst='git status'
alias gap='git add --patch'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcap='git commit -v -a && git push'
alias gpp='git pull; git push'

# From: http://www.commandlinefu.com/commands/view/2345/show-git-branches-by-date-useful-for-showing-active-branches
alias "git-recent-branches"='for k in `git branch|perl -pe s/^..//`;do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r'
alias "git-recent-branches-remote"='for k in `git branch -r|head 10|perl -pe s/^..//`;do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r'
alias grb="git-recent-branches"

# Throw a timestamp in README.markdown and commit and push
alias random_commit="echo `date` >> README.markdown \
  && git ci -am 'random commit' \
  && git push"

alias "clean-local-branches"="git branch --merged master | grep -v 'master$' | xargs git branch -d"
alias "git-sync"="git co master && git pull && clean-local-branches"

# copy current branch to clipboard
alias "copy-current-branch"="git branch | grep '^\*' | cut -d' ' -f2 | pbcopy"
