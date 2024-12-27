set noerrorbells
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent
set number
set cursorline

let loaded = 'yes'

if has('nvim')
    let b:copilot_enabled = 1
    set clipboard=unnamedplus
else
    packadd! dracula
    syntax enable
    colorscheme dracula
endif
if exists('g:vscode')
    "Copilot disable
endif

hi Keyword cterm=none ctermfg=69


inoremap {<CR> {<CR>}<ESC><S-o>
inoremap (<CR> (<CR>)<ESC><S-o>
inoremap [<CR> [<CR>]<ESC><S-o>
inoremap [<SPACE> [<SPACE><SPACE>]<ESC>hi
inoremap {<SPACE> {<SPACE><SPACE>}<ESC>hi
inoremap (<SPACE> ()<ESC>i

function! SubstituteParentheses(parentheses)
    let char_under_cursor = getline('.')[col('.')-1:]
    let match_str = matchstr(char_under_cursor, '.\{-}'.a:parentheses)
    let match_len = strlen(match_str)
    echo(char_under_cursor . '|' . match_str . '|' . match_len)
    if match_str == ''
        return a:parentheses
    else
        return repeat("\<Right>", match_len)
    endif
endfunction

inoremap <expr> ) SubstituteParentheses(')')
inoremap )) )
inoremap <expr> } SubstituteParentheses('}')
inoremap }} }
inoremap <expr> ] SubstituteParentheses(']')
inoremap ]] ]

inoremap <silent> jj <ESC>
