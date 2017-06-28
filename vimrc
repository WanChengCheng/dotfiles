set nocompatible              " be iMproved, required

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'gosukiwi/vim-atom-dark'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ton/vim-bufsurf'                                                    " Navigation between buffers
Plug 'easymotion/vim-easymotion'                                          " Fast-move
Plug 'szw/vim-maximizer'                                                  " Maximize and restore current window
Plug 'scrooloose/nerdcommenter'                                           " Comments
Plug 'bling/vim-airline'                                                  " Status line
Plug 'vim-airline/vim-airline-themes'                                     " Status line theme
" Plug 'Shougo/unite.vim'                                                   " Fuzzy Search
Plug 'tpope/vim-fugitive'                                                 " git
Plug 'jiangmiao/auto-pairs'                                               " Editing, brackets
Plug 'kana/vim-textobj-user'                                              " define custmized text object
Plug 'kana/vim-textobj-line'                                              " al, il
Plug 'tpope/vim-surround'                                                 " text object
Plug 'terryma/vim-smooth-scroll'                                          " smooth scroll
Plug 'thinca/vim-quickrun'                                                " Run with current buffer
Plug 'terryma/vim-expand-region'                                          " fast visual select
Plug 'junegunn/vim-easy-align'                                            " make your life 'easier'
Plug 'pangloss/vim-javascript'                                            " vastly improved js
" Maybe I want it for lisp, but not for now :)
"Plug 'junegunn/rainbow_parentheses.vim'                                   " parentheses more smart

Plug 'mxw/vim-jsx'                                                        " React support
Plug 'beloglazov/vim-online-thesaurus'                                    " Search current word quick and easy
Plug 'nathanaelkane/vim-indent-guides'                                    " indent guide line

" fzf is great, but it cannot work smoothly with macvim(gvim)... for now
" I still use fzf in terminal, but for macvim, I think Unite/Denite + Ag
" should be better.
"Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'                       " fzf search, I've installed fzf already

Plug 'Shougo/denite.nvim'                                                 " more Unite!

call plug#end()

" Playground
"
" Ctrl-c: (C)hange (c)urrent directory
nmap <c-c> [unite]d
" Ctrl-/: A more powerful '/'
nmap <c-_> [unite]l
" Playground

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

set encoding=utf-8                " set encoding for text
set number                        " show line numbers, always
syntax on                         " syntax on, always
set history=10000                 " Sets how many lines of history vim has to remember
set autoread                      " Set to auto read when a file is changed from the outside
set showcmd                       " show command in the last line
set autoindent                    " automatically indent to match adjacent lines


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

" Don't insert comment leader when I'm using o and O to insert new lines
" But should append comment leader if i'm using <enter>
set formatoptions-=o
set formatoptions+=r

"  Key-maps
"  ========================================
"  map <leader> to tab
"  perhaps comma is better, I use <leader>w and something like this alot.
"  but still some mappings like <leader>h  <leader>l
"  just keep it tab.
let mapleader="\<tab>"

" map jk to esc
inoremap jk <esc>

" turn-off search highlight when pressing <esc>
nmap <esc> :nohls<cr>

" Useful short-cuts inspired by Janus
" format the entire file
nnoremap <leader>fef :normal! gg=G``<cr>

" Useful short-cuts inspired by Janus
" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<cr>

"  I prefer quick navigating windows with this key-bindings now.
"  convinient horizontal scroll
"  Scroll 20 characters to the right
"nmap <c-l> 20zl
"  Scroll 20 characters to the left
"nmap <c-h> 20zh

"  Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"  since I never use the return key in normal mode. Then it is effortless to cycle through the splits.
nnoremap <cr> <c-w>w

" U: Redos since 'u' undos
nnoremap U :redo<cr>

" Bufsurf back
nnoremap <silent> <leader>h :BufSurfBack<CR>

" Bufsurf forward
nnoremap <silent> <leader>l :BufSurfForward<CR>

" _ : Quick horizontal splits
nnoremap _ :sp<cr>

" | : Quick vertical sjlits
nnoremap <bar> :vsp<cr>

" useful delete mapping
inoremap <C-d> <Del>

" easy to move lines around
" reference: https://dockyard.com/blog/2013/09/26/vim-moving-lines-aint-hard
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Load macvim scripts
" 1. Use command 0~9 to switch tabs
"  ================================================================================
source ~/Develop/projects/dotfiles/macvim-scripts.vim


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

" Toggle short-cuts
nmap <silent> <s-tab> :NERDTreeToggle<cr>

" Hide certain files
let NERDTreeIgnore=['\~$', '\.swp$', '.git$[[dir]]']

"  vim-maximizer
"  ========================================
nmap <silent> <leader>wo :MaximizerToggle<cr>

"  nerd-commenter
"  ========================================

" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

"  vim-airline
"  ========================================
if has('gui_running')
  let g:airline_powerline_fonts=1
endif
let g:airline_theme='wombat'
" let g:airline_extensions = ['branch', 'quickfix', 'syntastic']

"  fugitive
"  ========================================
nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>ga :Gwrite<cr>
nnoremap <Leader>gr :Gremove<cr>
nnoremap <Leader>gp :Git push<cr>


"  AutoPair
"  ========================================
"  For macvim only, auto-pair predefined short-cuts are all combined with
"  metakeys.
if has("gui_macvim")
  set macmeta
endif

"  smooth-scroll
"  ========================================
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"  vim-expand-region
"  ========================================
" J: expand-region
vmap K <Plug>(expand_region_expand)

" K: shrink-region
vmap J <Plug>(expand_region_shrink)

"  vim-easy-align
"  ========================================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"  online-tresaurus
"  ========================================

let g:online_thesaurus_map_keys = 0

nnoremap <leader>s :OnlineThesaurusCurrentWord<CR>

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

