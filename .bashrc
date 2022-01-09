# On NetBSD, this file should be named .bash_profile

PS1="[\u@\h \t \j \[\e[1;32m\]\w\[\e[0m\]]\n\$ "
# Source global definitions
export EDITOR=vim
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

alias lc="ls -C | less"
alias ll="ls -lh"

function mkd() {
    if [[ $#  == 0 ]] ; then 
        return
    fi
    
    mkdir "$1"
    cd "$1"
}

function psgrep() {                                                                                                                                                                      
        ps axuf | grep -v grep | grep "$@" -i --color=auto;                                                                                                                                  
}

alias rpmdate="date +\"%a %b %d %Y\""
PS1="\u@\h \t \j \[\e[1;32m\]\w\[\e[0m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n\$ "
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
