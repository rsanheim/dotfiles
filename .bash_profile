if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

eval "$(rbenv init -)"
export PATH="/usr/local/opt/node@10/bin:$PATH"
