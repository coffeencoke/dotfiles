source ~/.bash/aliases
source ~/.bash/functions
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/history_config
source ~/.bash/git_bash_prompt

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Enable RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
