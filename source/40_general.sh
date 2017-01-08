# general varibales, aliases, etc

# set vi editing mode for bash
set -o vi

# set directory location vars
export CODE=$HOME/work/code
export TOOLS=$CODE/tools
export SCRIPTS=$DOTFILES/bin
export GOPATH=$CODE/go

# print path env var in easy to read format
function ppath() {
    echo $PATH | sed 's/:/:\'$'\n/g'
}

# general env variables
export LOCALHOST="127.0.0.1"

# default application env variables
export VISUAL="vim"
export EDITOR="vim -e"
export PAGER="less"
export TERM="xterm-256color"

# source pythonrc
export PYTHONSTARTUP=$HOME/.pythonrc.py

# append to the Bash history file, rather than overwriting it
shopt -s histappend

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

# USAGE: $ bash_arr_contains target_elt src_arr
# SOURCE: http://stackoverflow.com/a/8574392/4377800
function bash_arr_contains() {
    local e
    for e in "${@:2}"; do
        [[ "$e" == "$1" ]] && return 0
    done

    return 1
}

function abs_filename() {
  # $1 : relative filename
    echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}
