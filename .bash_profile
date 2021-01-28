if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

eval "$(rbenv init -)"
# Make sure homebrew's node@10 formula is in the path
# export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH="/usr/local/opt/elasticsearch@1.7/bin:$PATH"

shopt -s globstar
