# stuff for files and file system navigation

# Always use color output for `ls`
if is_osx; then
  alias ls="command ls -G"
  export CLICOLOR=1
  export LSCOLORS=ExFxCxDxBxegedabagacad
  # uncomment below for lighter term backgrounds
  #export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
else
  alias ls="command ls --color=auto"
  export LS_COLORS='no=00:fi=00:di=01;36:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
fi


# aliases for `ls`
alias la='ls -al'
alias l='ls -al'

# Directory listing
if [[ "$(type -P tree)" ]]; then
  alias ll='tree --dirsfirst -aLpughDFiC 1'
  alias lsdir='ll -d'
else
  alias ll="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
fi

# File size
alias fsize="du -h"
alias dirsize="du -ch"
alias df="df -h"

# Recursively delete `.DS_Store` files
#alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# shorthand filesystem nav
alias ..='cd ..'
alias ...='cd ../..'
alias bk='cd -'
alias ..l='cd .. && ll'

# specific directory aliases
alias home='cd $HOME'
alias code='cd $CODE'
alias tools='cd $TOOLS && ll'
alias scripts='cd $SCRIPTS'
alias desk='cd $HOME/Desktop'
alias classes='cd $HOME/work/classes && ll'
alias cnh='cd $CODE/cnh/'
alias downloads='cd $HOME/Downloads'
alias dotf='cd $DOTFILES && ll'
alias godir='cd $GOPATH/ && ll'
alias dedis='cd $GOPATH/src/github.com/dedis && ll'

# dotfile editing and immediate sourcing/updating
alias srcgen='$EDITOR $DOTFILES/source/40_general.sh && src general'
alias srcfile='$EDITOR $DOTFILES/source/50_file.sh && src file'
alias srcprompt='$EDITOR $DOTFILES/source/50_bash_prompt.sh && src bash_prompt'
alias srcgit='$EDITOR $DOTFILES/source/50_git.sh && src git'
alias srcosx='$EDITOR $DOTFILES/source/50_osx.sh && src osx'
alias srcubuntu='$EDITOR $DOTFILES/source/50_ubuntu.sh && src ubuntu'
alias srczoo='$EDITOR $DOTFILES/source/50_zoo.sh && src zoo'
alias srctools='$EDITOR $DOTFILES/source/60_tools.sh && src tools'

# edit rc/conf files. 
alias inputrc='$EDITOR $DOTFILES/link/.inputrc'
alias vimrc='$EDITOR $DOTFILES/link/.vimrc'
alias tmuxrc='$EDITOR $DOTFILES/link/.tmux.conf'
alias ttermrc='$EDITOR $DOTFILES/link/.tmux/tterm.conf'
alias direnvrc='$EDITOR $DOTFILES/link/.direnvrc'
