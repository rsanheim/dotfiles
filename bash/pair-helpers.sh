alias pair='echo "Committing as: `git config user.name` <`git config user.email`>"'
alias unpair="git config --remove-section user 2> /dev/null; echo Unpaired.; pair"
