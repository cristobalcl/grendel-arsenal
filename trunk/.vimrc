if &t_Co > 1
  set background=dark
  syntax enable
endif

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%04.8b]\ [HEX=\%04.4B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

filetype indent on
filetype plugin on

let b:tex_flavor = 'pdflatex'

set autoindent shiftwidth=2
"set expandtab

set hlsearch   " Iluminar búsquedas (buscar con *)
set incsearch  " Búsqueda incremental

map <A-DOWN> gj
map <A-UP> gk
imap <A-DOWN> <ESC>lgji
imap <A-UP> <ESC>lgki

map <F5> :make<CR>
map <F6> :copen<CR>
map <F7> :cp<CR>
map <F8> :cn<CR>

set spelllang=es,en_us
set spellsuggest=10
map <C-F5> :setlocal spell<CR>
