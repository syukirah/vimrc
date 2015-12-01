" AUTHOR: SYUKUR BIN MD KASSIM
" EMAIL: syukirah@yahoo.co.uk
" DESCRIPTION: Common vimrc file for syukur

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'pangloss/vim-javascript'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe'
call plug#end()

execute pathogen#infect()
syntax on
filetype plugin indent on


set number
set background=dark
colorscheme solarized
set gfn=Courier_New:h9:cANSI

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Easy motion gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Use together with Airline plugin
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme =  'jellybeans'


" Map jj to <Esc> character for easy access
imap jj <Esc>


""""""""""""
" FUNCTION "
""""""""""""

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
