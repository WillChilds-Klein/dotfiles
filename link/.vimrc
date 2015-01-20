""" Vundle init stuff """
set nocompatible              " be iMproved, reqquired
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin cRommands between vundle#begin/end.

" set ruler!
:set ruler

" twilight color scheme
Plugin 'twilight256.vim'

" fake-clip for accessing clipboard on OS-X
Plugin 'kana/vim-fakeclip'

" Syntastic plugin for syntax checking 
Plugin 'syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" Put your non-Plugin stuff after this line

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

syntax on
colorscheme twilight256

if has("mouse")
    set mouse=a
endif

set clipboard=unnamed

" map 'jk' to <Esc>
:imap jk <Esc>

" show line numbers
set nu

" remap ; to :
cnoremap <expr> ; getcmdpos() == 1 ? '<C-F>A' : ';'
silent! nunmap ;
silent! nunmap :
nnoremap <unique> ; :
nnoremap <unique> : ;
" TODO: map ';;' to exit-insert && ';'

" highlight search results
set hlsearch
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" allow cursor to be one char past EOL
set virtualedit=onemore 

" enable cursor wrapping
set whichwrap+=<,>,h,l,[,]

" set qq to ignore changes -> quit
command Qq q!
cabbrev qq Qq

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
