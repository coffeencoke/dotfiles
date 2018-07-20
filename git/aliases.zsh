alias gst='git status'
alias gp='git push origin HEAD -u'
alias grc='git rebase --continue'
alias gad='git add .'
alias gc='git commit'
alias gd='git diff'
alias gdc='git diff --cached'
alias gg='git lg'
alias gpush='git push'
alias gpr='git pull --rebase'
alias gci='gcm'

function gcm { git commit -m "'$*'"; }
function git-recursive { find . -name .git -type d -execdir pwd \; -execdir git "$@" \; }
