" Vim syntax file
" Language:	paramtune
" Maintainer:	Mun Johl <mun_johl@sierralogic.com>
" Last Update:  Fri Feb 15 10:22:27 PST 2002

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

" Set the local value of the 'iskeyword' option
if version >= 600
   setlocal iskeyword=@,48-57,_,192-255,+,-,?
else
   set iskeyword=@,48-57,_,192-255,+,-,?
endif

" A bunch of useful paramtune keywords
" syn keyword paramtuneStatement   disable assign deassign force release

syn keyword paramtuneTodo contained TODO

syn match   paramtuneOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  paramtuneComment start="/\*" end="\*/" contains=paramtuneTodo
syn match   paramtuneComment "//.*" oneline contains=paramtuneTodo

syn match   paramtuneGlobal "`[a-zA-Z0-9_]\+\>"
syn match   paramtuneGlobal "$[a-zA-Z0-9_]\+\>"

syn match   paramtuneConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   paramtuneSection "\[.*\]"
syn match   paramtuneVar "\$\$.*\$\$"

syn match   paramtuneNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   paramtuneNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   paramtuneNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   paramtuneNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   paramtuneNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  paramtuneString start=+"+  end=+"+

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_paramtune_syn_inits")
   if version < 508
      let did_paramtune_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink paramtuneCharacter       Character
   HiLink paramtuneConditional     Conditional
   HiLink paramtuneSection         Conditional
   HiLink paramtuneVar             Label
   HiLink paramtuneRepeat          Repeat
   HiLink paramtuneString          String
   HiLink paramtuneTodo            Todo
   HiLink paramtuneComment         Comment
   HiLink paramtuneConstant        Constant
   HiLink paramtuneNumber          Number
   HiLink paramtuneOperator        Special
   HiLink paramtuneStatement       Statement
   HiLink paramtuneGlobal          Define

   delcommand HiLink
endif

let b:current_syntax = "paramtune"

" vim: ts=8
