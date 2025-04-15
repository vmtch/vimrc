set noerrorbells
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent
set relativenumber
set cursorline
set incsearch
set nobackup
set noswapfile

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

inoremap <silent> jj <ESC>
