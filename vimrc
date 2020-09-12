"
" @file Vim config
"
" Some parts if this file are
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
set incsearch
set ignorecase
set smartcase
set nowrap
set sts=2
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
set fileencoding=utf-8
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
set grepprg=grep\ -nH\ $*
set listchars=trail:-,tab:→-,eol:⏎
set ttyfast
set nomodeline
let g:tex_flavor = "lualatex"
let g:rainbow_active = 1

" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}

set list
au FileType python set list et sts=4 ts=4 sw=4
au FileType tex set list et sts=4 ts=4 sw=4
au BufNewFile,BufRead /*.rasi setf css

syntax on

"colorscheme darkdevel
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
colorscheme kalisi
set background=dark
" Commandline
if has("cmdline_info")
  set ruler
  set showcmd
endif

" Filetype
if has("autocmd")
  filetype plugin on
  filetype indent off
endif

" Match
match ErrorMsg '\%>72v.\+'

" forgot sudo? tee has you covered, mate :)
cmap w!! %!sudo tee > /dev/null %

" requires ctags and the taglist plugin
" open/close traglist window
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 30
map <F4> :TlistToggle<cr>

" build taglist for current pwd
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
