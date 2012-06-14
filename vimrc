runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#infect('bundle/colors')

set t_Co=256
colorscheme solarized

noremap c k
noremap t j
noremap n l

noremap l n
noremap L N

nnoremap <S-LEFT>   <c-w>h
nnoremap <S-UP>     <c-w>k
nnoremap <S-DOWN>   <c-w>j
nnoremap <S-RIGHT>  <c-w>l

nnoremap H <c-w>h
nnoremap C <c-w>k
nnoremap T <c-w>j
nnoremap N <c-w>l

vnoremap s s

noremap ,f :CtrlP<CR>
noremap ,b :CtrlPBuffer<CR>
let g:ctrlp_max_height = 30

set wrap

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
