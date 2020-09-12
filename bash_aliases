alias d='/bin/df -h'
alias la='/bin/ls -laFhN --color=auto'
alias cat='/usr/bin/cat -v'
alias cal='LC_ALL="de_DE.UTF-8" /usr/bin/cal'
alias gdb='/usr/bin/gdb -q'
alias n='/usr/bin/newsboat'
#alias fuck='/usr/bin/sudo `history -p "!!"`'
alias excuse='echo | /usr/bin/nc towel.blinkenlights.nl 666'
alias decide='/bin/ls -A | /bin/head -n $(($RANDOM % $(/bin/ls -A | /bin/wc -l))) | /bin/tail -1'
alias up='aur sync -u -c -d custom -M /etc/makepkg.conf && sudo pacman -Syu && sudo pacdiff && sudo find /var/cache/pacman/ -name \*.pkg.tar\* -type f -delete && sudo localepurge'
alias dig='/usr/bin/drill'
alias mount.ios='ifuse --documents $(ideviceinstaller -l | fzf | cut -d , -f1)'

function f () {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING;
    export TF_SHELL=bash;
    export TF_ALIAS=fuck;
    export TF_SHELL_ALIASES=$(alias);
    export TF_HISTORY=$(fc -ln -10);
    export PYTHONIOENCODING=utf-8;
    TF_CMD=$(
        thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@"
    ) && eval "$TF_CMD";
    unset TF_HISTORY;
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
    history -s $TF_CMD;
}
