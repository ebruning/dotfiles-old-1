"" Turn on pathogen
call pathogen#infect()

"" Turn on line numbers
set number

" Set font and size
set guifont=Bitstream\ Vera\ Sans\ Mono:h13

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

"" Settings for YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

"" Cocoa.vim settings
map <leader>l :ListMethods

"" Settings for NERDTree
map <F2> :NERDTreeToggle<CR>

"" Setting for Tagbar
nmap <F3> :TagbarToggle<CR>
let tlist_objc_settings    = 'objc;i:interface;c:class;m:method;p:property'

" add a definition for Objective-C to tagbar
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }
