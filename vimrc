"
" @file Vim config
"
" @copyright (c) 2008-2010, Christoph Kappel <unexist@dorfelite.net>
" @version $Id: .vimrc,v 267 2010/10/28 13:51:45 unexist $
"

" Options
set nocompatible
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set hlsearch
set nowrap
set ts=2
set bs=2
set sw=2
set ch=1
set scrolloff=2
set noexpandtab
set showmatch
set showmode
set shortmess=aIT
set foldmethod=marker
set encoding=utf-8
set autoindent
set smartindent
set number
set lazyredraw
set wildmode=list:longest,full
set wildignore=*.o,*.swp
set nobackup
set autowriteall
set noswapfile
set dy+=lastline
set dy+=uhex
set rulerformat=%l/%L(%p%%),%c

" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}

syntax on

colorscheme darkdevel

" Commandline
if has("cmdline_info")
  set ruler
  set showcmd
endif

" Nopaste
nnoremap <F12> :set invpaste paste?<CR>
imap <F12> <C-O><F12>
set pastetoggle=<F12>

" Filetype
if has("autocmd")
  filetype plugin on
  filetype indent off
endif

" Match
match ErrorMsg '\%>72v.\+'

" Usefull mappings
cmap w!! %!sudo tee > /dev/null %
