# aliases etc. for Git

alias gstat="git status"
alias gdiff="git diff"
alias gcom="git commit -am"
alias gpush="git push"

function gcomp() {
    echo "USAGE: $ gcomp [\"commit message\"] [repo1] [repo2] ... "

    local msg="$1"
    if [ "$#" -eq "0" ] || [[ "$1" -ne *"\""* ]]; then
        # no message specified in first arg, use default
        echo "no message specified, using default commit message"
        local msg="[auto-generated commit msg from $HOSTNAME]"
    elif [[ "$1" == *" "* ]]; then
        # first arg is commit message, shift 1 to get arr repos
        shift 1
    fi

    git add --all &&
    git commit -m "$msg"

    if [ "$#" -eq "0" ]; then
        git push; status
    else
        for repo in "$@"; do
            git push "$repo"; status
        done
    fi
}
