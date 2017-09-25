# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# ============================================================================ #
# will's osx stuff
# ---------------------------------------------------------------------------- #
# edit this file and source on exit.
alias osx='vim $DOTFILES/source/50_osx.sh && src'

# allow character repeats by holding down key
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

# env variables for Git or GitHub
export HOMEBREW_GITHUB_API_TOKEN="$(cat ~/.homebrew/HOMEBREW_GITHUB_API_TOKEN)"

# source bash completion script
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# application aliases
alias showDotfiles='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
alias hideDotfiles='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias notify='terminal-notifier -message'
alias copy='pbcopy'

# wireless hardware toggling
alias bt='toggle_bluetooth'
alias tb='toggle_bluetooth'
alias br='toggle_bluetooth && sleep 3 && toggle_bluetooth'
alias wt='toggle_wifi'
alias tw='toggle_wifi'
alias wr='toggle_wifi && ( sleep 3 && toggle_wifi && terminal-notifier -message "WIRELESS RESET" ) & 2>/dev/null || ( terminal-notifier -message "WIRELESS RESET FAILED" )'

# alias for MAC address spoofing script
# TODO: run spoof-mac's install/setup python script in /init
alias spoof='wt && echo "spoofing MAC address, need to enter root pass" && sudo spoof-mac randomize en0'
