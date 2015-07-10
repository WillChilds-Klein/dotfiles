" ================ Vundle ================ "
set nocompatible              " be iMproved, reqquired
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" ----------- Vundle Plugins ------------- "
" Keep Plugin commands between vundle#begin/end.
call vundle#begin()

" Examples: "
" plugin on GitHub repo:
" > Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" > Plugin 'L9'
" Git plugin not hosted on GitHub
" > Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" > Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" > Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" > Plugin 'user/L9', {6F'name': 'newL9'}

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" twilight color scheme
" NOTE: no 'foo/' username means plugin is pulled from
"   http://vim-scripts.org/vikm/scripts.html
Plugin 'twilight256.vim'

" tomorrow color scheme
Plugin 'chriskempson/tomorrow-theme'

" hybrid color scheme
Plugin 'w0ng/vim-hybrid'

" vim-go for go stuff
Plugin 'fatih/vim-go'

" vim-surround for easy brackets etc
Plugin 'tpope/vim-surround'

" repeat support for plugins
Plugin 'tpope/vim-repeat'

" syntastic
Plugin 'scrooloose/syntastic'

" HackerNews plugin
Plugin 'ryanss/vim-hackernews'

" markdown in vim
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-markdown'

" fzf for fuzzy file finding
Plugin 'junegunn/fzf'

" tcomment for managing comments
Plugin 'scrooloose/nerdcommenter'

" vim-tmux for some sweet tmux tools
Plugin 'tmux-plugins/vim-tmux'

" syntax highlighting for Dockerfile
Plugin 'ekalinin/Dockerfile.vim' 

" stuff for fish shell scripts
Plugin 'dag/vim-fish'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" --------- Vundle Plugins End ----------- " 
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" Put your non-Plugin stuff after this line


" ============ default Syntastic settings ============= "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }


" =============== General .vimrc stuff ================ "
" map <leader> to space key
map <Space> <Leader>
" quick write
nnoremap <Leader>w :w<CR>
" quick quit
nnoremap <Leader>q :q<CR>
" quick force quit
nnoremap <Leader>qf :q!<CR>
" quick write+quit
nnoremap <Leader>wq :wq<CR>
" <Leader>-b to invoke make with target of current file's basename
"nnoremap <Leader>b :silent make %:r\|redraw!\|cw<CR>
nnoremap <Leader>b :make<CR>:copen<CR>
" in vim, <Leader>v to edit .vimrc in new tab
nnoremap <Leader>n :HackerNews<CR>
nnoremap <Leader>v :tabe $VIMRC<CR>
" auto source .vimrc when its buffer is written to
autocmd bufwritepost .vimrc source $VIMRC
" use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" hide buffer instead of closing 
set hidden
" Optimize for fast terminal connections
set ttyfast
" Highlight dynamically as pattern is typed
set incsearch
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" show whitespac chars
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase
" Disable error bells
set noerrorbells
" Start scrolling three lines before the horizontal window border
set scrolloff=10
" Show the filename in the window titlebar
set title
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Enable line numbers
set number
" show ruler numbers on bottom right of screen
set ruler
" insert space characters when tab is pressed
set expandtab
" Make tabs as wide as two spaces
set tabstop=4
" number of space chars for indentation
set shiftwidth=4
" no more damn .swp files
set noswapfile
" enable auto-indenting
set autoindent
" use previous line's indentation for autoindenting
set copyindent
" on wrapped lines, don't jump to next acual line
nnoremap j gj
nnoremap k gk
" remap recording to Q. q just gets in the way
nnoremap Q q
nnoremap q <Nop>


" nice syntax highlighting
syntax on
colorscheme twilight256

" activate mouse control if available
if has("mouse")
    set mouse=a
endif

" map 'jk' to <Esc>
imap jk <Esc>
vmap jk <Esc>

" remap ; to :
cnoremap <expr> ; getcmdpos() == 1 ? '<C-F>A' : ';'
silent! nunmap ;
silent! nunmap :
nnoremap <unique> ; :
nnoremap <unique> : ;
" TODO: map ';;' to exit-insert && ';'

" http://vimdoc.sourceforge.net/htmldoc/eval.html#last-position-jump
"   This autocommand jumps to the last known position in a file
"   just after opening it, if the '"' mark is set:
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" highlight search results
set hlsearch
" silently unhighlight search on 'jk'
nnoremap <silent> jk :nohlsearch<CR>

" faster timeout time to eliminate cursor lag on 'jk'
" NOTE: default is 1000, which causes annoying lag
set timeoutlen=200

" allow cursor to be one char past EOL
set virtualedit=onemore

" enable cursor wrapping
set whichwrap+=<,>,h,l,[,]

" set qq to ignore changes -> quit
cabbrev qq q!

" set color scheme
colorscheme twilight256

" good vim-split behavior
set splitbelow
set splitright

" disable auto comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" correct backspace behavior
set backspace=indent,eol,start

" vim-markdown config
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
