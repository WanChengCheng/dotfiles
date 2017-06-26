set nocompatible              " be iMproved, required

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif


" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'                                          " Fast-move
Plug 'szw/vim-maximizer'                                                  " Maximize and restore current window
Plug 'scrooloose/nerdcommenter'                                           " Comments
Plug 'bling/vim-airline'                                                  " Status line
Plug 'vim-airline/vim-airline-themes'                                     " 

call plug#end()

"  Common Settings
"  ================================================================================

"  Color themes
if has('gui_running') && (strftime('%H') < 20 && strftime('%H') > 8)
  set background=light
else
  set background=dark
endif

augroup AssertClean
  autocmd!
augroup END

set encoding=utf-8                "set encoding for text
set number                        " show line numbers, always
syntax on                         " syntax on, always
set history=10000                 " Sets how many lines of history vim has to remember
set autoread                      " Set to auto read when a file is changed from the outside
set showcmd                       " show command in the last line
set autoindent                    "automatically indent to match adjacent lines

" Searching
set hlsearch                      " incremental searching
set incsearch                     " highlight matches
set ignorecase                    " searches are case insensitive,
set smartcase                     " unless they contain at least one capital


" Filetype detection
autocmd AssertClean BufRead,BufNewFile *.ipy set filetype=python

"  Whitespaces
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs

" for html/rb files, 2 spaces
autocmd AssertClean Filetype html setlocal ts=2 sw=2 expandtab
autocmd AssertClean Filetype ruby setlocal ts=2 sw=2 expandtab

" for js/coffee/jade files, 4 spaces
autocmd AssertClean Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd AssertClean Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab
autocmd AssertClean Filetype jade setlocal ts=4 sw=4 sts=0 expandtab

" List chars
set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is off and the line continues beyond the left of the screen


"  Auto-commands
"  ========================================
" Reload vimrc when edited
autocmd AssertClean BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc
      \ so $MYVIMRC | if has('gui_running') | source $MYGVIMRC | endif | AirlineRefresh


"  Key-maps
"  ========================================
"  map <leader> to tab
let mapleader="\<tab>"

" map jk to esc
inoremap jk <esc>

" Useful short-cuts inspired by Janus
" format the entire file
nnoremap <leader>fef :normal! gg=G``<cr>

" Useful short-cuts inspired by Janus
" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<cr>

"  convinient horizontal scroll
"  Scroll 20 characters to the right
nmap <c-l> 20zl
"  Scroll 20 characters to the left
nmap <c-h> 20zh

" U: Redos since 'u' undos
nnoremap U :redo<cr>

" Load macvim scripts
" 1. Use command 0~9 to switch tabs
source ~/Develop/projects/dotfiles/macvim-scripts.vim


"  Plugin Settings
"  ================================================================================

"  easy-motion
"  ========================================
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

"  nerd-tree
"  ========================================

"Toggle short-cuts
nmap <silent> <s-tab> :NERDTreeToggle<cr>

"  vim-maximizer
"  ========================================
nmap <silent> <leader>wo :MaximizerToggle<cr>

"  nerd-commenter
"  ========================================

" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

"  nerd-tree
"  ========================================
"  nerd-tree
"  ========================================
"  nerd-tree
"  ========================================
"  nerd-tree
"  ========================================
"  nerd-tree
"  ========================================
"  nerd-tree
"  ========================================
"  nerd-tree
"  ========================================
"  nerd-tree
"  ========================================
"  nerd-tree
"  ========================================
"  nerd-tree
"  ========================================
"  nerd-tree
"  ========================================
"  nerd-tree
"  ========================================
"  nerd-tree
"  ========================================

