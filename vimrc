"color kalisi
color jellybeans 

filetype off    " Needed for vundle turn it on later
"set rtp+=~/.vim/bundle/Vundle.vim/
"call vundle#rc()
"Plugin 'gmarik/Vundle.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Plugins                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'dantler/vim-alternate'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'sjl/gundo.vim'
Plug 'helino/vim-json'
Plug 'tomtom/tcomment_vim'
Plug 'wincent/Command-T'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'Keithbsmiley/swift.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tomswartz07/vim-todo'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                                    " Turn on line numbers
set guifont=Inconsolata-dz\ for\ powerline:h12
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
set tags=~/vim/tags,./tags,tags,.tags

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
" Lightline                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
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
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

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

let g:syntastic_java_javac_classpath = '/Users/ethan/bin/sdk/platforms/android-19/*.jar:/Users/ethan/Dropbox/Mobile/Libs/2.0.2/Android/*.jar:../bin/classes'

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
let g:ycm_global_ycm_extra_conf = '~/dotfiles/ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1

" XML formatter
function! DoFormatXML() range
	" Save the file type
	let l:origft = &ft

	" Clean the file type
	set ft=

	" Add fake initial tag (so we can process multiple top-level elements)
	exe ":let l:beforeFirstLine=" . a:firstline . "-1"
	if l:beforeFirstLine < 0
		let l:beforeFirstLine=0
	endif
	exe a:lastline . "put ='</PrettyXML>'"
	exe l:beforeFirstLine . "put ='<PrettyXML>'"
	exe ":let l:newLastLine=" . a:lastline . "+2"
	if l:newLastLine > line('$')
		let l:newLastLine=line('$')
	endif

	" Remove XML header
	exe ":" . a:firstline . "," . a:lastline . "s/<\?xml\\_.*\?>\\_s*//e"

	" Recalculate last line of the edited code
	let l:newLastLine=search('</PrettyXML>')

	" Execute external formatter
	exe ":silent " . a:firstline . "," . l:newLastLine . "!xmllint --noblanks --format --recover -"

	" Recalculate first and last lines of the edited code
	let l:newFirstLine=search('<PrettyXML>')
	let l:newLastLine=search('</PrettyXML>')
	
	" Get inner range
	let l:innerFirstLine=l:newFirstLine+1
	let l:innerLastLine=l:newLastLine-1

	" Remove extra unnecessary indentation
	exe ":silent " . l:innerFirstLine . "," . l:innerLastLine "s/^  //e"

	" Remove fake tag
	exe l:newLastLine . "d"
	exe l:newFirstLine . "d"

	" Put the cursor at the first line of the edited code
	exe ":" . l:newFirstLine

	" Restore the file type
	exe "set ft=" . l:origft
endfunction

command! -range=% FormatXML <line1>,<line2>call DoFormatXML()

nmap <silent> <leader>x :%FormatXML<CR>
vmap <silent> <leader>x :FormatXML<CR>

"Added by android-vim:
set tags+=/Users/ethan/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'

