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
call dein#add('tpope/vim-repeat')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('github/copilot.vim')

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

let mapleader = "\<Space>"
nnoremap <silent> <Leader>j :<C-u>NERDTreeToggle<CR>

inoremap <silent> jj <ESC>

" terminal settings
function! ToggleTerminal()
  " Hide the terminal if there already exists a terminal
  for w in range(1, winnr('$'))
    if getbufvar(winbufnr(w), '&buftype') ==# 'terminal'
      execute w . 'wincmd w'
      execute 'hide'
      return
    endif
  endfor
  " Show the termianl if already exists
  for buf in range(1, bufnr('$'))
    if getbufvar(buf, '&buftype') ==# 'terminal'
    execute 'botright split'
    execute w . 'wincmd w'
    execute 'buffer' buf
    return
  endif
  endfor
  " Execute new terminal if not exists
  execute 'terminal'
endfunction

nnoremap <c-g> :call ToggleTerminal()<CR>
tnoremap <c-g> <C-\><C-n>:call ToggleTerminal()<CR>

" settings for lightline
let g:lightline = {
    \'colorscheme': 'dracula'
\}

" settings for indentguides
let g:indent_guides_enable_on_vim_startup=1
