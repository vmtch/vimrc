" settings for dein.vim
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    set runtimepath+=s:dein_repo_dir
endif

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')

call dein#end()

" fundamental settings
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
