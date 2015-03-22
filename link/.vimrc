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

" vim-go for go stuff
Plugin 'fatih/vim-go'

" syntastic
Plugin 'scrooloose/syntastic'

" HackerNews plugin
Plugin 'ryanss/vim-hackernews'

" fzf for fuzzy file finding
Plugin 'junegunn/fzf'

" LiveDown markdown previewer
Plugin 'shime/vim-livedown'

" tcomment for managing comments
Plugin 'scrooloose/nerdcommenter'

" vim-tmux for some sweet tmux tools
Plugin 'tmux-plugins/vim-tmux'

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
" in vim, <Leader>v to edit .vimrc in new tab
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
set scrolloff=3
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

" vim window navigation?
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" good vim-split behavior
set splitbelow
set splitright

" disable auto comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" correct backspace behavior
set backspace=indent,eol,start

" LiveDown configuration
cabbrev preview LivedownPreview<cr>
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1 
" the port on which Livedown server will run
let g:livedown_port = 1337
