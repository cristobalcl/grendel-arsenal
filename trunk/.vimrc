set nocompatible

call pathogen#infect()

if &t_Co > 1 || has("gui_running")
	set background=dark
endif

if &t_Co >= 256 || has("gui_running")
	colorscheme xoria256
endif

set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set path=.,,**
set wildignore=*.swp,*.bak,*.pyc,*.class

let mapleader = ","

set hidden
set switchbuf=useopen,usetab,newtab
nnoremap <F9> :sbnext<CR>
nnoremap <S-F9> :sbprevious<CR>

set wildmenu
set wildmode=list:longest,full

set title
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%04.8b]\ [HEX=\%04.4B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

set cursorline

"set scrolloff=3

syntax on
set ofu=syntaxcomplete#Complete

filetype on
filetype indent on
filetype plugin on

let b:tex_flavor = 'pdflatex'

"set smartindent
set autoindent shiftwidth=4
set shiftround
set smarttab
"set expandtab
set textwidth=79
set tabstop=4
set softtabstop=4
set copyindent

set showmatch
set hlsearch   " Iluminar búsquedas (buscar con *)
set incsearch  " Búsqueda incremental
set ignorecase
set smartcase
set clipboard=unnamedplus

nmap <leader>s :nohlsearch<CR>
nmap <leader>n :set number!<CR>
set relativenumber
nmap <leader>r :set relativenumber!<CR>

"set list
nmap <leader>c :set list!<CR>
set listchars=tab:▸.,trail:.,extends:…,nbsp:.,eol:¬
""Invisible character colors
"highlight NonText ctermfg=8 ctermbg=0
"highlight SpecialKey ctermfg=8 ctermbg=0

nmap <buffer> <CR> <C-]>
nmap <buffer> <BS> <C-T>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

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

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

nnoremap <Leader>v :source $MYVIMRC<CR>

" Swap words
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

" Append line after next line
nnoremap gl ddpkJ

map <F5> :make<CR>
map <F6> :cc<CR>
map <A-Left> :cp<CR>
map <A-Right> :cn<CR>

"iabbr --- --------------------------------------------------------------------------------
"iabbr ### ################################################################################

set spelllang=es,en_us
set spellsuggest=10
map <C-F5> :setlocal spell<CR>
map <M-F5> z=
imap <M-F5> <ESC>z=

"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
map <F8> :!ctags -R .<CR><CR>
set tags+=./.tags
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4

nmap <silent> <leader>d g<C-]><CR>

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
"function! SuperCleverTab()
"  if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
"    return "\<Tab>"
"  else
"    if &omnifunc != ''
"      return "\<C-X>\<C-O>"
"    elseif &dictionary != ''
"      return "\<C-K>"
"    else
"      return "\<C-N>"
"    endif
"  endif
"endfunction
"
"inoremap <Tab> <C-R>=SuperCleverTab()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
"set sessionoptions-=tabpages
nnoremap <silent> <A-PageUp> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-PageDown> :execute 'silent! tabmove ' . tabpagenr()<CR>
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
"nmap <C-c> :tabclose<CR>
"imap <C-c> <Esc>:tabclose<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CloseHiddenBuffers()
	" figure out which buffers are visible in any tab
	let visible = {}
	for t in range(1, tabpagenr('$'))
		for b in tabpagebuflist(t)
			let visible[b] = 1
		endfor
	endfor
	" close any buffer that's loaded and not visible
	for b in range(1, bufnr('$'))
		if bufloaded(b) && !has_key(visible, b)
			exe 'bd ' . b
		endif
	endfor
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleMouse()
	if &mouse == 'a'
		set mouse=
		echo "Mouse usage disabled"
	else
		set mouse=a
		echo "Mouse usage enabled"
	endif
endfunction
nnoremap <Leader>m :call ToggleMouse()<CR>
set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color test: Save this file, then enter ':so %'
" Then enter one of following commands:
"   :VimColorTest    "(for console/terminal Vim)
"   :GvimColorTest   "(for GUI gvim)
function! VimColorTest(outfile, fgend, bgend)
	let result = []
	for fg in range(a:fgend)
		for bg in range(a:bgend)
			let kw = printf('%-7s', printf('c_%d_%d', fg, bg))
			let h = printf('hi %s ctermfg=%d ctermbg=%d', kw, fg, bg)
			let s = printf('syn keyword %s %s', kw, kw)
			call add(result, printf('%-32s | %s', h, s))
		endfor
	endfor
	call writefile(result, a:outfile)
	execute 'edit '.a:outfile
	source %
endfunction
" Increase numbers in next line to see more colors.
command! VimColorTest call VimColorTest('vim-color-test.tmp', 12, 16)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swap windows
" http://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim/4903681#4903681
function! MarkWindowSwap()
	let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
	"Mark destination
	let curNum = winnr()
	let curBuf = bufnr( "%" )
	exe g:markedWinNum . "wincmd w"
	"Switch to source and shuffle dest->source
	let markedBuf = bufnr( "%" )
	"Hide and open so that we aren't prompted and keep history
	exe 'hide buf' curBuf
	"Switch to dest and shuffle source->dest
	exe curNum . "wincmd w"
	"Hide and open so that we aren't prompted and keep history
	exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>W :call MarkWindowSwap()<CR>
nmap <silent> <leader>w :call DoWindowSwap()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTreeTabs
map <Leader>f <plug>NERDTreeTabsToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagList
autocmd FileType taglist setlocal norelativenumber
nnoremap <silent> <Leader>t :TlistToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" supertab
au FileType python setlocal omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
