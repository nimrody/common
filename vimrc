" Following 2 lines are required for vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle manage Vundle (required!)
Bundle 'gmarik/vundle'

" My Bundles here:
" " original repos on github
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'Shougo/unite.vim'

" Bundle 'L9'  " automatically assumes github user vim-scripts
" Bundle 'git://git.wincent.com/command-t.git' " specific repo
" " ...
"

set encoding=utf8
filetype plugin on
filetype indent on
syntax on

" enable modeline vi:noai:sw=4 ts=6 at beginning and end of file
set modeline

set timeout timeoutlen=1000 ttimeoutlen=100

" add these suffixes when using 'gf'
set suffixesadd=.tun,.cfg

" Make sure the diff mode ignores white spaces and places --- 
" where lines are missing (to keep the two windows in sync)
set diffopt=filler,iwhite

set wildmenu
set wildignore+=*.keep*
set wildignore+=*.rej*
set wildignore+=*.orig*



set noswapfile       
set ruler
set laststatus=2    " always have the status line visible
set nowrap
set guioptions=agimrL
colors torte

set ignorecase

set visualbell
set virtualedit=block
set expandtab
set tabstop=8
set softtabstop=4

set tags=./tags,../tags,../../tags,../../../tags,../../../../tags


autocmd FileType c      call Cdefaults()
autocmd FileType cpp    call Cdefaults()
autocmd FileType matlab call Mdefaults()
autocmd FileType ruby   call RubyDefaults()
autocmd FileType eruby  call RubyDefaults()

au BufRead,BufNewFile *.tun set filetype=paramtune
au BufRead,BufNewFile *.cfg set filetype=paramtune
au! Syntax paramtune source ~/.vim/syntax/paramtune.vim

function CurrentFile()
	let ff=expand("<cfile>") 
	:split ff
endfunction

function! Cdefaults()
	set cindent shiftwidth=4 tabstop=4
	set formatoptions=croql
	set comments=sr:/*,mb:*,el:*/,://
endfunction

function! Mdefaults()
	set ai shiftwidth=4 tabstop=4
endfunction

function! RubyDefaults()
  set ai
  set sw=2 ts=2 et
endfunction



if has("cscope")
    set csprg=~/bin/cscope
    set csto=0  " search cscope, then ctags
    set cst     " use cscope for tags
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

if filereadable("tags")
    let  &tags=getcwd()."/tags"
endif

" This autocommand jumps to the last known position in a file
" just after opening it, if the '" mark is set: >
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif



map <C-_>  :cstag <C-R>=expand("<cword>")<CR><CR>
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>



map <A-F4> :let Grep_Skip_Dirs = 'RCS CVS SCCS _darcs HeaderFiles' <CR>
map <S-F4> :let Grep_Skip_Dirs = 'RCS CVS SCCS _darcs _\* HeaderFiles' <CR>
map <F2> :TagExplorer <CR>
map <F1> :Tlist <CR>
map <F6> :set number!<CR>:set scrollbind!<CR>

" special 'make' versions for wcdma project
map \mm :set  mp=gmake\ -f\ ArtMakefile<CR> :make MODE=DEBUG <CR>
map \mk :set  mp=gmake\ -f\ ArtMakefile<CR> :make MODE=OPT <CR>
map \mj :!update_build_env<CR>:cs reset <CR>

" set tag file to the one in the current buffer directory (only in normal
" mode)
nmap \\ :set  tags=<C-R>=getcwd()."/tags" <CR><CR>:cs add cscope.out<CR>

" a command line shortcut for the directory of the current file
cmap \\ <C-R>=expand("%:p:h")."/"<cr>






map <C-Right> zl
map <C-Left> zh
map <C-Up>   <C-Y>
map <C-Down>   <C-E>

map <F10> :copen<CR>
map <F11> :cprev<CR>
map <F12> :cnext<CR>

map <F7>  :prev<CR>
map <F8>  :next<CR>
map \pp :set wrap!<CR>

map <F9>  :s/Params/State/g<CR>
map <A-F9>  :s/State/Params/g<CR>

map <F5> :set hls!<bar>set hls?<CR>
map <F6> :set number!<CR>:set scrollbind!<CR>

" special 'make' versions for wcdma project
map \mm :set  mp=gmake\ -f\ ArtMakefile\ -j10<CR> :make MODE=DEBUG <CR>
map \mi :set  mp=gmake\ -f\ ArtMakefile\ -j10<CR> :make MODE=INTEL_OPT<CR>
map \mj :!update_build_env<CR>:cs reset <CR>

" set tag file to the one in the current buffer directory (only in normal
" mode)
nmap \\ :set  tags=<C-R>=getcwd()."/tags" <CR><CR>:cs add cscope.out<CR>

" a command line shortcut for the directory of the current file
cmap \\ <C-R>=expand("%:p:h")."/"<cr>
