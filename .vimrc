set path=$PWD/**
" Make Vim more useful
set nocompatible
" Hide buffers instead of closing them
set hidden
" Don't wrap lines
set nowrap
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif
set autoindent
set cindent
filetype indent on
set smartindent
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set pastetoggle=<F2>
vmap Q gq
nmap Q gqap
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" Enable line numbers, relative numbers by default, but can swtich with Ctrl+n
" back and forth quickly.
set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Enable mouse in all modes.
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3
set bs=2    
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
vnoremap <C-Z> <C-O>:update<CR>
vnoremap <D-c> "+y

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" Show witespace
" Must be inserted before the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Solorized color scheme
" cd ~/.vim/bundle
" git clone git://github.com/altercation/vim-colors-solarized.git
syntax enable
set background=dark
" let g:solarized_termcolors=256
"colorscheme solarized
" curl -o molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
" colorscheme molokai

set colorcolumn=80
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
" call pathogen#infect()

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
"let g:jedi#related_names_command = "<leader>z"
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" For mac users (using the 'apple' key)
map <C-S-]> gt
map <C-S-[> gT
map <C-S-1> 1gt
map <C-S-2> 2gt
map <C-S-3> 3gt
map <C-S-4> 4gt
map <C-S-5> 5gt
map <C-S-6> 6gt
map <C-S-7> 7gt
map <C-S-8> 8gt
map <C-S-9> 9gt
map <C-S-0> :tablast<CR>
"  
"  " for linux and windows users (using the control key)
"  map <C-S-]> gt
"  map <C-S-[> gT
"  map <C-1> 1gt
"  map <C-2> 2gt
"  map <C-3> 3gt
"  map <C-4> 4gt
"  map <C-5> 5gt
"  map <C-6> 6gt
"  map <C-7> 7gt
"  map <C-8> 8gt
"  map <C-9> 9gt
"  map <C-0> :tablast<CR>

let g:netrw_list_hide= '.*\.pyc$'
" let g:netrw_list_hide= '\.DS.*$'

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif