# .bashrc for pan-unix customizations
# for MACOSX-specific customizations, see ~/.profile

# set directory location vars
export CODE_PATH=$HOME/work/code
export TOOLS_PATH=$CODE_PATH/tools
export SCRIPTS_PATH=$TOOLS_PATH/scripts
export GOPATH=$CODE_PATH/go

# build PATH
export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH=$GOPATH/bin:$PATH

# default application vars
export VISUAL=vim
export EDITOR='vim -e'
export PAGER=less

# zoo vars
export ZOO_USR='wdc22'
export ZOO_HOST='node.zoo.cs.yale.edu'
export ZOO_HOME='/home/accts/wdc22'

# filesystem nav
alias ..='cd ..'
alias home='cd $HOME'
alias peerster='cd $CODE_PATH/cs426/peerster'
alias groupthink='cd $CODE_PATH/cs426/groupthinkminer'
alias code='cd $CODE_PATH'
alias tools='cd $TOOLS_PATH'
alias scripts='cd $SCRIPTS_PATH'
alias desk='cd $HOME/Desktop'
alias classes='cd $HOME/work/classes'
alias cnh='cd $CODE_PATH/cnh/'
alias downloads='cd $HOME/Downloads'
alias ftree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'" 

# Mac OS X specific
alias showDotfiles='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
alias hideDotfiles='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias alert='terminal-notifier -message $1'

# zoo remote stuff
alias zoo='ssh -Y wdc22@node.zoo.cs.yale.edu'
alias zoo-run='$SCRIPTS_PATH/remote-run.sh $ZOO_USR $ZOO_HOST $ZOO_HOME'
alias zoo-print='$SCRIPTS_PATH/zoo-print.sh $1 $2'
alias copy-from-zoo='$SCRIPTS_PATH/copy-from-zoo.sh'
alias copy-to-zoo='$SCRIPTS_PATH/copy-to-zoo.sh'

# remote peerster stuff
alias peerster-remote='ssh -t -Y ${ZOO_USR}@${ZOO_HOST} "cd ${ZOO_HOME}/cs426/peerster && bash"'
alias peerster-remote-build='ssh ${ZOO_USR}@${ZOO_HOST} "cd ${ZOO_HOME}/cs426/peerster && ./build.sh"'

# general code folder on zoo for use with interviews etc.
alias zoo-code-run='$SCRIPTS_PATH/remote-run.sh $ZOO_USR $ZOO_HOST ${ZOO_HOME}/code'

# application aliases
alias grep='grep --color'
alias p='ping 8.8.8.8'
alias ls='ls -G'
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1'
alias ='clear'

# dotfile stuff
alias bashrc='vim $HOME/.bashrc && source $HOME/.bashrc'
alias bash_prof='vim $HOME/.bash_profile && source $HOME/.bash_profile'
alias prompt='vim $HOME/.bash_prompt && source $HOME/.bash_prompt'
alias inputrc='vim $HOME/.inputrc && source $HOME/.inputrc'
alias vimrc='vim $HOME/.vimrc'
alias emacsrc='vim $HOME/.emacs'
