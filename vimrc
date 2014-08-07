let mapleader = ","

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#infect('bundle/colors')

set t_Co=256
colorscheme solarized
set background=light

"set vb t_vb=

filetype on
filetype plugin on
filetype indent on

set expandtab
set hidden
set autowrite
set ignorecase
set smartcase
set incsearch
set ttybuiltin

syntax on
set cmdheight=2
set ts=2
set tw=0
set sw=2
set autoindent
set backspace=indent,eol,start
set smarttab

set shiftround
set ruler
set hlsearch
set nu
set nocompatible
set eadirection=hor
set equalalways
set showmatch
set mouse=a
set foldmethod=indent
set foldnestmax=3
set foldlevelstart=99

set list
" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

nnoremap <leader>mo :set mouse=<cr>
nnoremap <leader>ma :set mouse=a<cr>

" Kill the damned Ex mode.
nnoremap Q <nop>

noremap <S-LEFT>   <c-w>h
noremap <S-UP>     <c-w>k
noremap <S-DOWN>   <c-w>j
noremap <S-RIGHT>  <c-w>l
noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l

nnoremap <c-b> :bp<cr>
nnoremap <c-n> :bn<cr>

noremap <leader>f :CtrlP<cr>
noremap <leader>b :CtrlPBuffer<cr>
let g:ctrlp_max_height = 30

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup ENDaugroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END

noremap <leader>n :NERDTreeToggle<cr>
let NERDTreeWinSize = 23

set wrap

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](components|node_modules|.git)$',
  \ 'file': '\v\..+\.sw.?$',
  \ }

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
