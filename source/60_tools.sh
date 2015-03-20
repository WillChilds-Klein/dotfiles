# --------------------------------------------------------------------------- #
# general tool application aliases
# --------------------------------------------------------------------------- #
alias grep='grep --color'
alias p='ping 8.8.8.8'
alias ='clear'

function ip() {
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

# vim-hackernews
alias hn='vim +HackerNews'

# print tmux colors
alias tmux-colors='for i in {0..255} ; do printf "\x1b[38;5;${i}mcolour${i}\n"; done'

# less
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
# =========================================================================== #



# --------------------------------------------------------------------------- #
# FZF 
# --------------------------------------------------------------------------- #
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# =========================================================================== #



# --------------------------------------------------------------------------- #
# AWS 
# --------------------------------------------------------------------------- #
# add aws bin directory to PATH
export PATH=$PATH:/usr/local/aws/bin

# export env vars
export AWS_CONFIG_FILE=~/.aws/config
export AWS_DEFAULT_PROFILE=default
#export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
#export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
#export AWS_DEFAULT_REGION=$(aws configure get region)

# set bash autocompletion
complete -C '/usr/local/bin/aws_completer' aws

# connect to zeus EC2 instance via ssh
alias zeus='ssh -i ~/.aws/athena-zeus.pem ubuntu@ec2-52-11-189-255.us-west-2.compute.amazonaws.com'
# =========================================================================== #



# --------------------------------------------------------------------------- #
# Vagrant
# --------------------------------------------------------------------------- #
alias vag-st='vagrant global-status'

function vagrant_ids() {
    if [[ $# -gt 0 ]]; then
        echo "USAGE: vagrant_ids [-l]";
        return 1;
    fi
    $(which -s vagrant) || { echo "Vagrant is not installed!"; return 1; }

    local id_str
    idstr=$(vagrant global-status | cut -f1 -s -d ' ' | grep -e '[a-f0-9]\{7\}' | xargs)

    if [[ ${#idstr} -eq 0 ]]; then
        return 1;
    else
        echo ${idstr};
    fi
}

function vagrant_destroyall() {
    id_list=( $(vagrant_ids) )

    if [[ ${#id_list[@]} -eq 0 ]]; then
        echo "No active vagrant environments!"
        return 1;
    fi

    for vagrant_id in ${id_list[@]}; do
       vagrant destroy -f ${vagrant_id};
    done
}

function vagrant_haltall() {
    id_list=( $(vagrant_ids) )

    if [[ ${#id_list[@]} -eq 0 ]]; then
        echo "No active vagrant environments!"
        return 1;
    fi

    for vagrant_id in ${id_list[@]}; do
       vagrant halt ${vagrant_id};
       status;
    done
}
# =========================================================================== #
