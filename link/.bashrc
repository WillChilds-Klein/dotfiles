# Where the magic happens.
export DOTFILES=~/.dotfiles

# Add binaries into the path
PATH=$PATH:$DOTFILES/bin
PATH=$PATH:/usr/local/sbin:/usr/local/bin
PATH=$PATH:$GOPATH/bin
export PATH

# Source all files in "source"
function src() {
  local file
  if [[ "$1" ]]; then
      source "$(find $DOTFILES/source/*_${1}.sh)"
  else
    for file in $DOTFILES/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
src
