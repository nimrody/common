" Following 2 lines are required for vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let maplocalleader = ","

" runtime macros/matchit.vim
let g:vundle_default_git_proto = 'git'


" let Vundle manage Vundle (required!)
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
" Bundle 'tpope/vim-rails'
" Bundle 'tpope/vim-bundler'
" Bundle 'Shougo/unite.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'flazz/vim-colorschemes'
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" Bundle 'DirDiff.vim'
Bundle 'matlab.vim'
Bundle 'gtags.vim'
Plugin 'https://github.com/fatih/vim-go'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 
let g:airline#extensions#tabline#show_tab_nr = 1

Plugin 'bling/vim-airline'
" Plugin 'WeiChungWu/vim-SystemVerilog'
Plugin 'jeetsukumaran/vim-buffergator'


" disable global saving of history, jumps, etc
set viminfo=
" enable per file saving of editor state
set viewoptions=cursor,folds,slash
Plugin 'restore_view.vim'



let g:DirDiffExcludes = ".git,obj,bin,HeaderFiles,_*,cscope*,Depend*,*.keep,*.contrib,*.keep.[1-9],*.contrib.[1-9],*.dll,*.a"
let g:DirDiffAddArgs = "-w" 

let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/tmp/ctrlp'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_max_files=0 
"let g:ctrlp_custom_ignore = '_*/*'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class     " MacOSX/Linux


set foldmethod=manual
set fdo-=search             "skip folded sections when searching

set exrc  " enable per-project vimrc
set encoding=utf8
filetype plugin on
filetype indent on
syntax on

" enable modeline vi:noai:sw=4 ts=6 at beginning and end of file
set modeline

set bs=2          "2 allows to use the backspace character (aka CTRL-H or
                  "<-") to use for moving the cursor over automatically
                  "inserted indentation and over the start/end of line. (see also the whichwrap option) 




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



set dir=/tmp
set nocompatible
set backup
set backupdir=~/tmp
set noswapfile       
set ignorecase
set smartcase       " override ignorecase if search pattern contains uppercase characters
set ruler
set laststatus=2    " always have the status line visible
"set statusline+=%f  " display filepath relative to current dir
set nowrap
set guioptions=agimrL
set incsearch       " incremental search

set t_Co=256
"colors torte
"colors quagmire "pacific "pablo "advantage
colorscheme desert256 "inkpot 256-grayvim gardner


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
au BufRead,BufNewFile *.json  set filetype=none
au! Syntax paramtune source ~/.vim/syntax/paramtune.vim

function! CurrentFile()
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
" au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif


" set tag file to the one in the current buffer directory (only in normal mode)
nmap \\ :set  tags=<C-R>=getcwd()."/tags" <CR><CR>:cs add cscope.out<CR>:cs reset<CR>
nmap ;; :cs reset<CR>

" a command line shortcut for the directory of the current file
cmap \\ <C-R>=expand("%:p:h")."/"<cr>

" wrap long lines - for checking error messages
nmap \pp :set wrap!<CR>

" Set scrollbind and switch window -- for comparing files line by line
nmap \sb :1<CR>:set scrollbind number<CR>^WW

nmap \be :CtrlPBuffer<CR>


" Shortcuts to scoll left-right without moving cursor
nmap <C-S-Right> zl
nmap <C-S-Left>  zh
nmap <C-S-Up>   <C-Y>
nmap <C-S-Down> <C-E>

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

" Use :call clearmatches() to clear
nnoremap <silent> <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" Switch between .h and .c 
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
"        :G -c pattern ... --- case sensitive search
"
" ^X G  -- search for pattern under cursor

fun! GitGrep(...)
    let save = &grepprg

    if a:1 == "-c"
        set grepprg=git\ grep\ -n\ $*
        let l = a:000[1:-1]
    else
        set grepprg=git\ grep\ -in\ $*
        let l = a:000
    endif
    let s = 'grep'

    for i in l
        let s = s . ' ' . i
    endfor
    exe s
    let &grepprg = save
endfun
command! -nargs=+ G call GitGrep(<f-args>)

" Get word under cursor and search all C files in git repository
fun! GitGrepWordInC()
    normal! "zyiw
    call GitGrep('-w -e ', getreg('z'), "-- '*.c' '*.cpp' '*.h'")
endfun
nmap <C-x>g :call GitGrepWordInC()<CR>

fun! GitGrepWordInM()
    normal! "zyiw
    call GitGrep('-w -e ', getreg('z'), "-- '*.m' ")
endfun
nmap <C-x>m :call GitGrepWordInM()<CR>

" Get word under cursor and search *all* files in git repository
fun! GitGrepWord()
    normal! "zyiw
    call GitGrep('-w -e ', getreg('z'))
endfun
nmap <C-x>h :call GitGrepWord()<CR>

" Search for current filename
fun! GitGrepFilename()
    call GitGrep('-w -e ', expand('%:t:r'))
endfun
nmap <C-x>f :call GitGrepFilename()<CR>

"""" cscope and ctags handling """"""""""""""""""""""" 

if has("cscope")
set csprg=~/bin/gtags-cscope
    set csto=0
    "set cst
    set nocsverb
    " add any database in current directory
    if filereadable("GTAGS")
        cs add GTAGS
        " else add database pointed to by environment
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
endfun

fun! CompileOpt()
    if filereadable("ArtMakefile")
        let &mp="gmake -f ArtMakefile -j20 MODE=INTEL_OPT_64"
    elseif filereadable("GSMMakefile")
        let &mp="gmake -f GSMMakefile -j20 MODE=INTEL_OPT"
    elseif filereadable("LteMakefile435")
        let &mp="gmake -f LteMakefile435 -j20 MODE=INTEL_OPT_64"
    endif
endfun

nmap \mj :!update_build_env<CR>:cs reset <CR>
" make: compile only
nmap \mm :call CompileDebug()<CR>:make<CR>
nmap \mi :call CompileOpt()<CR>:make<CR>
" build: clean and compile
nmap ]mm :call CompileDebug()<CR>:make clean<CR>:make<CR>
nmap ]mi :call CompileOpt()<CR>:make clean<CR>:make<CR>


nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('pt')
        let g:unite_source_grep_command = 'pt'
        let g:unite_source_grep_default_opts = '--nogroup --nocolor'
        let g:unite_source_grep_recursive_opt = ''
endif


set diffexpr=DiffW()
fun! DiffW()
        let opt = ""
        if &diffopt =~ "icase"
                let opt = opt . "-i "
        endif
        if &diffopt =~ "iwhite"
                let opt = opt . "-w " " vim uses -b by default
        endif
        silent execute "!diff -a --binary " . opt .
                                \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfun

fun! NextMFunc()
    call clearmatches()
    " let l:search_string = '^\s*\(\[.*\]\s*=\s*\)*\(\w\+\)\s*('
    let l:search_string = '^[^%]\+=\s*\(\w\+\)\s*('
    call search(l:search_string, 'e')
    let l:search_result = matchstr("testingThis", '\zs\(.*\)')
    let @/=l:search_result 
    normal! b"zyiwE
    call matchadd('Search', getreg('z') .  '\%' . line('.') . 'l')
endfun

nmap 11 :call NextMFunc()<CR>


" Perform a literal search of what was typed
function! LiteralSearch(string) range
    let l:pattern = escape(a:string, '\\/.*$^~[]')
    let @/ = l:pattern
    normal n
endfun
command -nargs=1 LS call LiteralSearch (<f-args>) 

" Search for visually selected text
" Using v_# goes backwards at first, but requires N to
" continue backwards - unlike searching with ?
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

function! VisualSearch(direction)
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    let @/ = l:pattern
    let @" = l:saved_reg
    if a:direction == 'f'
        normal n
    else
        normal N
    endif 
endfun

nmap <C-G> :echo @% . " ( " . expand("%:p") ")"<CR>

function! ToggleColorScheme()
    if g:colors_name == 'desert256'
        colorscheme inkpot
    else
        colorscheme desert256
    endif
endfun
nmap <S-F5> :call ToggleColorScheme()<CR>


" Move between tabs using ctrl-1..5
" map  <C-1>      1gt
" imap <C-1> <C-O>1gt
" map  <C-2>      2gt
" imap <C-2> <C-O>2gt
" map  <C-3>      3gt
" imap <C-3> <C-O>3gt
" map  <C-4>      4gt
" imap <C-4> <C-O>4gt
" map  <C-5>      5gt
" imap <C-5> <C-O>5gt

" Useful commands """"""""""""""""""""""""""
"  :e ++ff=unix    Re-load file in unix mode (effectively showing ^Ms)
"
"

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>0 :tablast<cr>

noremap <C-Left> :tabprevious<CR>
noremap <C-Right> :tabnext<CR>


set guifont="Droid Sans Mono 11"

command Json :%!python -m json.tool

command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')

