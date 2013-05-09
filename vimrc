<<<<<<< HEAD
<<<<<<< HEAD
"" Turn on line numbers
=======
" Turn on line numbers
>>>>>>> b670927a086ce0855edb1a97e695be8c14867f29
=======
" Turn on line numbers
>>>>>>> b670927a086ce0855edb1a97e695be8c14867f29
set number

" Set font and size
set guifont=Inconsolata-g:h13

" Set theme
<<<<<<< HEAD
<<<<<<< HEAD
color grb256 
=======
color grb256
>>>>>>> b670927a086ce0855edb1a97e695be8c14867f29
=======
color grb256
>>>>>>> b670927a086ce0855edb1a97e695be8c14867f29

" Change the leader key to a tick 
:let mapleader = "'"

" Do not act like vi
set nocompatible
syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

" Handle white space
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Set transparency
:set transparency=15
