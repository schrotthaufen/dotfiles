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

# enable completion for sudo
complete -cf sudo
complete -cf torify

# don't start tmux if we aren't interactive
if [[ ${-} == *i* ]]; then
	# don't nest tmux
	if [[ ${TERM} != screen* ]]; then
		tmux -2 -u attach || tmux -u -2 && exit $?
#		exit $?
	fi
fi
