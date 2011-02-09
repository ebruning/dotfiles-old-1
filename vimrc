"Used http://nvie.com/posts/how-i-boosted-my-vim/ to create vimrc

set nocompatible
set noexrc

"Use pathogen
"https://github.com/tpope/vim-pathogen.git
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" change the mapleader from \ to ,
let mapleader=","

"Edit and reload the vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"Open a new file without having to write the current buffer
set hidden

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set wildignore=*.swp,*.bak,*.pyc,*.class "Ignore certain files

set title	  "Change the terminals title

set visualbell           " don't beep
set noerrorbells         " don't beep

"No backups!
set nobackup
set noswapfile

filetype plugin indent on "Indenting intelligence

if has('autocmd')
	autocmd filetype python set expandtab	"Python specific settings
endif

"Syntax highlighting
set background=dark

if &t_Co >= 256 || has("gui_running")
	colorscheme mustang
	syntax on
elseif &t_Co > 2 || has("gui_running")
	"switch syntax highlighting on, when the terminal has colors
	colorscheme mustang "zenburn
	syntax on
endif

"Shows tabs and spaces >...
"TODO: May keep this
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

autocmd filetype html,xml set listchars-=tab:>. "Disable visible tabs for HTML,XML

"Then, when in insert mode, ready to paste, if you press <F2>, Vim will switch
"to paste mode, disabling all kinds of smartness and just pasting a whole
"buffer of text. Then, you can disable paste mode again with another press of
"<F2>. Nice and simple
set pastetoggle=<F2> "handle pasting large amounts of text

set mouse=a "Enable the mouse

"remaps : to ; ie to save a file ;w
nnoremap ; : 

"Clears highlighed searches
nmap <silent> ,/ :nohlsearch<CR>

"Allows you to sudo when already editing a file, use w!!
cmap w!! w !sudo tee % >/dev/null

set gfn=Monaco:h12
set shell=/bin/bash

