# Source tmuxinator for completion
source ~/.tmuxinator-completion

alias t=tmuxinator

# tmux-mouse-toggle
# via http://qiita.com/kawaz/items/7b15e18ca8e072c1dc57

# if [[ -n $TMUX ]]; then
#   if [[ -z "$(tmux show-options -gw mode-mouse | grep off)" ]]; then
#     tmux set-option -gq mouse-utf8 off
#     tmux set-option -gq mouse-resize-pane off
#     tmux set-option -gq mouse-select-pane off
#     tmux set-option -gq mouse-select-window off
#     tmux set-window-option -gq mode-mouse off
#     tmux display-message "Mouse: OFF"
#   else
#     tmux set-option -gq mouse-utf8 on
#     tmux set-option -gq mouse-resize-pane on
#     tmux set-option -gq mouse-select-pane on
#     tmux set-option -gq mouse-select-window on
#     tmux set-window-option -gq mode-mouse on
#     tmux display-message "Mouse: ON"
#   fi
#   exit 0
# else
#   echo "not tmux session"
#   exit 1
# fi
