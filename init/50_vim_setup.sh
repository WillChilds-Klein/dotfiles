# automate vim set up
# =========================================================================== #

VUNDLE_DIR=~/.vim/bundle/Vundle.vim

#  1. make sure vim is installed
vim --version >/dev/null || return 1

#  2. install xor update  Vundle via GitHub
#     into directory ~/.vim/bundle/Vundle.vim
if [[ -d "${VUNDLE_DIR}" && -d "${VUNDLE_DIR}/.git" ]]; then
    echo "updating Vundle!"
    cd ${VUNDLE_DIR}
    git pull
    cd -
else
    git clone https://github.com/VundleVim/Vundle.vim.git ${VUNDLE_DIR}
    echo "installing Vunldle into ${VUNDLE_DIR}"
fi

#  3. run shell command to make Vundle install all plugins:
vim +PluginInstall +qall
