" Vim indent file
" Language: SugarCpp
" This an indent file which does no indentation

if exists("b:did_indent")
  finish
endif

unlet! b:did_indent
let b:did_indent = 1

setl indentexpr=GetSugarIndent()
setl indentkeys=

" Only define the function once.
if exists("*GetSugarIndent")
  finish
endif

function! GetSugarIndent()		" Disable All Indent
  let cindent = indent(v:lnum)
  return cindent
endf
