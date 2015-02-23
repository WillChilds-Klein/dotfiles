#!/bin/bash

# general varibales, aliases, etc

# set directory location vars
export CODE=$HOME/work/code
export TOOLS=$CODE/tools
export SCRIPTS=$DOTFILES/bin
export GOPATH=$CODE/go

# build PATH
export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH=$GOPATH/bin:$PATH

# add current directory to end of PATH to not override sys binaries
export PATH=$PATH:.

# general env variables
export LOCALHOST='127.0.0.1'

# default application env variables
export VISUAL=vim
export EDITOR='vim -e'
export PAGER=less

# application aliases
alias grep='grep --color'
alias p='ping 8.8.8.8'
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1'
alias ='clear'

# append to the Bash history file, rather than overwriting it
shopt -s histappend

# fuzzy bash completion, src: http://superuser.com/a/607338
# TODO: make this not suck. it doesn't currently work as expected.
# TODO: define formal behavior for fuzzy completion
fuzzy_cmds=(mv cp cd ls cat vim rm make open subl make)
complete -o nospace -o filenames -F fuzzypath "${fuzzy_cmds[@]}"
function fuzzypath() {
    if [ -z $2 ] 
    then
        COMPREPLY=( `ls` )
    else
        DIRPATH=`echo "$2" | gsed 's|[^/]*$||'`
        BASENAME=`echo "$2" | gsed 's|.*/||'`
        FILTER=`echo "$BASENAME" | gsed 's|.|\0.*|g'`
        COMPREPLY=( `ls $DIRPATH | grep -i "^$FILTER" | gsed "s|^|$DIRPATH|g"` )
    fi
}

# function to report exit status of previous command
function status() {
    local status=$?
    local red='\033[0;31m'
    local green='\033[0;32m'
    local none='\033[0m'
    local exit_status

    if [ "$status" -eq "0" ]; then
        exit_status=${green}OK${none};
    else
        exit_status=${red}FAIL${none};
    fi

    printf "EXIT STATUS: $exit_status\n"
}
