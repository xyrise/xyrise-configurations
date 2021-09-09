syntax on
filetype plugin indent on

let g:netrw_dirhistmax=0

set number
set relativenumber

set foldmethod=syntax
set nofoldenable

autocmd BufRead,BufNewFile *.tex set filetype=plaintex

" .h files as C instead of C++
let g:c_syntax_for_h = 1

" C++ Syntax Formatting
set cinoptions=h0N-s

" ===Tabs===
set tabstop=2  " show existing tab as 2 spaces
set softtabstop=2
set shiftwidth=2  " when indenting with '>', use 2 space width
set expandtab  " insert spaces instead of tab
set smarttab
" ===/Tabs===

" ===Whitespace Display===
set listchars+=lead:.
set list
" ===/Whitespace Display===

" ===Trim Trailing Whitespace===
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" ===/Trim Trailing Whitespace===

" ===WQE Capitalization Fix===
command E e
command W w
command Q q
command Wq wq
command WQ wq
" ===/WQE Capitalization Fix===

" ===Semicolon to Colon===
nnoremap ; :
" ===/Semicolon to Colon===

" ===Plugin Load===
call plug#begin(stdpath('data') . '/plugged')
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ziglang/zig.vim'
call plug#end()
" ===/Plugin Load===

" ===vim-gitgutter===
set updatetime=100
" ===/vim-gitgutter===

set termguicolors
colorscheme dracula
