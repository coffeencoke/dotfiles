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

alias ls="$LS_CMD"
alias ll="$LS_CMD -al"
alias la="$LS_CMD -A"
alias l="$LS_CMD -lahrtc"

# Syntax highlighting for less (-R for RAW ^ colors)
alias less='less -R'

alias path='echo $PATH'

alias so='source ~/.bashrc'

# Verbosely show progress for move and copy
alias cp='cp -v'
alias mv='mv -v'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias alert='terminal-notifier -title "Command finished" -message "Your command has finished running" -sender com.apple.Terminal'

# Fully update operating system
if [ -f /etc/debian_version ]; then
  alias update_system="sudo bash -c 'apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get -y autoremove'"
elif [ -f /etc/redhat-release ]; then
  alias update_system="sudo bash -c 'yum -y update'"
elif [ $(uname -s) = "Darwin" ]; then
  alias update_system="brew update && brew upgrade"
fi

# Simulate OSX's pbcopy and pbpaste on other platforms
if [ ! $(uname -s) = "Darwin" ]; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi
