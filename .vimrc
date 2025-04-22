set guioptions=agimrltT

set visualbell
set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers set history=50
			" keep 50 lines of command line history
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set showmode showmatch
set incsearch
set titlestring=%t%m	" window title is filename
set browsedir=current
set nomousehide

set hidden
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set autowrite
set noro

" cindenting
set cino=t0


nmap 	<F1> 	:NERDTreeToggle<CR>
map 	<F2> 	:HLtoggle<CR>
nmap 	<F3> 	:ClistToggle<CR>
nmap 	<F4> 	:diffoff!<CR>
map 	<F5> 	"a
map 	<F6> 	"b

"Grep for word under cursor
map      <F7>     *:Ack -w <cword><CR>
map      <F8>     *:tag <cword><CR>

" this mapping is very very crucial. otherwise, the buffer and file
" explorer area will keep jumping all over the place. very very annoying
" if that happens.
if has(":vsplit")
  set ea
  set eadirection=ver
end

" hide these files in File Explorer
let g:explHideFiles='^\.,\.gz$,\.exe$,\.zip$'

let NERDTreeDirArrows = 0
let NERDTreeDirArrows = 0
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2

let &t_SI .= "\<Esc>[6 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI .= "\<Esc>[2 q"

syntax on

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  filetype plugin indent on
endif " has("autocmd")

" colors used in a color term 
hi Special	ctermfg=Magenta
hi Identifier ctermfg=Black
hi Statement	ctermfg=DarkGrey
hi PreProc	ctermfg=Magenta
hi Type	ctermfg=Black
hi Ignore	ctermfg=white

colorscheme elflord

