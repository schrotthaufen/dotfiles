#Usefull abbreviations
alias d='/bin/df -h'
alias la='/bin/ls -laFh --color=auto'

alias cal='LC_ALL="de_DE.UTF-8" /usr/bin/cal'
alias wine='LIBGL_DRIVERS_PATH=/usr/lib32/xorg/modules/dri /usr/bin/wine'
alias gdb='/usr/bin/gdb -q'
alias rdesktop='/usr/bin/rdesktop -g1280x800 -K'
alias n='/usr/bin/newsbeuter'

alias vnetdn='/usr/bin/sudo /usr/bin/virsh domif-setlink wxp 52:54:00:2b:6d:b6 down'
alias vnetup='/usr/bin/sudo /usr/bin/virsh domif-setlink wxp 52:54:00:2b:6d:b6 up'

alias starbound='(cd ~/.local/share/Steam/SteamApps/common/Starbound/linux64/; ./launch_starbound.sh) &>/dev/null &'
