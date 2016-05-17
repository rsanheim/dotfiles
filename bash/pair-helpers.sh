alias pair='echo "Committing as: `git config user.name` <`git config user.email`>"'
alias unpair="git config --remove-section user 2> /dev/null; echo Unpaired.; pair"

alias pair-rewinfrey="git config user.pair 'RS+RW' && git config user.name 'Rob Sanheim and Rick Winfrey' && git config user.email 'rsanheim@gmail.com'; pair"
