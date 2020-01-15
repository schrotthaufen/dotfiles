# color shell prompt red if connected via ssh
if [ -n "${SSH_CLIENT+x}" ]; then
	export PS1='[\u@\e[1;31m\]\h\e[0m\] \W]\$ '
else
	export PS1='[\u@\h \W]\$ '
fi

# fzf completion & key-bindings
if [ -f /usr/share/fzf/key-bindings.bash ]; then
	source /usr/share/fzf/key-bindings.bash
fi
if [ -f /usr/share/fzf/completion.bash ]; then
	source /usr/share/fzf/completion.bash
fi

# include aliases
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# only start tmux if we are interactive, and on a pseudo terminal
if [[ ${-} == *i* ]]; then
	if [[ $(tty) == *pts* ]]; then
		# don't nest tmux
		if [[ ${TERM} != screen* ]]; then
			tmux -2 -u attach || tmux -u -2 && exit $?
#			exit $?
		fi
	fi
fi
