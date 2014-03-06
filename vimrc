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
Bundle 'kien/ctrlp.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'DirDiff.vim'

" Bundle 'L9'  " automatically assumes github user vim-scripts
" Bundle 'git://git.wincent.com/command-t.git' " specific repo
" " ...
"
"
let g:DirDiffExcludes = ".git,obj,bin,HeaderFiles,_*,cscope*,Depend*,*.keep,*.contrib,*.keep.[1-9],*.contrib.[1-9],*.dll,*.a"
let g:DirDiffAddArgs = "-w" 

set encoding=utf8
filetype plugin on
filetype indent on
syntax on

" enable modeline vi:noai:sw=4 ts=6 at beginning and end of file
set modeline

set timeout timeoutlen=1000 ttimeoutlen=100

" add these suffixes when using 'gf'
set suffixesadd=.tun,.cfg
"
"The following is the default filename characters with the comma (,) excluded
"It is used for the "gf" command (gotofile)
"set isfname=@,48-57,/,.,-,_,+,#,$,%,~,=
set isfname=@,48-57,/,.,-,_,+,#,$,%,~
" for [I search command and for "gf" -- search current directory, 
" directory of current file and finally all directories below current directory.
set path=,.,.**

" Make sure the diff mode ignores white spaces and places --- 
" where lines are missing (to keep the two windows in sync)
set diffopt=filler,iwhite

set wildmenu
set wildignore+=*.keep*
set wildignore+=*.rej*
set wildignore+=*.orig*



set dir=~/tmp
set nocompatible
set backup
set backupdir=~/tmp
set noswapfile       
set ignorecase
set ruler
set laststatus=2    " always have the status line visible
set nowrap
set guioptions=agimrL
colors torte


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

au BufRead,BufNewFile *.md set filetype=markdown
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



" This autocommand jumps to the last known position in a file when its opened
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif


" set tag file to the one in the current buffer directory (only in normal mode)
nmap \\ :set  tags=<C-R>=getcwd()."/tags" <CR><CR>:cs add cscope.out<CR>:cs reset<CR>

" a command line shortcut for the directory of the current file
cmap \\ <C-R>=expand("%:p:h")."/"<cr>

" wrap long lines - for checking error messages
nmap \pp :set wrap!<CR>

" Set scrollbind and switch window -- for comparing files line by line
nmap \sb :1<CR>:set scrollbind number<CR>^WW

nmap \be :CtrlPBuffer<CR>



nmap <C-Right> zl
nmap <C-Left>  zh
nmap <C-Up>   <C-Y>
nmap <C-Down> <C-E>

nmap <F10>   :copen<CR>
nmap <S-F12> :cprev<CR>
nmap <F12>   :cnext<CR>

nmap <F7>  :prev<CR>
nmap <F8>  :next<CR>

nmap <F5> :set hls!<bar>set hls?<CR>


" highlight current line with \c, mark current line with \l
" define a highlight colour group for bookmarks
hi default BookmarkCol ctermfg=blue ctermbg=lightblue cterm=bold guifg=DarkBlue guibg=#d0d0ff gui=bold
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

nnoremap <silent> <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" Switch between .h and .c (XXX: handle .cpp automatically)
fun! FlipExt()
    if match(expand("%"),'\.\(c\|cpp\)$') > 0
        exe ":e %<.h"
    elseif match(expand("%"),"\\.h") > 0
        if filereadable(expand("%<") . ".cpp")
            exe ":e %<.cpp"
        elseif filereadable(expand("%<") . ".c")
            exe ":e %<.c"
        else
            echo "Corresponding .c or .cpp file does not exist"
        end
    endif
endfun

nmap \ss :call FlipExt()<CR>

"""" Git Grep """""""""""""""""""""""""""""""""""""""""


" Add :G command to run 'git grep'
" Usage: :G pattern
"        :G pattern -- '*.c'
"
" ^X G  -- search for pattern under cursor

fun! GitGrep(...)
    let save = &grepprg
    set grepprg=git\ grep\ -in\ $*
    let s = 'grep'
    for i in a:000
        let s = s . ' ' . i
    endfor
    exe s
    let &grepprg = save
endfun
command! -nargs=? G call GitGrep(<f-args>)


fun! GitGrepWordInC()
    normal! "zyiw
    call GitGrep('-w -e ', getreg('z'), "-- '*.c' '*.cpp' '*.h'")
endfun
nmap <C-x>g :call GitGrepWordInC()<CR>

fun! GitGrepWord()
    normal! "zyiw
    call GitGrep('-w -e ', getreg('z'))
endfun
nmap <C-x>h :call GitGrepWord()<CR>


"""" cscope and ctags handling """"""""""""""""""""""" 

if has("cscope")
    set csprg=~/bin/cscope
    set csto=0
    set cst
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

map  <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>




"""" DSPC simulation environment compilation support

fun! CompileDebug()
    if filereadable("ArtMakefile")
        let &mp="gmake -f ArtMakefile -j20 MODE=DEBUG_64"
    elseif filereadable("GSMMakefile")
        let &mp="gmake -f GSMMakefile -j20 MODE=DEBUG"
    elseif filereadable("LteMakefile435")
        let &mp="gmake -f LteMakefile435 -j20 MODE=DEBUG_64"
    endif
    make
endfun

fun! CompileOpt()
    if filereadable("ArtMakefile")
        let &mp="gmake -f ArtMakefile -j20 MODE=INTEL_OPT_64"
    elseif filereadable("GSMMakefile")
        let &mp="gmake -f GSMMakefile -j20 MODE=INTEL_OPT"
    elseif filereadable("LteMakefile435")
        let &mp="gmake -f LteMakefile435 -j20 MODE=INTEL_OPT_64"
    endif
    make
endfun

nmap \mj :!update_build_env<CR>:cs reset <CR>
nmap \mm :call CompileDebug()<CR>
nmap \mi :call CompileOpt()<CR>



