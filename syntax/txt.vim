" Vim universal .txt syntax file
" Language:     txt
" Maintainer:   Beomjoon Goh
" Last Change:  9 Dec 2019
"
" This is modified version of 'Vim universal .txt syntax file' by Tomasz Kalkosiński.
" See
"   http://www.vim.org/scripts/script.php?script_id=1532
"   https://github.com/vim-scripts/txt.vim

if exists("b:current_syntax")
  finish
endif

syn case ignore

syn cluster txtAlwaysContains add=txtTodo,txtError
syn cluster txtContains       add=txtNumber,txtOperator,txtLink


" Common strings & Cites
syn match   txtString       "[[:alpha:]]" contains=txtOperator
syn region  txtCite         start="\""    end="\""        contains=@txtContains,@txtAlwaysContains

" Opertors & Numbers
syn match   txtOperator     "[~\-_+*<>=|#@$%&\\/:&\^\.,!?]"
syn match   txtNumber       "\d"

" Comments
syn region  txtBlockComment start="\/\*"  end="\*\/"      contains=@txtAlwaysContains
syn region  txtComment      matchgroup=txtComment     start="#"     end="$"         contains=@txtAlwaysContains              oneline
"syn region  txtDelims       matchgroup=txtOperator    start="<"     end=">"         contains=@txtContains,@txtAlwaysContains oneline
"syn region  txtDelims       matchgroup=txtParenthesis start="{"     end="}"         contains=@txtContains,@txtAlwaysContains oneline
"syn region  txtDelims       matchgroup=txtParenthesis start="\["    end="\]"        contains=@txtContains,@txtAlwaysContains oneline 
syn match   txtDelims  "[()\[\]{};]"

" Link
syn match   txtLink         "\(http\|https\|ftp\)\(\w\|[\-&=,?\:\.\/]\)*"   contains=@txtOperator

" Changelog tags: add, chg, rem, fix
syn match   txtChangelogs   "\<add\>\s*:" contains=txtOperator
syn match   txtChangelogs   "\<chg\>\s*:" contains=txtOperator
syn match   txtChangelogs   "\<rem\>\s*:" contains=txtOperator
syn match   txtChangelogs   "\<del\>\s*:" contains=txtOperator
syn match   txtChangelogs   "\<fix\>\s*:" contains=txtOperator

syn keyword txtTodo   todo fixme xxx note
syn keyword txtError  error bug
syn keyword txtDebug  debug

syn case match

" Define the default highlighting.
highlight def link txtNumber              Number
highlight def link txtString              Normal
highlight def link txtOperator            Number
highlight def link txtCite                String
highlight def link txtBlockComment        Ignore
highlight def link txtComment             Comment
highlight def link txtDelims              Delimiter
highlight def link txtLink                Special
highlight def link txtSmile               PreProc
highlight def link txtError               Error
highlight def link txtTodo                Todo
highlight def link txtDebug               Debug
highlight def link txtChangelogs          Keyword

let b:current_syntax = "txt"
" vim: ts=8
