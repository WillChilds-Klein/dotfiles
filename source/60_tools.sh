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

alias activate='. ./.venv/bin/activate'
alias venv='virtualenv .venv && activate'

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

tx() {
    # if direnv is present, use it to execute tmux to avoid env variable mangling.
    which direnv &>/dev/null \
        && local direnv_prefix="direnv exec / tmux"
    local tmux=${direnv_prefix:-"tmux"}
    local cmd="${1}"
    case "$cmd" in
        a)
            $tmux attach -t "$2"
            ;;
        k)
            $tmux kill-session -t "$2"
            ;;
        n)
            $tmux new-session -s "$2"
            ;;
        ls)
            $tmux list-sessions
            ;;
        *)
            $tmux $cmd $@
            ;;
    esac
}

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


# ============================================================================ #
# Notes
# ============================================================================ #
function n () {
    local notes_dir='/Users/will/notes'
    local name="${1}"
    if [[ -z $name ]]; then
        echo "NOTES"
        echo "-----"
        local notes="$(ls ${notes_dir})"
        for note in $notes; do
            echo ${note} | cut -d'.' -f1
        done
        return
    fi
    vim "${notes_dir}/${name}.md"
}
# ============================================================================ #



is_osx || return $?

# ---------------------------------------------------------------------------- #
# AWS
# ---------------------------------------------------------------------------- #
# add aws bin directory to PATH
export PATH=$PATH:/usr/local/aws/bin

# set bash autocompletion
complete -C '/usr/local/bin/aws_completer' aws

# connect to zeus EC2 instance via ssh
alias zeus='ssh -i ~/.aws/athena-zeus.pem ubuntu@ec2-52-11-189-255.us-west-2.compute.amazonaws.com'
alias mzeus='mosh --ssh="ssh -i ~/.aws/athena-zeus.pem" ubuntu@ec2-52-11-189-255.us-west-2.compute.amazonaws.com'
# ============================================================================ #
