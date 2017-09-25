# ---------------------------------------------------------------------------- #
# general tool application aliases
# ---------------------------------------------------------------------------- #
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

# show open ports
alias ports='lsof -i -P | grep -i "listen"'

# alias to correct previous (mistaken) command
alias fuck='eval $(thefuck $(fc -ln -1))'

# alias for grepping through all files in current dir
alias lgrep='ls -al | grep -i'

# venv aliases
alias activate='. ./.venv/bin/activate'
alias venv='virtualenv .venv && activate'

#  src: http://unix.stackexchange.com/a/17308
highlight () {
    perl -pe "s/$1/\e[1;31;43m$&\e[0m/g"
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

tx() {
    # if direnv is present, use it to execute tmux to avoid env variable mangling.
    which direnv &>/dev/null \
        && local direnv_prefix="direnv exec / tmux"
    local tmux=${direnv_prefix:-"tmux"}
    local cmd="${1}"; shift;
    case "$cmd" in
        a)
            $tmux attach -t "$1"
            ;;
        k)
            $tmux kill-session -t "$1"
            ;;
        n)
            $tmux new-session -s "$1"
            ;;
        ls)
            $tmux list-sessions
            ;;
        ks)
            $tmux kill-server
            ;;
        *)
            $tmux $cmd ${@}
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
