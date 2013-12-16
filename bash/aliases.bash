# enable color support of ls if it seems available
export GREP_COLOR=33
USE_COLOR_CMDS=""
if [ -x /usr/bin/dircolors ]; then
  USE_COLOR_CMDS="true"
  LS_CMD='ls --classify --color=auto'

  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
elif $(gls &> /dev/null); then
  USE_COLOR_CMDS="true"
  LS_CMD='gls --classify --color=auto'
else
  LS_CMD='ls'
fi

if [ ! -z "$USE_COLOR_CMDS" ]; then
  # Highlight search term in grep
  alias grep='grep --color=auto --line-number'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
unset USE_COLOR_CMDS
