" Vim syntax file
" Language:	SugarCpp

if exists("b:current_syntax")
  finish
endif

runtime! syntax/c.vim
unlet b:current_syntax

" C++ extensions
syn keyword cConstant		nullptr
syn keyword cppType			inline virtual explicit export bool wchar_t
syn match   cppCast		    "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match   cppCast		    "\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass	mutable
syn keyword cppStructure	class typename template namespace
syn keyword cppNumber		NPOS
syn keyword cppBoolean		true false


" SugarCpp extentions
syn clear   cUserLabel		" conflict with sugarcpp
syn keyword cRepeat			to downto by from in until
syn keyword cppStatement	new delete this friend using constexpr
syn match	cppStatement	/@\%(\I\i*\)\?/ display		" this pointer
syn keyword cppAccess		public protected private FlagAttribute ToString
syn keyword cInclude		import
syn keyword cppExceptions	throw try catch defer finally
syn keyword cppOperator		operator typeid and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq is isnt

" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
	command -nargs=+ HiLink hi def link <args>
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
