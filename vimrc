"" Turn on pathogen
call pathogen#infect()

"" Turn on line numbers
set number

" Set font and size
set guifont=Inconsolata-g:h13

" Set theme
syntax enable
"color twilight
color ir_black
set background=dark

" Change the leader key to a tick 
:let mapleader = "'"

" Do not act like vi
set nocompatible
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
":set transparency=15

"" Resource vimrc file when saved
au BufLeave ~/.vimrc :source ~/.vimrc

"" statusline
set statusline=%f\ %y\ [lines=%L]\ [x=%04v][y=%04l][%p%%]
set laststatus=2

"" Clang completion
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

"" Plugin configurations

"" Turn on NerdTree. Toggle with NerdTreeToggle
"autocmd vimenter * NERDTree

"" Set toggling between source and header files for Obj-C
"" :A :AS and :AT in new tab
autocmd FileType objc let g:alternateExtensions_h = "m" 
autocmd FileType objc let g:alternateExtensions_m = "h"

"" Cocoa.vim settings
map <leader>l :ListMethods

"" Settings for NERDTree
map <F2> :NERDTreeToggle<CR>

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
