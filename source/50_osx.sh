# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# enable bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# ============================================================================ #
# will's osx stuff
# ---------------------------------------------------------------------------- #
# edit this file and source on exit.
alias osx='vim $DOTFILES/source/50_osx.sh && src'

# allow character repeats by holding down key
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

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

# filesystem nav
alias subl-pkgs='cd /Users/will/Library/Application\ Support/Sublime\ Text\ 3/Packages'

# htop needs root privileges to work
alias htop='sudo htop'

# ============================================================================ #
# stuff from https://github.com/cowboy/dotfiles/blob/master/source/50_osx.sh
# ---------------------------------------------------------------------------- #

# TODO: re-examin path structure
# APPLE, Y U PUT /usr/bin B4 /usr/local/bin?!
#  PATH="/usr/local/bin:$(path_remove /usr/local/bin)"
#  export PATH

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Make 'less' more.
# [[ "$(type -P lesspipe.sh)" ]] && eval "$(lesspipe.sh)"

# Start ScreenSaver. This will lock the screen if locking is enabled.
alias ss="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"

# TODO: figure out what all this shit does. until then, exit early
return 1

# Create a new Parallels VM from template, replacing the existing one.
function vm_template() {
  local name="$@"
  local basename="$(basename "$name" ".zip")"
  local dest_dir="$HOME/Documents/Parallels"
  local dest="$dest_dir/$basename"
  local src_dir="$dest_dir/Templates"
  local src="$src_dir/$name"
  if [[ ! "$name" || ! -e "$src" ]]; then
    echo "You must specify a valid VM template from this list:";
    shopt -s nullglob
    for f in "$src_dir"/*.pvm "$src_dir"/*.pvm.zip; do
      echo " * $(basename "$f")"
    done
    shopt -u nullglob
    return 1
  fi
  if [[ -e "$dest" ]]; then
    echo "Deleting old VM"
    rm -rf "$dest"
  fi
  echo "Restoring VM template"
  if [[ "$name" == "$basename" ]]; then
    cp -R "$src" "$dest"
  else
    unzip -q "$src" -d "$dest_dir" && rm -rf "$dest_dir/__MACOSX"
  fi && \
  echo "Starting VM" && \
  open -g "$dest"
}

# Export Localization.prefPane text substitution rules.
function txt_sub_backup() {
  local prefs=~/Library/Preferences/.GlobalPreferences.plist
  local backup=$DOTFILES/conf/osx/NSUserReplacementItems.plist
  /usr/libexec/PlistBuddy -x -c "Print NSUserReplacementItems" "$prefs" > "$backup" &&
  echo "File ~${backup#$HOME} written."
}

# Import Localization.prefPane text substitution rules.
function txt_sub_restore() {
  local prefs=~/Library/Preferences/.GlobalPreferences.plist
  local backup=$DOTFILES/conf/osx/NSUserReplacementItems.plist
  if [[ ! -e "$backup" ]]; then
    echo "Error: file ~${backup#$HOME} does not exist!"
    return 1
  fi
  cmds=(
    "Delete NSUserReplacementItems"
    "Add NSUserReplacementItems array"
    "Merge '$backup' NSUserReplacementItems"
  )
  for cmd in "${cmds[@]}"; do /usr/libexec/PlistBuddy -c "$cmd" "$prefs"; done
}
