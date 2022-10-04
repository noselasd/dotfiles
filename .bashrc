# On NetBSD, this file should be named .bash_profile

# Source global definitions
export EDITOR=vim
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

alias lc="ls -C | less"
alias ll="ls -lh"
alias g=git

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
 # set terminal window title
function title() {
    print -Pn "\e]2;$@\a"
}
export PATH=~/bin:~/go/bin:/usr/local/go/bin:$PATH
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


PS1="\e[48;5;20m\u@\h \t \j \e[48;5;22m \w \e[0m\e[38;5;202m\$(parse_git_branch)\e[0m\n$ "
