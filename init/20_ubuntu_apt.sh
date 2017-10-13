# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update -y
sudo apt-get upgrade -y

# Install packages.
packages=(
  awscli
  build-essential
  cowsay
  direnv
  git-core
  gnupgp
  htop
  libssl-dev
  mosh
  nmap
  open-ssh
  pass
  python-pip
  silversearcher-ag
  telnet
  tmux
  tree
  urlview
  vim-nox-py2
  vim-python-jedi
)

if [[ ${#packages[@]} -gt 0 ]]; then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt-get install -y "$package"
  done
fi
