if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.bash 2>/dev/null || :
