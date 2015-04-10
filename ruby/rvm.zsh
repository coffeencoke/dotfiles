if [[ -d "$HOME/.rvm" ]]; then
  path+=($HOME/.rvm/bin) # Add RVM to PATH for scripting
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

