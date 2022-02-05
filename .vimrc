set foldenable
set foldmethod=manual

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set textwidth=80
set nohls

set cursorline
set number

" File settings {{{
augroup ftype_group
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType cpp,c,h,hpp setlocal ts=2 sts=2 sw=2 foldenable foldmethod=syntax
    autocmd FileType java,hs,js,tex,latex setlocal foldenable foldmethod=syntax
    autocmd FileType txt,text,tex,latex setlocal spell spelllang=ru,en
augroup END
" }}}

filetype plugin indent on
set encoding=utf-8
set nocompatible
syntax enable

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
" Text objects and actions on them
Plug 'michaeljsmith/vim-indent-object' " ai ii aI
Plug 'kana/vim-textobj-user' " necessary for the following plugin
Plug 'kana/vim-textobj-entire' " ae ie
Plug 'tommcdo/vim-exchange'  " cx<motion> cxx X(visual) cxc(cancel)
Plug 'machakann/vim-highlightedyank'
Plug 'A-Ih/argtextobj.vim' " aa ia (original plugin conflicts with my mappings)
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'haya14busa/incsearch.vim'
" Misc
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'cdelledonne/vim-cmake'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Appearence
Plug 'vim-airline/vim-airline'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'zhou13/vim-easyescape' might not be that necessary
" Plug 'psliwka/vim-smoothie' a regular scrollbar in gvim is better
call plug#end()

"""""""""""""""
"  IncSearch  "
"""""""""""""""
" {{{1 "
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
set ignorecase
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" 1}}} "
"""""""""""""""""""""
"  HighlightedYank  "
"""""""""""""""""""""
" {{{2 "
if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
endif
" }}} "

"""""""""""""""
"  UltiSnips  "
"""""""""""""""
" {{{ "
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsListSnippets="<c-Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" }}} "
""""""""""""""""
"  ArgTextObj  "
""""""""""""""""
"{{{
let g:argtextobj_pairs="(:),<:>,{:}"
"}}}
"""""""""""""
"  Airline  "
"""""""""""""
"{{{
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_section_y = ""  " by default does something
let g:airline_section_z = "Ln:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
"}}}
"""""""""""""
"  fzf.vim  "
"""""""""""""
" {{{
nnoremap <silent> ,f :Files<CR>
nnoremap <silent> ,h :Helptags<CR>
nnoremap <silent> ,b :Buffers<CR>
nnoremap <silent> ,s :Snippets<CR>
nnoremap <silent> ,c :Commands<CR>
nnoremap <silent> ,l :Lines<CR>
" }}}
""""""""""""""
"  Floaterm  "
""""""""""""""
" {{{
let g:floaterm_position='bottom'
let g:floaterm_width=1.0
let g:floaterm_autoclose=2
let g:floaterm_keymap_toggle = ',tt'
nnoremap ,td :FloatermSend cd %:p:h<CR>
" }}}
"""""""""""""""""
"  VimStartify  "
"""""""""""""""""
" {{{ "
" NOTE: specific for my personal computer
let g:startify_bookmarks = [ '~/.vimrc', '~/.vim', '~/term-5', '~/term-4',
            \ '~/term-3', '~/term-2', '~/term-1', '~/term-all', '~/personal']
" }}} "
""""""""""""""
"  NerdTree  "
""""""""""""""
" {{{
set autochdir
let NERDTreeChDirMode=2
nnoremap <silent> <F1> :NERDTreeToggle<CR>
" }}}
""""""""""""""""
"  EasyEscape  "
""""""""""""""""
" {{{
" I used to use EasyEscape, but now the vanilla mappings are okay for me
inoremap jk <ESC>
inoremap kj <ESC>
cnoremap jk <ESC>
cnoremap kj <ESC>
tnoremap jk <ESC>
tnoremap kj <ESC>
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             My personal commands                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

"search and replace the selection (I rarely use it, might delete soon)
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" }}}

if has('gui_running')
    " NOTE: be careful when using this on other machines, FiraCode is not a
    " default font
    set guifont=FiraCodeMedium\ 16
endif

"kostil"
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


""""""""""""""""""
"  Motion remap  "
""""""""""""""""""
" Can't live without these
"{{{
noremap ; l
noremap l k
noremap k j
noremap j h

noremap о h
noremap л j
noremap д k
noremap ж l

inoremap <m-j> <Left>
inoremap <m-k> <Down>
inoremap <m-l> <Up>
inoremap <m-;> <Right>

tnoremap <m-j> <Left>
tnoremap <m-k> <Down>
tnoremap <m-l> <Up>
tnoremap <m-;> <Right>

cnoremap <m-j> <Left>
cnoremap <m-k> <Down>
cnoremap <m-l> <Up>
cnoremap <m-;> <Right>

" translate to russian

inoremap <m-о> <Left>
inoremap <m-л> <Down>
inoremap <m-д> <Up>
inoremap <m-ж> <Right>

tnoremap <m-о> <Left>
tnoremap <m-л> <Down>
tnoremap <m-д> <Up>
tnoremap <m-ж> <Right>

"move to the next window in normal mode
nnoremap <space>j <C-w>h
nnoremap <space>k <C-w>j
nnoremap <space>l <C-w>k
nnoremap <space>; <C-w>l

"convenient insert-mode mappings

inoremap <m-o> <esc>o
inoremap <m-щ> <esc>o

" move lines up/down and preserve the correct indentation
inoremap <C-k> <esc>:move .+1<CR>==
inoremap <C-l> <esc>:move .-2<CR>==
" :move is an interesting command btw, gotta use it a bit more
" the change.txt help file is in itself a very interesting thing

"}}}
"""""""""""""
"  Helpers  "
"""""""""""""
" highlight trailing spaces and TODOs:
match Error /\v\s+$/
2match Underlined /\vTODO[^.]*/

""""""""""""
"  Themes  "
""""""""""""
colorscheme onehalflight
let g:airline_theme='onehalflight'

set termguicolors
" my handmade export of gnome terminal tango theme
let g:terminal_ansi_colors = ['#2E3436', '#CC0000', '#4E9A06', '#C4A000',
\ '#3465A4', '#75507B', '#06989A', '#D3D7CF', '#555753', '#EF2929', '#8AE234',
\ '#FCE94F', '#729FCF', '#AD7FA8', '#34E2E2', '#EEEEEC']
