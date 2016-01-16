#Usefull abbreviations
alias d='/bin/df -h'
alias la='/bin/ls -laFh --color=auto'
alias grgattr='/usr/bin/sudo /usr/bin/getfattr -n user.pax.flags'
alias grsattr='/usr/bin/sudo /usr/bin/setfattr -n user.pax.flags -v' # <exempt> <binary>

alias cal='LC_ALL="de_DE.UTF-8" /usr/bin/cal'
alias wine='LIBGL_DRIVERS_PATH=/usr/lib32/xorg/modules/dri /usr/bin/wine'
alias gdb='/usr/bin/gdb -q'
alias rdesktop='/usr/bin/rdesktop -g1280x800 -K'
alias n='/usr/bin/newsbeuter'
alias fuck='/usr/bin/sudo `history -p "!!"`'
alias youtube-dl='/bin/youtube-dl --no-call-home'

alias excuse='/bin/telnet towel.blinkenlights.nl 666'
alias decide='/bin/ls -A | /bin/head -n $(($RANDOM % $(/bin/ls -A | /bin/wc -l))) | /bin/tail -1'

alias vnetdn='/usr/bin/sudo /usr/bin/virsh domif-setlink wxp 52:54:00:2b:6d:b6 down'
alias vnetup='/usr/bin/sudo /usr/bin/virsh domif-setlink wxp 52:54:00:2b:6d:b6 up'

alias starbound='(cd ~/.local/share/Steam/SteamApps/common/Starbound/linux64/; ./launch_starbound.sh) &>/dev/null &'
