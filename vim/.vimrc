filetype on
filetype indent on
syntax on                           " Turn on syntax highlighting
colorscheme habamax 

set autoindent                      " Copy indent from current line when starting a new line
set number                          " Line number
set cursorline                      " Highlight the text line of the cursor
set expandtab                       " Use spaces instead of tabs
set tabstop=2                       " 1 tab == 2 spaces
set shiftwidth=2 smarttab
set showmode                        " Shows -- INSTER --, -- VISUAL --, -- SELECT -- depending on the current mode
set showcmd
set showmatch                       " When a bracket is inserted, briefly jump to the matching one
set hlsearch                        " When there is a previous search pattern, highlight all its matches
set wildmenu                        " When 'wildmenu' is on, command-line completion operates in an enhanced mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion, the possible matches are shown.
set wildmode=full
set visualbell                      " Use visual bell instead of beeping
set ignorecase                      " Ignroe case when searching
set laststatus=2                    " Always show the status line
set mouse=a                         " Automatically enable mouse usage

let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
" if <bar> is not working try |
nnoremap <leader>e :tabnew <bar> Ex<CR>
nnoremap <leader>E :Ex<CR>
nnoremap <leader>s :Sex<CR>
nnoremap <leader>l :Vex<CR>
nnoremap [ :tabnext<CR>
nnoremap ] :tabprevious<CR>

nnoremap <C-h>  <C-w>h
nnoremap <C-j>  <C-w>j
nnoremap <C-k>  <C-w>k
nnoremap <C-l>  <C-w>l

