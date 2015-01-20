# Load dotfiles
for dotfile in $HOME/.{profile,bashrc,bash_prompt}; do
        [[ -er "$dotfile" ]] && source "$dotfile"
done
unset dotfile

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
