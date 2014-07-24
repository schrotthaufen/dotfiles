shopt -s histappend
shopt -s dotglob
umask 077
export EDITOR="vim"
export LC_COLLATE="C"
export LANG="en_US.UTF-8"
export PATH="${PATH}:${HOME}/projects/shell-scripts/run"
export LESS="-iJ"
export GTK2_RC_FILES="${HOME}/.kde4/share/config/gtkrc"
export HISTSIZE="10000"
export HISTCONTROL=ignoredups
export HISTIGNORE="df*:free*"
export PROMPT_COMMAND="history -a" #; ${PROMPT_COMMAND}"
unset G_BROKEN_FILENAMES

[[ -f ~/.bashrc ]] && . ~/.bashrc
