syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set paste

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

inoremap kj <esc>

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
" Plug 'lyuts/vim-rtags'
" Plug 'git@github.com:kien/ctrlp.vim.git'
" Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'talek/vorax4'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vim-syntastic/syntastic'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

" Left off at 10:00 of https://youtu.be/n9k9scbTuvQ
"
" --- Bryce
" coc.nvim works best on vim >= 8.1.1719 and neovim >= 0.4.0, consider upgrade your vim.
" You can add this to your vimrc to avoid this message:
let g:coc_disable_startup_warning = 1

let mapleader=","

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

" Ctrl p triggers fuzzy finder
nnoremap <C-P> :FZF<CR>

inoremap kj <esc>

iabbrev pdbb import pdb; pdb.set_trace()
nnoremap <leader>d Oimport pdb; pdb.set_trace()<esc>

" --- End Bryce

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" Syntastic settings
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

