export PROMPT_SHOW_USER_INFO=0
export PROMPT_DIRECTORY_DEPTH="2" # empty string for full path

username() {
   if [[ $PROMPT_SHOW_USER_INFO == 1 ]];then
      echo "[%B%{$FG[012]%}%n%f@%{$FG[012]%}$HOST%f%b]-"
   fi
}

directory() {
   echo "%{$fg[green]%}%$PROMPT_DIRECTORY_DEPTH~%{$reset_color%}"
}

current_time() {
   echo "%T"
}

return_status() {
   echo " %(?..%{$fg[red]%}✘%f|)"
}

prompt_indicator() {
   echo "%(?.%B%{$fg[green]%}\u276f%{$reset_color%}%b.%B%{$fg[red]%}\u276f%{$reset_color%}%b"
}

# If the current directory is a git repo, show git information
git_info(){
   if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]]; then
     echo "-[%B$(git_repo_name)%b:%B$(git_super_status)$b]"
   fi
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}%{?%G%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[blue]%}%{-%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg_bold[green]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=""

# putting it all together
PROMPT='$(username)[%B$(directory)%b]$(git_info)
$(prompt_indicator)'
RPROMPT='$(return_status)[$(current_time)]'
