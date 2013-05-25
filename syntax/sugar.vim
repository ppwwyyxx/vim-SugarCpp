" Vim syntax file
" Language:	SugarCpp

if exists("b:current_syntax")
  finish
endif

runtime! syntax/c.vim
unlet b:current_syntax

" C++11 extensions
syn keyword cConstant		nullptr
syn keyword cppType			inline virtual explicit export
syn match   cppCast		    "\<\(const\|static\|dynamic\|reinterpret\|duration\)_cast\s*<"me=e-1
syn match   cppCast		    "\<\(const\|static\|dynamic\|reinterpret\|duration\)_cast\s*$"
" TODO use better match
syn match	cppType			"\<\(int\|bool\|float\|double\|short\|long\|char\|size_t\|void\|signed\|unsigned\)&"me=e-1
syn keyword cppStorageClass	mutable
syn keyword cppStructure	class typename template namespace
syn keyword cppNumber		NPOS
syn keyword cppStatement	new delete this friend using constexpr
syn keyword cppBoolean		true false
syn keyword cppAccess		public protected private
syn keyword cppExceptions	throw try catch
syn keyword cppOperator		operator typeid and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq


" SugarCpp extentions
syn clear   cUserLabel		" conflict with sugarcpp

syn keyword SugarType			string tuple
syn match	SugarType			"\<\(string\)&"me=e-1

syn keyword SugarConditional	when then where
syn keyword SugarRepeat			to downto by from in until loop
syn match	SugarStatement	/@\%(\I\i*\)\?/ display					" this pointer
syn keyword SugarAccess		FlagAttribute ToString
syn keyword SugarInclude	import
syn keyword SugarExceptions	defer finally
syn keyword SugarOperator		is isnt

" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
	command -nargs=+ HiLink hi def link <args>
	HiLink SugarConditional cConditional
	HiLink SugarRepeat		cRepeat
	HiLink SugarStatement	cppStatement
	HiLink SugarAccess		cppAccess
	HiLink SugarInclude		cInclude
	HiLink SugarExceptions  cppExceptions
	HiLink SugarOperator	cppOperator
	HiLink SugarType		cppType

	HiLink cppAccess		cppStatement
	HiLink cppCast			cppStatement
	HiLink cppExceptions	Exception
	HiLink cppOperator		Operator
	HiLink cppStatement		Statement

	HiLink cppSTL			Identifier
	HiLink cppSTLType		Identifier

	HiLink cppType			Type
	HiLink cppStorageClass	StorageClass
	HiLink cppStructure		Structure
	HiLink cppNumber		Number
	HiLink cppBoolean		Boolean
	delcommand HiLink
endif

let b:current_syntax = "sugar"
