# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update -y
sudo apt-get upgrade -y

# Install packages.
packages=(
  build-essential
  cowsay
  git-core
  gnupgp
  htop
  libssl-dev
  mosh
  nmap
  pass
  silversearcher-ag
  telnet
  tmux
  tree
  vim-nox-py2
  vim-python-jedi
)

if [[ ${#packages[@]} -gt 0 ]]; then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt-get install -y "$package"
  done
fi
