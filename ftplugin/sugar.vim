" Vim filetype plugin file
" Language:	SugarCpp
" Maintainer:	Yuxin Wu (ppwwyyxxc<at>gmail.com)
" fork from c.vim

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" Using line continuation here.
let s:cpo_save = &cpo
set cpo-=C

let b:undo_ftplugin = "setl fo< com< ofu<"

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setl fo-=t fo+=croql

" Set 'comments' to format dashed lists in comments.
setl comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setl expandtab		" sugarcpp does not recognize tab indent

let &cpo = s:cpo_save
unlet s:cpo_save
