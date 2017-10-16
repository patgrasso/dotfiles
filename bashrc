
monitor-left ()
{
    xrandr --output LVDS-0 --mode 1600x900 --pos 1920x180 --panning 0x0+1920+180 --primary
    xrandr --output VGA-0 --mode 1920x1080 --panning 1920x1080
    gsettings set org.gnome.desktop.background picture-options zoom
}

monitor-right ()
{
    xrandr --output LVDS-0 --mode 1600x900 --pos 0x180 --primary
    xrandr --output VGA-0 --mode 1920x1080 --pos 1600x0
    gsettings set org.gnome.desktop.background picture-options zoom
}

nodeserv ()
{
    if [ -z "$2" ] ; then
        echo "Usage: nodeserv <script.js> <logfile>"
    else
        FILE=$1
        if [ ! -f "$FILE" ] ; then
            echo "File $FILE not found"
        else
            nohup node $1 > $2 2>&1 &
        fi
    fi
}

termtitle () {
    if [ -z "$1" ]; then
        echo "Please provide a name for the terminal"
    else
        echo -ne "\033]0;$@\007"
    fi
}

__background_procs() {
    if [ `jobs | wc -l` != "0" ]; then
        echo -e "[\xE2\x9A\x99 `jobs | wc -l`] "
    fi
}

myip() {
    local MYIP
    local STAT
    MYIP=`curl -sS wtfismyip.com/text 2>&1`
    STAT=$?
    if [ $STAT == '0' ]; then
        echo "$MYIP"
    elif [ $STAT == '6' ]; then
        echo "Not connected to the internet"
    else
        echo "Curl Error: $MYIP"
    fi
}

push-ip-to-ll() {
    local port = "8000"

    if [ -z "$1" ]; then
        port = "8000";
    else
        port = "$1";
    fi
    echo $port

    curl -sS wtfismyip.com/text |
    sed "s/$/$port/" |
    ssh linux-lab "cat > ~/proxy/host.addr"
}

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -al'

# Spacemacs should open in the terminal, by default
alias gmacs='/usr/local/bin/emacs'
alias emacs='/usr/local/bin/emacs -nw'

cmacs() {
    emacsclient -t
    if [ $? == 1 ]; then
        emacs --daemon
        emacsclient -t
    fi
}
#alias cmacs='emacsclient -t'

alias gopen='gnome-open'
alias py='python3'
alias serve='python -m SimpleHTTPServer'


# terminal.sexy - birds of paradise
# http://terminal.sexy/#RS4u5uHEHxYRzEIyFEIS76wyLzOriFbSfa-cTk5ORS4uzHYujP-M2ddiV5iuvjJQk8G85uHE


export PS1_STATUS='\[\033[0;31m\]$(__background_procs "(%s)")'
export PS1_USER_WORKSPACE='\[\033[0;33m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]'
export PS1_GIT='$(__git_ps1 " (%s)")\[\033[01;34m\] \$\[\033[00m\] '
export PS1="$PS1_STATUS$PS1_USER_WORKSPACE$PS1_GIT"


export PATH="$PATH:$HOME/bin"
export TERM="xterm-256color"

export NLTK_DATA="/home/$USER/work/machine-learning/nltk_data"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export LESSOPEN="| /usr/bin/lesspipe %s"
export LESSCLOSE="/usr/bin/lesspipe %s %s"

# NACL
export NACL_SDK_ROOT="/home/pgrasso/build-repos/nacl_sdk/sdk_root/"
