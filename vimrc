set nocompatible
set noexrc

syntax enable

set background=dark
set novisualbell
colorscheme ir_black

set number
set numberwidth=4

filetype plugin on
filetype indent on

set shiftwidth=4
set softtabstop=4
set expandtab

set gfn=Monaco:h14
set shell=/bin/bash

set autoread

set linespace=0
set showcmd
set showmatch
set statusline=%F%m[%04l,%04v]
set laststatus=2

autocmd! bufwritepost vimrc source ~/.vimrc
