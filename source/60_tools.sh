# ---------------------------------------------------------------------------- #
# general tool application aliases
# ---------------------------------------------------------------------------- #
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

# ensure tpm is there
if ! [[ -d ~/.tmux/plugins/tpm ]]; then 
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "tpm repo cloned, hit <prefix>r then <prefix>I to install plugins!"
fi

# vim-hackernews
alias hn='vim +HackerNews'

# .vimrc location
export VIMRC="~/.vimrc"

# print tmux colors
alias tmux-colors='for i in {0..255} ; do printf "\x1b[38;5;${i}mcolour${i}\n"; done'

# less
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
# ============================================================================ #



# ---------------------------------------------------------------------------- #
# FZF 
# ---------------------------------------------------------------------------- #
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# ============================================================================ #



# ---------------------------------------------------------------------------- #
# AWS 
# ---------------------------------------------------------------------------- #
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
alias mzeus='mosh --ssh="ssh -i ~/.aws/athena-zeus.pem" ubuntu@ec2-52-11-189-255.us-west-2.compute.amazonaws.com'
# ============================================================================ #



# ---------------------------------------------------------------------------- #
# Vagrant
# ---------------------------------------------------------------------------- #
alias vag-st='vagrant status'
alias vag-gs='vagrant global-status'

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
    local exceptions index id_list id_regex

    echo -e "========================== DESTROYING VAGRANT MACHINES ==========================\n"

    id_list=( $(vagrant_ids) )
    if [[ ${#id_list[@]} -eq 0 ]]; then
        echo "No active vagrant environments!"
        return 1;
    fi

    exceptions=( "$@" )
    id_regex="^[[:xdigit:]]{7}$"
    index=0
    for except in ${exceptions[@]}; do
        if ! [[ ${except} =~ ${id_regex} ]]; then
            echo "Found invalid Vagrant ID!"
            echo "Expected: Vagrant ID as 7-digit hex num. Given: ${except}."
            echo -e "Removing ${except} from list and proceeding...\n"
            unset exceptions[$index]
            exceptions=( ${exceptions[@]} )
        else
            let index++
        fi
    done

    echo "FOUND VAGRANT MACHINE IDS IN ENV: ${id_list[@]}"
    echo -e "MACHINES TO KEEP ALIVE: ${exceptions[@]}\n"

    for vagrant_id in ${id_list[@]}; do
        if bash_arr_contains ${vagrant_id} ${exceptions[@]} ; then
            echo "Sparing ${vagrant_id} from destruction. Live long and prosper, friend."
        else
            echo "Destroying ${vagrant_id}."
            if vagrant destroy -f ${vagrant_id} ; then
                echo "${vagrant_id} has been destroyed. May they rest in peace."
            else 
                echo "Agh! A zombie! Might have failed to destroy ${vagrant_id}."
            fi
        fi
        echo
    done;

    echo "====================================== Done ======================================"
}

function vagrant_haltall() {
    local exceptions index id_list id_regex

    echo -e "============================ HALTING VAGRANT MACHINES ===========================\n"

    id_list=( $(vagrant_ids) )
    if [[ ${#id_list[@]} -eq 0 ]]; then
        echo "No active vagrant environments!"
        return 1;
    fi

    exceptions=( "$@" )
    id_regex="^[[:xdigit:]]{7}$"
    index=0
    for except in ${exceptions[@]}; do
        if ! [[ ${except} =~ ${id_regex} ]]; then
            echo "Found invalid Vagrant ID!"
            echo "Expected: Vagrant ID as 7-digit hex num. Given: ${except}."
            echo -e "Removing ${except} from list and proceeding...\n"
            unset exceptions[$index]
            exceptions=( ${exceptions[@]} )
        else
            let index++
        fi
    done

    echo "FOUND VAGRANT MACHINE IDS IN ENV: ${id_list[@]}"
    echo -e "MACHINES TO KEEP RUNNING: ${exceptions[@]}\n"

    for vagrant_id in ${id_list[@]}; do
        if bash_arr_contains ${vagrant_id} ${exceptions[@]} ; then
            echo "Letting ${vagrant_id} stay up late. Still running."
        else
            echo "Ssshhh time to sleep little one. Halting ${vagrant_id}."
            if vagrant halt ${vagrant_id} ; then
                echo "Nighty night. ${vagrant_id} has halted."
            else 
                echo "Damn kids. ${vagrant_id} just won't go to bed, might still be running!"
            fi
        fi
        echo
    done;

    echo "====================================== Done ======================================"
}
# ============================================================================ #
