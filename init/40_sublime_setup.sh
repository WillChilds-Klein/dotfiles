# only for OS X at the moment.
is_osx || return 1

# TODO: debug this shnizz

# sublime text 3 should be installed by homebrew cask

# link settings to proper directory
ln -s ~/.dotfiles/sublime/User/ ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
