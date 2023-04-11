username() {
   echo "%{$FG[012]%}%n@$HOST%{$reset_color%}"
}

directory() {
   #show full path
   #echo "%{$fg[green]%}%~%{$reset_color%}"
   #show path wiht dept 2
   echo "%{$fg[green]%}%2~%{$reset_color%}"
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

#If the current directory is a git repo, show git information
git_info(){
   if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) ]];then
     echo "-[%B$(git_repo_name):$(git_prompt_info)$(git_prompt_status)%b]"
   fi
}

# set the git_prompt_info text
#ZSH_THEME_GIT_PROMPT_PREFIX="("
#ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} \u25cf%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} \u2708"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
#ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
#ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[white]%} ✱"

# putting it all together
PROMPT='[%B$(username)%b]-[%B$(directory)%b]$(git_info)
$(prompt_indicator)'
RPROMPT='$(return_status)[$(current_time)]'
