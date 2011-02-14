if &t_Co > 1
  set background=dark
  syntax enable
endif

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%04.8b]\ [HEX=\%04.4B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

filetype on
filetype indent on
filetype plugin on

let b:tex_flavor = 'pdflatex'

"set smartindent
set tabstop=2
set autoindent shiftwidth=2
"set expandtab

set hlsearch   " Iluminar búsquedas (buscar con *)
set incsearch  " Búsqueda incremental

map <SPACE> i<SPACE><ESC>
map <CR> o<ESC>

map <A-DOWN> gj
map <A-UP> gk
imap <A-DOWN> <ESC>lgji
imap <A-UP> <ESC>lgki

" Repite la última acción y posiciona el cursor al comienzo de la zona
" modificada.
map . .`[

"set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Swap words
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

map <F5> :make<CR>
map <F6> :copen<CR>
map <F7> :cp<CR>
map <F8> :cn<CR>

set spelllang=es,en_us
set spellsuggest=10
map <C-F5> :setlocal spell<CR>
map <M-F5> z=
imap <M-F5> <ESC>z=

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
set tags+=./tags
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniCppComplete plugin (you need to install, download it at http://www.vim.org/scripts/script.php?script_id=1520)
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! SuperCleverTab()
  if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
    return "\<Tab>"
  else
    if &omnifunc != ''
      return "\<C-X>\<C-O>"
    elseif &dictionary != ''
      return "\<C-K>"
    else
      return "\<C-N>"
    endif
  endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>
