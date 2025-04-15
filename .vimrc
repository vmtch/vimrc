" Install dein.vim
let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif

" settings for dein.vim
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    set runtimepath+=s:dein_repo_dir
endif

call dein#begin(s:dein_dir)

call dein#add('dracula/vim', {'name': 'dracula'})
call dein#add('Shougo/dein.vim')
call dein#add('preservim/nerdtree')
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-surround')

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
set laststatus=2

let loaded = 'yes'

if has('nvim')
    let b:copilot_enabled = 1
    set clipboard=unnamedplus
else
    syntax enable
    colorscheme dracula
endif
if exists('g:vscode')
    "Copilot disable
endif

hi Keyword cterm=none ctermfg=69

inoremap <silent> jj <ESC>

" settings for lightline
let g:lightline = {
    \'colorscheme': 'dracula'
\}
