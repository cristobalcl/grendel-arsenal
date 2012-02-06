""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No compatible mode
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen plugin setup
call pathogen#infect()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color schema
if &t_Co > 1 || has("gui_running")
	set background=dark
endif

if &t_Co >= 256 || has("gui_running")
	colorscheme xoria256
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reload vim configuration
nnoremap <Leader>v :source $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and directories
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" File search
set path=.,,**

" Wild menu
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu
set wildmode=list:longest,full

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
set hidden                               " Keep files open in background
set switchbuf=useopen,usetab,newtab      " Buffer behaviour
nnoremap <F9> :sbnext<CR>                " Jump to next buffer
nnoremap <S-F9> :sbprevious<CR>          " Jump to previous buffer

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
"set sessionoptions-=tabpages
nnoremap <silent> <A-PageUp> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>      " Move tabs
nnoremap <silent> <A-PageDown> :execute 'silent! tabmove ' . tabpagenr()<CR>        " Move tabs
nmap <C-t> :tabnew<CR>                  " Create tab
imap <C-t> <Esc>:tabnew<CR>             " Create tab
"nmap <C-c> :tabclose<CR>
"imap <C-c> <Esc>:tabclose<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Title and status line
set title
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%04.8b]\ [HEX=\%04.4B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor
set cursorline                           " Highlight cursor line
"set scrolloff=3
set relativenumber                       " Relative line numbers
nmap <leader>r :set relativenumber!<CR>  " Switch relative line numbers
nmap <leader>n :set number!<CR>          " Switch line numbers

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax and languages
syntax on
set ofu=syntaxcomplete#Complete
filetype on
filetype indent on
filetype plugin on
autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl
let b:tex_flavor = 'pdflatex'           " Compiler for latex files

map <F5> :make<CR>                      " Compile
map <F6> :cc<CR>                        " Show errors
map <A-Left> :cp<CR>                    " Previous error
map <A-Right> :cn<CR>                   " Next error

" Tags
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
map <F8> :!ctags -R .<CR><CR>           " Compile tags
set tags+=./.tags                       " Tags file
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
nmap <silent> <leader>d g<C-]><CR>     " Go to tag definition
nmap <CR> <C-W>]
nmap <BS> :pop<CR>
"nmap <buffer> <A-F7> :ptselect<cr>
"nmap <buffer> <F8> :tnext<cr>
"nmap <buffer> <C-F8> :tprev<cr>

" Identation
"set smartindent
set autoindent shiftwidth=4
set shiftround
set smarttab
"set expandtab
"set textwidth=79
set tabstop=4
set softtabstop=4
set copyindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
set showmatch
set hlsearch                            " Highligh search result
set incsearch                           " Incremental search
set ignorecase                          " Ignore case
set smartcase                           " Smartcase
nmap <leader>s :nohlsearch<CR>          " Clear search highlight

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show special characters
"set list
nmap <leader>c :set list!<CR>
set listchars=tab:▸.,trail:.,extends:…,nbsp:.,eol:¬
"highlight NonText ctermfg=8 ctermbg=0          " Invisible character colors
"highlight SpecialKey ctermfg=8 ctermbg=0
match ErrorMsg /\s\+$/                  " Highlight spaces at the end of the line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Help
"nmap <buffer> <CR> <C-]>                " Navigate into
"nmap <buffer> <BS> <C-T>                " Nagivate back

inoremap <F1> <ESC>                     " Disable F1 key
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
" Shift arrows to move in long lines
map <A-DOWN> gj
map <A-UP> gk
imap <A-DOWN> <ESC>lgji
imap <A-UP> <ESC>lgki

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edition
map . .`[                               " Repeat last action and move to the beginning of the edition

nnoremap <F2> :set invpaste paste?<CR>  " Switch paste mode
set pastetoggle=<F2>
set showmode

nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>     " Swap words
nnoremap gl ddpkJ                       " Append line after next line

" Move lines and visual selections up and down
nnoremap <C-Down> :m+<CR>==
nnoremap <C-Up> :m-2<CR>==
inoremap <C-Down> <Esc>:m+<CR>==gi
inoremap <C-Up> <Esc>:m-2<CR>==gi
vnoremap <C-Down> :m'>+<CR>gv=gv
vnoremap <C-Up> :m-2<CR>gv=gv

set clipboard=unnamedplus               " Clipboard

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checker
set spelllang=es,en_us
set spellsuggest=10
map <C-F5> :setlocal spell<CR>          " Start spell checker
map <M-F5> z=                           " Show suggestions
imap <M-F5> <ESC>z=                     " Show suggestions

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations
iabbr 80*- --------------------------------------------------------------------------------
iabbr 80*# ################################################################################
iabbr 80*" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbr 80*/ ////////////////////////////////////////////////////////////////////////////////
iabbr 80*% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

iabbr fi if
iabbr teh the

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SuperCleverTab
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close hidden buffers
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
nnoremap <Leader>C :call CloseHiddenBuffers<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swicth mouse on/off
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
set mouse=a                             " Mouse activate

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swap windows (http://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim/4903681#4903681)
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniCppComplete plugin
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTreeTabs
map <Leader>f <plug>NERDTreeTabsToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagList
autocmd FileType taglist setlocal norelativenumber
nnoremap <silent> <Leader>t :TlistToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" supertab
au FileType python setlocal omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
