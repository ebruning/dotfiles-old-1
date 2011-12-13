"Used http://nvie.com/posts/how-i-boosted-my-vim/ to create vimrc
" Set colors to 256
" Added when syntax highlighting was lost
" set t_Co=256

set nocompatible
set noexrc
syntax enable
set encoding=utf-8
set showcmd						" display incomplete commands
filetype plugin indent on       " load file type plugins + indentation


" Used for Gundo.vim
" nnoremap <F5> :GundoToggle<CR>

"Open a new file without having to write the current buffer
set hidden

" Viewer/Whitepace
set nowrap        				" don't wrap lines
set tabstop=4     				" a tab is four spaces
set shiftwidth=4
set number        				" always show line numbers
set expandtab
set backspace=indent,eol,start  " backspace through everything in insert mode


" Searching
set hlsearch      				" highlight search terms
set incsearch     				" show search matches as you type
set ignorecase    				" ignore case when searching
set smartcase     				" ignore case if search pattern is all lowercase,
                  				" case-sensitive otherwise

" Plugins
"Use pathogen
"https://github.com/tpope/vim-pathogen.git
call pathogen#infect()

"set wildignore=*.swp,*.bak,*.pyc,*.class "Ignore certain files

"set title	  "Change the terminals title

set visualbell           " don't beep
set noerrorbells         " don't beep

"No backups!
set nobackup
set noswapfile

"Syntax highlighting
set background=dark

"colorscheme mustang
if &t_Co >= 256 || has("gui_running")
       "echo "256"
       colorscheme mustang
       syntax on
elseif &t_Co > 2 || has("gui_running")
       "switch syntax highlighting on, when the terminal has colors
       "echo "2"
       colorscheme mustang "zenburn
       syntax on
endif

"Shows tabs and spaces >...
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.

"Then, when in insert mode, ready to paste, if you press <F2>, Vim will switch
"to paste mode, disabling all kinds of smartness and just pasting a whole
"buffer of text. Then, you can disable paste mode again with another press of
"<F2>. Nice and simple
set pastetoggle=<F2> "handle pasting large amounts of text

"set mouse=a "Enable the mouse

"remaps : to ; ie to save a file ;w
nnoremap ; : 

"Clears highlighed searches
"nmap <silent> ./ :nohlsearch<CR>

"Allows you to sudo when already editing a file, use w!!
cmap w!! w !sudo tee % >/dev/null

set gfn=Monaco:h14
set shell=/bin/bash
set lines=50 columns=90
