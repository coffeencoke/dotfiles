export PROJECT_DIR="~/Projects/"
function c { cd ~/$PROJECT_DIR/$1; }

alias personal_mode="export GEM_HOME=~/.gems; export GEM_PATH=~/.gems; export PATH=~/.gems/bin:$PATH"
alias work_mode="unset GEM_HOME; unset GEM_PATH;"
