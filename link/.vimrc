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
Plugin 'VundleVim/Vundle.vim'

" NOTE: no 'foo/' username means plugin is pulled from
"   http://vim-scripts.org/vikm/scripts.html

" auto wrap HTML tags
Plugin 'alvan/vim-closetag'

" hybrid color scheme
Plugin 'w0ng/vim-hybrid'

" solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" language-specific plugins
Plugin 'fatih/vim-go'
Plugin 'rhysd/vim-crystal'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" vim-surround for easy brackets etc
Plugin 'tpope/vim-surround'

" repeat support for plugins
Plugin 'tpope/vim-repeat'

" git integration
Plugin 'tpope/vim-fugitive'

" HackerNews plugin
Plugin 'ryanss/vim-hackernews'

" distraction-free writing, toggle with :Goyo
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" markdown in vim
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-markdown'

" fzf for fuzzy file finding
Plugin 'junegunn/fzf'

" honor direnv var export in vim and set .envrc filetype=sh
Plugin 'direnv/direnv.vim'

" tcomment for managing comments
Plugin 'scrooloose/nerdcommenter'

" proper syntax etc. for .tmux.conf
Plugin 'tmux-plugins/vim-tmux'

" nice status bar at bottom
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" rich Python autocomplete
Plugin 'davidhalter/jedi'
Plugin 'davidhalter/jedi-vim'

" better Python folding
Plugin 'tmhedberg/SimpylFold'

" flake8, run with F7
Plugin 'nvie/vim-flake8'

" clojure
Plugin 'tpope/vim-fireplace'

" s-exps and paren matching
Plugin 'vim-scripts/paredit.vim'

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


" =============== General .vimrc stuff ================ "
" map <leader> to space key
map <Space> <Leader>
" quick write
nnoremap <Leader>w :w<CR>
" quick quit
nnoremap <Leader>q :q<CR>
" quick write+quit
nnoremap <Leader>wq :wq<CR>
" <Leader>-b to invoke make with target of current file's basename
nnoremap <Leader>b :silent make %:r\|redraw!\|cw<CR>
" in vim, <Leader>v to edit .vimrc in new tab
nnoremap <Leader>v :tabe $VIMRC<CR>
nnoremap <Leader>n :tabnew<CR>:HackerNews<CR>
" tab navigation
nnoremap <Leader>t gt
nnoremap <Leader>T gT
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
" easy find/replace
nnoremap <Leader>s :%s//g<LEFT><LEFT>
" use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" hide buffer instead of closing
set hidden
" Optimize for fast terminal connections
set ttyfast
" Highlight dynamically as pattern is typed
set incsearch
 "Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
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
" Make tabs as wide as four spaces, make <BS> follow that too
set tabstop=4
set softtabstop=4
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

" Ex mode is fucking useless
nnoremap Q :q!<CR>

" use UTF-8
set encoding=utf-8

" set solarized color palette to full 256
let g:solarized_termcolors=256

" nice syntax highlighting, default to hybrid dark.
syntax on
colorscheme hybrid
set background=dark

" swich between light and dark setup
:command! Dark colorscheme hybrid | set background=dark
:command! Light colorscheme solarized | set background=light

" disable Background Color Erase so colorshceme bg goes full terminal
set t_ut=

" activate mouse control if available
if has("mouse")
    set mouse=a
endif

" map 'jk' to <Esc>
imap jk <Esc>
vmap jk <Esc>

" sensible ; --> : mapping
map ; :
noremap ;; ;
"noremap :: TODO make this be to ';;' what 'F' is to 'f'

" highlight search results
set hlsearch
" silently unhighlight search on 'jk'
nnoremap <silent> jk :nohlsearch<CR>

" http://vimdoc.sourceforge.net/htmldoc/eval.html#last-position-jump
"   This autocommand jumps to the last known position in a file
"   just after opening it, if the '"' mark is set:
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" faster timeout time to eliminate cursor lag on 'jk'
" NOTE: default is 1000, which causes annoying lag
set timeoutlen=200

" allow cursor to be one char past EOL
set virtualedit=onemore

" enable cursor wrapping
set whichwrap+=<,>,h,l,[,]

" set qq to ignore changes -> quit
cabbrev qq q!

" use ag as source to get source filtering for free
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" <C>-t to activate fzf
nnoremap <C-T> :FZF<CR>

" good vim-split behavior
set splitbelow
set splitright

" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" auto source .vimrc when its buffer is written to
autocmd BufWritePost .vimrc
    \ source $VIMRC     |

" disable auto comment insertion, except when line is wrapped.
autocmd FileType *
    \ setlocal formatoptions-=r     |
    \ setlocal formatoptions-=o     |
    \ setlocal formatoptions+=c     |

" complete tags on web files
autocmd FileType html,js,jsx
    \ set omnifunc=htmlcomplete#CompleteTags    |

" file types for vim-closetags
let g:closetag_filenames = "*.html,*.xml,*.js"

" web filetype configurations
autocmd BufRead,BufNewFile *.html,*.js,*.css,*.yaml,*.yml
    \ setlocal tabstop=2        |
    \ setlocal softtabstop=2    |
    \ setlocal shiftwidth=2     |
    \ setlocal expandtab        |
    \ setlocal fileformat=unix  |

" allow jsx syntax highlighting in *.js
let g:jsx_ext_required = 0

" correct backspace behavior
set backspace=indent,eol,start

" vim-airline always on
set laststatus=2

" cold folding config
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1
nnoremap <Leader><Space> za

" autowrap commit msgs
au FileType gitcommit
    \ set tw=72     |

" autowrap markdown
autocmd BufRead,BufNewFile *.md
    \ set tw=80     |

" vim-markdown config
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" couple LimeLight with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ruby syntax for Vagrantfile
au BufNewFile,BufRead Vagrantfile
    \ set syntax=ruby       |

" PEP8-compliance
au BufNewFile,BufRead *.py
    \ setlocal tabstop=4        |
    \ setlocal softtabstop=4    |
    \ setlocal shiftwidth=4     |
    \ setlocal textwidth=79     |
    \ setlocal expandtab        |
    \ setlocal fileformat=unix  |

let g:jedi#completions_command = "<C-n>"    " same as omnicomplete
let g:jedi#use_tabs_not_buffers = 1         " tab out for easy nav
let g:jedi#popup_on_dot = 0                 " don't be automatic
let g:jedi#show_call_signatures = 2         " show sigs in cmd bar

"virtualenv support for python/jedi
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
