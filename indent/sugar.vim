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
  let lnum = prevnonblank(v:lnum - 1)
  if lnum == 0 | return 0 | endif
  let indent = indent(lnum)
  let cindent = indent(v:lnum)
  let increase = indent + &sw
  if indent == indent(lnum)
    let indent = cindent <= indent ? -1 : increase
  endif
  return indent
endf
