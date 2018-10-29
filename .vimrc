set title
set number
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2
"set cursorline

set wildmenu
set history=1000


set incsearch 
set ignorecase
set smartcase
set hlsearch

noremap <S-h> ^
noremap <S-l> $

noremap sh <C-w>h
noremap sj <C-w>j
noremap sk <C-w>k
noremap sl <C-w>l
noremap sw <C-w>w

inoremap <C-d> <BS>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>
" nerdTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" caw.vim
nmap <Space><Space> <Plug>(caw:hatpos:toggle)
vmap <Space><Space> <Plug>(caw:hatpos:toggle)


if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/yuigoto/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/yuigoto/.cache/dein')
  call dein#begin('/Users/yuigoto/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/yuigoto/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
	call dein#add('rdavison/libertine')
	call dein#add('scrooloose/syntastic')
	call dein#add('majutsushi/tagbar')
	call dein#add('szw/vim-tags')
	call dein#add('Yggdroot/indentLine')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('Shougo/neocomplete.vim')
	call dein#add('scrooloose/nerdtree')
  call dein#add('tyru/caw.vim.git')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
"colorscheme Apprentice
colorscheme libertine
"set t_Co=256
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

