if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Make sure homebrew's node@10 formula is in the path
export PATH="/usr/local/opt/node@10/bin:$PATH"

shopt -s globstar
