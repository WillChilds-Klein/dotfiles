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

# pretty json
alias pretty-json="jq ."

# vim-hackernews
alias hn='vim +HackerNews'

# easy search for switch in man
function mansw () { 
    man $1 | less -p "^ +$2"
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



# ---------------------------------------------------------------------------- #
# Vagrant
# ---------------------------------------------------------------------------- #
alias vag-st='vagrant status'
alias vag-gs='vagrant global-status'

# ============================================================================ #
