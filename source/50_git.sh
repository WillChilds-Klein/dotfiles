# aliases etc. for Git

alias gstat="git status"
alias gdiff="git diff"
alias gcom="git commit -am"
alias gpush="git push"

function gcomp() {
    echo "USAGE: $ gcomp [\"commit message\"] [repo1] [repo2] ... "

    local msg="$1"
    if [ "$#" -eq "0" ] || [ "$1" == *\"*\"* ]; then
        echo "no message specified, using default commit message"
        local msg="[auto-generated commit msg from $HOSTNAME]"
    else
        shift 1
    fi

    git add --all &&
    git commit -m "$msg" &&

    for repo in "$@"; do
        git push "$repo"; status
    done
}
