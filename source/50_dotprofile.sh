# Mac OS-X specific customizations

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# edit this file
alias profile='vim ~/.profile && source ~/.profile'

# allow character repeats by holding down key
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

# application aliases
alias showDotfiles='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
alias hideDotfiles='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias alert='terminal-notifier -message $1'

# comm hardware toggling
alias bt='$SCRIPTS_PATH/toggle_bluetooth.sh'
alias tb='bt'
alias br='bt && bt'
alias wt='$SCRIPTS_PATH/toggle_wifi.sh'
alias tw='wt'
alias wr='wt && wt'

# alias for MAC address spoofing script
alias spoof='wt && sudo spoof-mac.py randomize en0'

# filesystem nav
alias subl-pkgs='cd /Users/will/Library/Application\ Support/Sublime\ Text\ 3/Packages'
