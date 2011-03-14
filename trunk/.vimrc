if &t_Co > 1
  set background=dark
  syntax enable
endif

set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let mapleader = ","

set hidden
set switchbuf=useopen,usetab,newtab

set wildmenu
set wildmode=list:longest,full

set title
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%04.8b]\ [HEX=\%04.4B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

"set scrolloff=3

filetype on
filetype indent on
filetype plugin on

let b:tex_flavor = 'pdflatex'

"set smartindent
set tabstop=4
set autoindent shiftwidth=4
"set expandtab

set hlsearch   " Iluminar búsquedas (buscar con *)
set incsearch  " Búsqueda incremental
set ignorecase
set smartcase

map <CR> o<ESC>

map <A-DOWN> gj
map <A-UP> gk
imap <A-DOWN> <ESC>lgji
imap <A-UP> <ESC>lgki

" Repite la última acción y posiciona el cursor al comienzo de la zona
" modificada.
map . .`[

" Move lines up and down
nnoremap <C-Down> :m+<CR>==
nnoremap <C-Up> :m-2<CR>==
inoremap <C-Down> <Esc>:m+<CR>==gi
inoremap <C-Up> <Esc>:m-2<CR>==gi
vnoremap <C-Down> :m'>+<CR>gv=gv
vnoremap <C-Up> :m-2<CR>gv=gv

"set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Swap words
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

" Append line after next line
nnoremap gl ddpkJ

map <F5> :make<CR>
map <F6> :copen<CR>
map <F7> :cp<CR>
map <F8> :cn<CR>

iabbr --- --------------------------------------------------------------------------------
iabbr ### ################################################################################

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
map  <C-Right> :tabnext<CR>
imap <C-Right> <C-O>:tabnext<CR>
map  <C-Left> :tabprev<CR>
imap <C-Left> <C-O>:tabprev<CR>

" From http://vim.wikia.com/wiki/Show_tab_number_in_your_tab_line
set tabline=%!MyTabLine()		" custom tab pages line
function MyTabLine()

	let s = '' " complete tabline goes here

	" loop through each tab page
	for t in range(tabpagenr('$'))

		" set highlight for tab number and &modified 
		let s .= '%#TabLineSel#'

		" set the tab page number (for mouse clicks)
		let s .= '%' . (t + 1) . 'T'

		" set page number string
		let s .=  t + 1 . ':' 

		" get buffer names and statuses
		let n = ''  "temp string for buffer names while we loop and check buftype
		let m = 0	" &modified counter
		let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '

		" loop through each buffer in a tab
		for b in tabpagebuflist(t + 1)

			" buffer types: quickfix gets a [Q], help gets [H]{base fname}
			" others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
			if getbufvar( b, "&buftype" ) == 'help'
				let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
			elseif getbufvar( b, "&buftype" ) == 'quickfix'	
				let n .= '[Q]'
			else
				let n .= pathshorten(bufname(b))
			endif

			" check and ++ tab's &modified count
			if getbufvar( b, "&modified" )
				let m += 1
			endif

			" no final ' ' added...formatting looks better done later
			if bc > 1
				let n .= ' '
			endif

			let bc -= 1

		endfor

		" add modified label [n+] where n pages in tab are modified
		if m > 0
			let s .= '[' . m . '+]'
		endif

		" select the highlighting for the buffer names
		" my default highlighting only underlines the active tab
		" buffer names.
		if t + 1 == tabpagenr()
			let s .= '%#TabLine#'
		else
			let s .= '%#TabLineSel#'
		endif

		" add buffer names
		let s .= n

		" switch to no underlining and add final space to buffer list
		let s .= '%#TabLineSel#' . ' '

	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let s .= '%=%#TabLineFill#%999Xclose'
	endif

	return s

endfunction
