if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.bashrc.m1 ]; then
   source ~/.bashrc.m1
fi

shopt -s globstar
export PATH="/opt/homebrew/opt/postgresql@10/bin:$PATH"
