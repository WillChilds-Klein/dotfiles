# aliases etc. for Git

alias gstat="git status $@"
alias gdiff="git diff $@"
alias gcom="git commit -am $1"
alias gpush="git push $@"

function gcomp() {
    local msg="$1"
    if [ "$#" -eq "0" ]; then
        echo "no message specified, using default commit message"
        local msg="[auto-generated commit msg from $HOSTNAME]"
    fi

    git add --all &&
    git commit -m "'$msg'" &&
    if [ ! "$#" -eq "0" ]; then
        shift 1;
    fi

    git push $@ ; status
}