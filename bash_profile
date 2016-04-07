shopt -s histappend
shopt -s dotglob
umask 077
export EDITOR="vim"
export LC_COLLATE="C"
export LANG="en_US.UTF-8"
export PATH="${PATH}:${HOME}/projects/shell-scripts/run"
export LESS="-iJ"
#export GTK2_RC_FILES="${HOME}/.kde4/share/config/gtkrc"
export QT_QPA_PLATFORMTHEME="qt5ct"
export HISTSIZE="25000"
export HISTCONTROL=ignoredups
#export PROMPT_COMMAND="history -n; history -w; history -c; history -r" #; ${PROMPT_COMMAND}"
export _JAVA_AWT_WM_NONREPARENTING=1
unset G_BROKEN_FILENAMES
unset LD_PRELOAD
unset LD_LIBRARY_PATH
export NMAP_PRIVILEGED

complete -cf sudo
complete -cf torify
complete -cf man
complete -cf apropos
complete -cf proxychains

[[ -f ~/.bashrc ]] && . ~/.bashrc
