# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

sudo apt update
sudo apt dist-upgrade

# Install packages.
packages=(
  build-essential
  cowsay
  git-core
  htop
  id3tool
  libssl-dev
  mercurial
  nmap
  silversearcher-ag
  sl
  telnet
  tree
)

packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt install "$package"
  done
fi

# Install Git Extras
if [[ ! "$(type -P git-extras)" ]]; then
  e_header "Installing Git Extras"
  (
    cd $DOTFILES/vendor/git-extras &&
    sudo make install
  )
fi
