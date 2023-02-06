shopt -s histappend
shopt -s dotglob
umask 077
export EDITOR="vim"
export LC_COLLATE="en_US.UTF-8"
#export LC_COLLATE="C"
export LC_MESSAGES="C.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_TIME="de_DE.UTF-8"
export PATH="${PATH}:${HOME}/projects/shell-scripts/run:${HOME}/node_modules/h265ize"
export LESS="-iJR"
export QT_QPA_PLATFORMTHEME="qt5ct"
export HISTSIZE="25000"
export HISTCONTROL=ignoredups
export _JAVA_AWT_WM_NONREPARENTING=1
unset G_BROKEN_FILENAMES
export NMAP_PRIVILEGED=1
export ZELLIJ_AUTO_EXIT=true
export ZELLIJ_AUTO_ATTACH=true

[[ -f ~/.dircolors ]] && eval $(dircolors ~/.dircolors)

# include aliases
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# fzf completion & key-bindings
if [ -f /usr/share/fzf/key-bindings.bash ]; then
	source /usr/share/fzf/key-bindings.bash
fi
if [ -f /usr/share/fzf/completion.bash ]; then
	source /usr/share/fzf/completion.bash
fi

if [[ -z "$ZELLIJ" ]]; then
	[[ -f ~/.bashrc ]] && . ~/.bashrc
	if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
		zellij attach -c
	else
		zellij
	fi

	if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
		exit
	fi
fi
