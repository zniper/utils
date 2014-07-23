filetype plugin on

set omnifunc=pythoncomplete#Complete
inoremap <Nul> <C-x><C-o>

set expandtab
set tabstop=4
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set showmatch
set smarttab
set sw=4
set hidden
set backspace=indent,eol,start
set title
set nowrap
set nobackup
set noswapfile
set nowb
set so=5
set laststatus=2
set foldmethod=indent
set foldlevel=99

let mapleader=","

inoremap jk <Esc>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map 0 ^
inoremap ;w <ESC>:w<CR>
nnoremap ;w <ESC>:w<CR>
inoremap pdb<TAB> import pdb;pdb.set_trace()<CR>

set wildignore+=*.pyc,*.jpg,*.jpeg,*.png,*.zip,*.pdf,*.jar,*.JPG,*.PNG,*.tif,*.psd,*.gif
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

syntax enable

colorscheme zniper 

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_right_sep = ''

let g:jedi#popup_select_first = 1 

call pathogen#infect() 
