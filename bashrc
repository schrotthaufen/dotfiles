# color shell prompt red if connected via ssh
if [ -n "${SSH_CLIENT+x}" ]; then
	export PS1='[\u@\e[1;31m\]\h\e[0m\] \W]\$ '
else
	export PS1='[\u@\h \W]\$ '
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
