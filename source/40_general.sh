# general varibales, aliases, etc

# set directory location vars
export CODE=$HOME/work/code
export TOOLS=$CODE/tools
export SCRIPTS=$DOTFILES/bin
export GOPATH=$CODE/go

# build PATH
export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH=$GOPATH/bin:$PATH

# default application env variables
export VISUAL=vim
export EDITOR='vim -e'
export PAGER=less

# application aliases
alias grep='grep --color'
alias p='ping 8.8.8.8'
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1'
alias ='clear'
alias report='echo $?'