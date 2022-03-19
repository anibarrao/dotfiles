"
"" Vim configurations by Anderson Ibarra
" These are the custom configurations of Neovim as my default IDE for web dev 
"
" Here are consigned the custom keybindings, appearence and Plugins that i use
" for my daily work at web dev. I hope you find this vimrc useful and can
" reply any configuration  you like. 
"


" -- Initial configs

let mapleader = " " 		" Set a different leader key
set encoding=UTF-8 		" Enable utf-8 encoding
set nocompatible 		" Some plugins needs it enabled

" -- Initial Configs END


" -- Vim configs

set number relativenumber 	" Set numbers in lines
set autoindent 			" Autoidentation
filetype plugin indent on 	" Enable configuration per files
set hlsearch			" Highlight all previous search
set ruler			" Show cursor line,column number. Also the relative position of the cursor. 
set colorcolumn=120		" Set the default column position for keep text aligned
set vb				" Enable visual bell.
set mouse=a			" Enable mouse in all modes
set clipboard=unnamed		" Enables sharing between system clipboard and vim clipboard
set noscrollbind		" Disable multiple scroll
set wildmenu			" Completes as in zsh
set autochdir			" Changes the work directory to the one which the file belongs 

" Change color of the search highlight
hi Search cterm=NONE ctermfg=black ctermbg=red

" -- Vim configs END


" -- Plugin installation



" -- Custom Keybindings 

" Screw the arrowkeys, this is vim
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" use jj and kk as shorcut to enter in normal mode
imap jj <Esc>
imap kk <Esc>

" Remap enter to discard previous search
nnoremap <silent> <CR> :noh<CR><CR>

" -- Keybindings END
