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
set cinoptions=h0,N-s,{0,t0
set autoindent

" ===Tabs===
set tabstop=2  " show existing tab as 2 spaces
set softtabstop=2
set shiftwidth=2  " when indenting with '>', use 2 space width
set expandtab  " insert spaces instead of tab
set smarttab
" ===/Tabs===

" ===Vertical Columns===
set colorcolumn=80,120
" ===/Vertical Columns===

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
command QA qa
command Qa qa
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'arcticicestudio/nord-vim'

Plug 'ziglang/zig.vim'
Plug 'zah/nim.vim'
call plug#end()
" ===/Plugin Load===

set termguicolors
colorscheme nord

" ===vim-gitgutter===
set updatetime=100
" ===/vim-gitgutter===

" ===fzf===
nmap <C-P> :FZF<CR>
" ===/fzf===

" ===nord-vim===
let g:nord_cursor_line_number_background = 1
" ===/nord-vim===

" ===nim.vim===
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
" ===/nim.vim===
