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

" Initial Configs END


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
set ts=4 sw=4			" Tab is 4 spaces

" Change color of the search highlight
hi Search cterm=NONE ctermfg=black ctermbg=red

" Vim configs END

" coc extensions
let g:coc_global_extensions = [
	\ 'coc-ultisnips',
	\ 'coc-html',
	\ 'coc-go',
	\ 'coc-css',
	\ 'coc-json',
	\ 'coc-pyright',
	\ 'coc-texlab',
	\ 'coc-emmet',
	\ 'coc-tsserver',
	\ 'coc-sh',
	\ 'coc-markdownlint'
\ ]
" -- coc extensions END

" -- plugin installation
call plug#begin()

" - General
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'} 	" https://github.com/preservim/nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin' 			" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'		" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
Plug 'preservim/nerdcommenter'				" https://github.com/preservim/nerdcommenter
Plug 'ryanoasis/vim-devicons'  				" https://github.com/ryanoasis/vim-devicons
Plug 'airblade/vim-gitgutter' 				" https://github.com/airblade/vim-gitgutter
Plug 'mkitt/tabline.vim'       				" https://github.com/mkitt/tabline.vim
Plug 'vim-airline/vim-airline' 				" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes'		" https://github.com/vim-airline/vim-airline-themes
" Plug 'SirVer/ultisnips'					" https://github.com/SirVer/ultisnips
Plug 'neoclide/coc.nvim', {'branch': 'release'}     	" https://github.com/neoclide/coc.nvim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }		" https://github.com/junegunn/fzf.vim

" - Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } 	" https://github.com/fatih/vim-go

" - HTML
Plug 'mattn/emmet-vim' 						" https://github.com/mattn/emmet-vim
" - Themes
Plug 'NLKNguyen/papercolor-theme' 			" https://github.com/NLKNguyen/papercolor-theme
Plug 'joshdick/onedark.vim'					" https://github.com/joshdick/onedark.vim
call plug#end()

" plugin END


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

" NERDTree custom keybinds
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>

" Nerdcommenter keymaps 
map <leader>cs <Plug>NERDCommenterToggle
map <leader>cc <Plug>NERDCommenterAppend
map <leader>cb <Plug>NERDcommenterSexy

" Keybindings END


" -- NERD configs

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Changing fonts and stuff
let g:NERDTreeGitStatusUseNerdFonts=1
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" NERDCommenter configs
let g:NERDCreateDefaultMappings=0
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTraillingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" NERD END


" -- ultisnips configs

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"

hi clear Conceal

"Close preview window when autocomplete is done
augroup completion_preview_close
	  autocmd!
	  autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
augroup END

" ultisnips END


" Theme

set termguicolors
set background=dark
colorscheme onedark

" -- Theme END

" Coc configuration 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" -- Coc END

let g:airline_powerline_fonts = 1
set rtp+=/usr/local/opt/fzf

" latex
let g:tex_flavor = "latex"

" html
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" let g:user_emmet_expandabbr_key='<Tab>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

