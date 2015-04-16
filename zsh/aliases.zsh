alias less='less -R' # Colors
alias so='source ~/.zshrc'
alias cp='cp -v'
alias mv='mv -v'
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias alert='terminal-notifier -title "Command finished" -message "Your command has finished running"'
alias background_job_mode='setopt NO_HUP; setopt NO_CHECK_JOBS'
logs_by_type() {
  ls $* | sed 's/\..*//' | uniq
}

termlight(){
  export termvarient=light
  source ~/.zshrc
}
termdark(){
  export termvarient=dark
  source ~/.zshrc
}
