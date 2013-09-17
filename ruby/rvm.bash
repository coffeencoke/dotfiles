export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# IMPORTANT: Load RVM into a shell session *as a function*
#            Otherwise things like switching gemsets won't work.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
