" Vim syntax file for TQFolder (CAFCore)
" See http://vim.wikia.com/wiki/Creating_your_own_syntax_files#Install_the_syntax_file

" Quit when a syntax file was already loaded.
if exists("b:current_syntax")
	finish
endif

syn match celComment "#.*$"
syn match celCut ".cutExpression"
syn match celWeight ".weightExpression"
syn match celTitle ".title"

" start of new cutblock
syn match celCutStart "+Cut.[^{]*"
" new cutblock started by @*/Cut...
syn match celAtStart "@\*\/.[^{]*"
" opening of cut definitions
syn match celAngBracket "[<>]"

syn region celExpr start='"' end='"' 

hi def link celComment          Comment
hi def link celCut              Statement
hi def link celWeight           Identifier
hi def link celTitle            Special
hi def link celExpr             String
hi def link celCutStart         ModeMsg
hi def link celAtStart          Tag
hi def link celAngBracket       Comment

let b:current_syntax = "def"
