" color sorcerer
color jellybeans 

"" Use vundle for handling bundles 
filetype off    " Needed for vundle turn it on later
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Vundle configuration                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Raimondi/delimitMate'
Bundle 'SirVer/ultisnips'
Bundle 'dantler/vim-alternate'
Bundle 'msanders/cocoa.vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'itchyny/lightline.vim'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'matthias-guenther/hammer.vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rbenv'
Bundle 'Valloric/MatchTagAlways'
" Bundle 'Valloric/vim-indent-guides'
" Bundle 'Valloric/YouCompleteMe'   
Bundle 'mhinz/vim-startify'
Bundle 'mhinz/vim-toplevel'
Bundle 'helino/vim-json'
Bundle 'tomtom/tcomment_vim'
Bundle 'suan/vim-instant-markdown'
Bundle 'wincent/Command-T'
Bundle 'vim-ruby/vim-ruby'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
" Bundle 'tpope/vim-vinegar'
Bundle 'airblade/vim-gitgutter'
Bundle 'jaxbot/github-issues.vim'
Bundle 'gregsexton/gitv'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                                    " Turn on line numbers
set guifont=Bitstream\ Vera\ Sans\ Mono:h13   " Set font and size
syntax enable
set background=dark
set laststatus=2
set textwidth=80                              " Forces screen size
highlight SignColumn guibg=black              " Set the gutter/sign to black

set nocompatible                " Do not act like vi
set encoding=utf-8
"set showcmd
set noshowmode                  " Don't show the mode
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Configurations                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:let mapleader = "'"                     " Change the leader key to a tick 
map <Leader>j :%!python -m json.tool<CR> " Set 'j to format a json file
set pastetoggle=<F4>

" The alt (option) key on macs now behaves like the 'meta' key. This means we
" can now use <m-x> or similar as maps. This is buffer local, and it can easily
" be turned off when necessary (for instance, when we want to input special
" characters) with :set nomacmeta.
if has("gui_macvim")
  set macmeta
endif

:nnoremap <CR> :nohlsearch<cr>

" Silver searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" White Space and Tabs                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap                      " don't wrap lines
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)

set autoindent                  " on new lines, match indent of previous line
set copyindent                  " copy the previous indentation on autoindenting
set cindent                     " smart indenting for c-like code
set cino=b1,g0,N-s,t0,(0,W4     " see :h cinoptions-values
set guioptions-=r
set guioptions-=L

autocmd FileType objc :setlocal sw=4 ts=4 sts=4   " Settings for ObjC 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" TODO: split this into separate plugin
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        execute "Ack " . l:pattern . ' %'
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
vnoremap <silent> gv :call VisualSearch('gv')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au BufWritePost *.c,*.cpp,*.h,*.m silent! !ctags -R &
set tags=./tags,tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extra Settings                                                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Ruby"
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"" Clang completion
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

"" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

"" Resource vimrc file when saved
au BufLeave ~/.vimrc :source ~/.vimrc

function! UpdateVimRC()
    for server in split(serverlist())
        call remote_send(server, '<Esc>:source $HOME/.vimrc<CR>')
    endfor
endfunction

augroup myvimrchooks
au!
   autocmd bufwritepost .vimrc call UpdateVimRC()
augroup END

set noerrorbells visualbell t_vb=

"" UltiSnips is missing a setf trigger for snippets on BufEnter
"autocmd vimrc BufEnter *.snippets setf snippets

" In UltiSnips snippet files, we want actual tabs instead of spaces for indents.
" US will use those tabs and convert them to spaces if expandtab is set when the
" user wants to insert the snippet.
"autocmd vimrc FileType snippets set noexpandtab

" When you type the first tab, it will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu            " completion with menu
set listchars=tab:▸\ ,eol:¬             " This changes the default display of tab and CR chars in list mode 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configurations                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alternate                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Set toggling between source and header files for Obj-C
"" :A :AS and :AT in new tab
autocmd FileType objc let g:alternateExtensions_h = "m" 
autocmd FileType objc let g:alternateExtensions_m = "h"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cocoa                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>l :ListMethods<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:CommandTMaxHeight          = 20
set wildignore+=*.o,*.obj,.git,*.pyc,*.so,blaze*,READONLY,llvm,Library*,CMakeFiles,*.class

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hammer                                                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This makes sure that the browser is opened in the background
if has("gui_macvim")
  let g:HAMMER_BROWSER_ARGS = '-g'
endif

nnoremap <leader>m :w<cr>:Hammer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? '⭠ '.fugitive#head() : ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Multicoursor                                                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_start_key='<F3>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling                                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F6> :call ToggleSpellchecker()<cr>
function! ToggleSpellchecker()
  if(&spell == 1)
    echo "Spell checker off"
    set nospell
  else
    echo "Spell checker on"
     set spell spelllang=en_us
  endif
endfunc

""
" Startify
"
let g:startify_change_to_vcs_root = 1
 "let g:startify_custom_header =
      "\ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
 
let g:startify_custom_header = [
      \ '   __      ___            ______ ____   ',
      \ '   \ \    / (_)           |____  |___ \ ',
      \ '    \ \  / / _ _ __ ___       / /  __) |',
      \ '     \ \/ / | | ''_ ` _ \     / /  |__ <',
      \ '      \  /  | | | | | | |   / /   ___) |',
      \ '       \/   |_|_| |_| |_|  /_(_) |____/ ',
      \ '',
      \ '',
      \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_objc_check_header = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
highlight SyntasticErrorSign guifg=red
highlight SyntasticWarningSign guifg=yellow
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular                                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" looks at the current line and the lines above and below it and aligns all the
" equals signs; useful for when we have several lines of declarations
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a/ :Tabularize /\/\//l2c1l0<CR>
vnoremap <Leader>a/ :Tabularize /\/\//l2c1l0<CR>
nnoremap <Leader>a, :Tabularize /,/l0r1<CR>
vnoremap <Leader>a, :Tabularize /,/l0r1<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar                                                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F1> :TagbarToggle<CR> 
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

let g:tagbar_type_puppet = {
    \ 'ctagstype': 'puppet',
    \ 'kinds': [
        \'c:class',
        \'s:site',
        \'n:node',
        \'d:definition'
      \]
    \}

let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:Heading_L1',
		\ 'i:Heading_L2',
		\ 'k:Heading_L3'
	\ ]
\ }

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tcomment                                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <D-/> gcc
" inoremap <D-/> call <Leader>__
" vnoremap <D-/> gc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" we can't use <tab> as our snippet key since we use that with YouCompleteMe
let g:UltiSnipsSnippetsDir         = $HOME . '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger       = "<m-s>"
let g:UltiSnipsListSnippets        = "<c-m-s>"
let g:UltiSnipsJumpForwardTrigger  = "<m-h>"
let g:UltiSnipsJumpBackwardTrigger = "<m-t>"
let g:snips_author                 = 'Ethan Bruning'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe                                                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1

