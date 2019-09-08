set title
set number
set tabstop=1
set softtabstop=1
set autoindent
set smartindent
set shiftwidth=1
"set cursorline
set backspace=indent,eol,start

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
inoremap <silent>jj <ESC>

"nerdTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" caw
nmap <Space><Space> <Plug>(caw:hatpos:toggle)
vmap <Space><Space> <Plug>(caw:hatpos:toggle)
" clang-format
autocmd FileType c,cpp,objc ClangFormatAutoEnable

" 'Shougo/neocomplete.vim' {{{
let g:neocomplete#enable_at_startup = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {} 
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" }}}
"

" 'justmao945/vim-clang' {{{

" disable auto completion for vim-clang
let g:clang_auto = 0
" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

function! s:get_latest_clang(search_path)
    let l:filelist = split(globpath(a:search_path, 'clang-*'), '\n')
    let l:clang_exec_list = []
    for l:file in l:filelist
        if l:file =~ '^.*clang-\d\.\d$'
            call add(l:clang_exec_list, l:file)
        endif
    endfor
    if len(l:clang_exec_list)
        return reverse(l:clang_exec_list)[0]
    else
        return 'clang'
    endif
endfunction

function! s:get_latest_clang_format(search_path)
    let l:filelist = split(globpath(a:search_path, 'clang-format-*'), '\n')
    let l:clang_exec_list = []
    for l:file in l:filelist
        if l:file =~ '^.*clang-format-\d\.\d$'
            call add(l:clang_exec_list, l:file)
        endif
    endfor
    if len(l:clang_exec_list)
        return reverse(l:clang_exec_list)[0]
    else
        return 'clang-format'
    endif
endfunction

let g:clang_exec = s:get_latest_clang('/usr/bin')
let g:clang_format_exec = s:get_latest_clang_format('/usr/bin')

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

" }}}
" teramoko/jscomplete-vim
" myhere/vim-nodejs-complete
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

let g:node_usejscomplete = 1


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
	" call dein#add('scrooloose/syntastic')
	call dein#add('majutsushi/tagbar')
	call dein#add('szw/vim-tags')
	call dein#add('Yggdroot/indentLine')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('Shougo/neocomplete.vim')
	call dein#add('scrooloose/nerdtree')
  call dein#add('tyru/caw.vim.git')
	call dein#add('rhysd/vim-clang-format')
	call dein#add('kana/vim-operator-user')
	call dein#add('cohama/vim-insert-linenr')
	call dein#add('myhere/vim-nodejs-complete')
	" call dein#add('cohama/lexima.vim')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
colorscheme libertine
"set t_Co=256
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

