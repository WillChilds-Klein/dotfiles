# ---------------------------------------------------------------------------- #
# general tool application aliases
# ---------------------------------------------------------------------------- #
alias g='grep --color'
alias p='ping 8.8.8.8'
alias ='clear'

function netinfo() {
    local esc=$(printf '\033')
    local red="${esc}[31m"
    local green="${esc}[32m"
    local blue="${esc}[34m"
    local none="${esc}[0m"

    local host=$(hostname)
    local public=$(bash -c "curl -s orga.cat/ip" | tr -d '\r')
    local private=$(ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $2}' | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sed "s/.*/${red}&${none}\,/" | xargs)

    printf "Host: [${blue}${host}${none}]\n"
    printf "Public IP: [${green}${public}${none}]\n"
    printf "Private IP: [${private%?}]\n"
}

# ensure tpm is there
if ! [[ -d ~/.tmux/plugins/tpm ]]; then 
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "tpm repo cloned, hit <prefix>r then <prefix>I to install plugins!"
fi

# cd and list
#function cdl () {
    #cd $1 && tree --dirsfirst -aLpughDFiC 1
#}

# pretty json
alias pretty-json="jq ."

# show open ports
alias ports='lsof -i -P | grep -i "listen"'

# vim-hackernews
alias hn='vim +HackerNews'

# alias to correct previous (mistaken) command
alias fuck='eval $(thefuck $(fc -ln -1))'

# alias for grepping through all files in current dir
alias lgrep='ls -al | grep -i'

#  src: http://unix.stackexchange.com/a/17308
highlight () {
    perl -pe "s/$1/\e[1;31;43m$&\e[0m/g"
}

# alias for accessing libs section of man, including C libs
function manc () {
    man 2 $1 || man 3 $1 || echo "no man page for $1 found in sections 2,3";
}

# easy search for switch in man
function mansw () { 
    man $1 | less -p "^ +$2";
}

# merge pdf's using ghostscript
function pdf-merge () {
    if [[ $# -lt 2 ]]; then
        echo "USAGE: $0 OUTPUT.pdf FILE1.pdf [FILE2.pdf ...]"
        return 1
    fi
    local out=$1

    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$1 $@
}

# .vimrc location
export VIMRC="~/.vimrc"


# print tmux colors
alias tmux-colors='for i in {0..255} ; do printf "\x1b[38;5;${i}mcolour${i}\n"; done'
# alias for launching tterm session
alias tmux-tterm='tmux a -t tterm || tmux new -s tterm && tmux source-file ~/.tmux/tterm.conf'

# less options to be used always
export LESS='-asRi'
export LESSOPEN='|~/.lessfilter %s'
# ============================================================================ #



# ---------------------------------------------------------------------------- #
# FZF 
# ---------------------------------------------------------------------------- #
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# ============================================================================ #



# ---------------------------------------------------------------------------- #
# RVM
# ---------------------------------------------------------------------------- #
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# ============================================================================ #



# ---------------------------------------------------------------------------- #
# Digital Ocean
# ---------------------------------------------------------------------------- #
# function to set auth env vars
function digitalocean_set_env () {
    echo "setting env variables for DigitalOcean auth"
    export TOKEN="$(cat ~/.digitalocean/athena_access_token)"
    export SSH_KEY_NAME="$(cat ~/.digitalocean/ssh_key_name)"
    export NUM_INSTANCES=${1:-"3"}
    echo "done."
}
# ============================================================================ #




# ---------------------------------------------------------------------------- #
# Terminal Color Variables
# ---------------------------------------------------------------------------- #
# COLOR ESC NUMS
#30	Black
#31	Red
#32	Green
#33	Yellow
#34	Blue
#35	Magenta
#36	Cyan

TERM_ESC=$(printf '\033');
TERM_BLACK="${esc}[30m";
TERM_RED="${esc}[31m";
TERM_GREEN="${esc}[32m";
TERM_YELLOW="${esc}[33m";
TERM_BLUE="${esc}[34m";
TERM_MAGENTA="${esc}[35m";
TERM_CYAN="${esc}[36m";
TERM_NONE="${esc}[0m";
# ============================================================================ #



# ---------------------------------------------------------------------------- #
# Vagrant
# ---------------------------------------------------------------------------- #
alias vag-st='vagrant status'
alias vag-gs='vagrant global-status'

# add vagrant insecure private key to ssh agent if exists and not added.
if [[ `ssh-add -l` != *vagrant.d/insecure_private_key* && \
       -f ~/.vagrant.d/insecure_private_key ]]; then
    ssh-add ~/.vagrant.d/insecure_private_key
fi
# ============================================================================ #



# ---------------------------------------------------------------------------- #
# Docker
# ---------------------------------------------------------------------------- #
alias b2d='boot2docker'
alias b2denv='eval $(boot2docker shellinit)'
alias b2dunenv='unset  DOCKER_TLS_VERIFY && unset  DOCKER_HOST && unset  DOCKER_CERT_PATH'

export DOCKER_MACHINE_TOKEN="82c296e80efd35f74e84a8d06b02bb046666e2596d5199677304b0d152460d0e"
function dockm () {
    if [[ $1 = "switch" ]]; then
        docker-machine active $2 &&
        eval $(docker-machine env $2)
        return $?
    elif [[ $1 = "vars" ]]; then
        eval $(docker-machine env $2)
        return $?
    else
        docker-machine $@
        return $?
    fi
}
# ============================================================================ #k



is_osx || return $?

# ---------------------------------------------------------------------------- #
# AWS 
# ---------------------------------------------------------------------------- #
# add aws bin directory to PATH
export PATH=$PATH:/usr/local/aws/bin

# export env vars
export AWS_CONFIG_FILE=~/.aws/config
export AWS_DEFAULT_PROFILE=default
export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
#export AWS_DEFAULT_REGION=$(aws configure get region)

# set bash autocompletion
complete -C '/usr/local/bin/aws_completer' aws

# connect to zeus EC2 instance via ssh
alias zeus='ssh -i ~/.aws/athena-zeus.pem ubuntu@ec2-52-11-189-255.us-west-2.compute.amazonaws.com'
alias mzeus='mosh --ssh="ssh -i ~/.aws/athena-zeus.pem" ubuntu@ec2-52-11-189-255.us-west-2.compute.amazonaws.com'
# ============================================================================ #
