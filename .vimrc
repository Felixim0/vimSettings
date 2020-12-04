" " Cleanup

" " Basic settings

set nocompatible
syntax on
set nowrap
set encoding=utf8

set directory=.swp/,~/.vim/swp/,/tmp//
set backupdir=.backup/,~/.vim/backup/,/tmp//
set undodir=.undo/,~/.vim/undo/,/tmp//

filetype off

" " Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Sensible defaults
Plugin 'tpope/vim-sensible'

" Information
Plugin 'liuchengxu/vim-which-key'

" Text manipulation
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" Buffer maniuplation
Plugin 'qpkorr/vim-bufkill'
Plugin 'mtth/scratch.vim'

" Motions
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'

" Editing
Plugin 'tpope/vim-commentary'

" Source Control
Plugin 'tpope/vim-fugitive'

" File browsing
Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-vinegar'

" TMux integration
Plugin 'tpope/vim-tbone'

call vundle#end()
filetype plugin indent on

" " Omni completion
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" " Easymotion

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_use_smartsign_us = 1

" " Bufkill
let g:BufKillCreateMappings = 0

" augment searching
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  ? <Plug>(easymotion-sn)
omap ? <Plug>(easymotion-Tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" replace substitute
nmap s <Plug>(easymotion-s)

" use Ag if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" " Mappings

let g:mapleader = "\<Space>"
let g:maplocalleader = ','

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>

let g:wk_map = {}

let g:wk_map.f = {'name': '+file'}

let g:wk_map.f.v = {'name': '+vim'}
nnoremap <silent> <leader>fve :edit $MYVIMRC<CR>
let g:wk_map.f.v.e = 'edit-vimrc'
nnoremap <silent> <leader>fvr :source $MYVIMRC<CR>:echom "Vimrc reloaded!"<CR>
let g:wk_map.f.v.r = 'reload-vimrc'

nnoremap <silent> <leader>ft :NERDTreeToggle<CR>

nnoremap <silent> <leader>fs :w<CR>:echom "File saved!"<CR>
let g:wk_map.f.s = 'save-file'


let g:wk_map.b = {'name': '+buffers'}

nnoremap <silent> <leader>bn :bnext<CR>
let g:wk_map.b.n = 'Next Buffer'
nnoremap <silent> <leader>bp :bprev<CR>
let g:wk_map.b.p = 'Prev Buffer'

nnoremap <silent> <leader>bc :new<CR>
let g:wk_map.b.c = 'Create Buffer'
nnoremap <silent> <leader>bd :bdel<CR>
let g:wk_map.b.d = 'Delete Buffer'
nnoremap <silent> <leader>bl :buffers<CR>
let g:wk_map.b.l = 'List Buffers'

nnoremap <silent> <leader>b1 :buffer 1<CR>
nnoremap <silent> <leader>b2 :buffer 2<CR>
nnoremap <silent> <leader>b3 :buffer 3<CR>
nnoremap <silent> <leader>b4 :buffer 4<CR>
nnoremap <silent> <leader>b5 :buffer 5<CR>
nnoremap <silent> <leader>b6 :buffer 6<CR>
nnoremap <silent> <leader>b7 :buffer 7<CR>
nnoremap <silent> <leader>b8 :buffer 8<CR>
nnoremap <silent> <leader>b9 :buffer 9<CR>

let g:wk_map.w = {'name': '+windows'}

nnoremap <silent> <leader>wk <C-w>k
let g:wk_map.w.k = 'window-up'
nnoremap <silent> <leader>wj <C-w>j
let g:wk_map.w.j = 'window-down'
nnoremap <silent> <leader>wl <C-w>l
let g:wk_map.w.l = 'window-right'
nnoremap <silent> <leader>wh <C-w>h
let g:wk_map.w.h = 'window-left'

nnoremap <silent> <leader>wK <C-w>K
let g:wk_map.w.K = 'move-window-up'
nnoremap <silent> <leader>wJ <C-w>J
let g:wk_map.w.J = 'move-window-down'
nnoremap <silent> <leader>wL <C-w>L
let g:wk_map.w.L = 'move-window-right'
nnoremap <silent> <leader>wH <C-w>H
let g:wk_map.w.H = 'move-window-left'

nnoremap <silent> <leader>ws :split<CR>
let g:wk_map.w.s = 'vertical-split'
nnoremap <silent> <leader>wv :vsplit<CR>
let g:wk_map.w.v = 'horizontal-split'

nnoremap <silent> <leader>w= <C-w>=
"let g:wk_map.w.= = 'equalize-windows'

let g:wk_map.t = {'name': '+tabs'}

nnoremap <silent> <leader>tn :tabnext<CR>
let g:wk_map.t.n = 'next-tab'
nnoremap <silent> <leader>tp :tabprev<CR>
let g:wk_map.t.p = 'prev-tab'
nnoremap <silent> <leader>tc :tabnew<CR>
let g:wk_map.t.c = 'new-tab'
nnoremap <silent> <leader>td :tabclose<CR>
let g:wk_map.t.d = 'del-tab'

let g:wk_map.p = {'name': '+plugins'}

nnoremap <silent> <leader>pi :source $MYVIMRC<CR>:PluginInstall<CR>
let g:wk_map.p.i = 'plugins-install'


set timeoutlen=500
call which_key#register('<Space>', "g:wk_map")


