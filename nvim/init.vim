" Why something strange happens when I source this file:
" https://unix.stackexchange.com/questions/74758/

"""""""""""""""""""""""""""""""""""""""""""""""""""
"  Filetype-dependent settings, folding etc.      "
"""""""""""""""""""""""""""""""""""""""""""""""""""

set scrolloff=5
set foldenable
set foldmethod=manual "zf to fold some lines

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
    " use za to toggle folding
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

"""""""""""""
"  Plugins  "
"""""""""""""

call plug#begin('~/.vim/bundle')
Plug 'michaeljsmith/vim-indent-object' " ai ii aI
Plug 'kana/vim-textobj-user' " necessary for the following
Plug 'kana/vim-textobj-entire' " ae ie - some problems :(
Plug 'tommcdo/vim-exchange'  " cx<motion> cxx X(visual) cxc(cancel)
Plug 'A-Ih/argtextobj.vim' " aa ia
Plug 'cdelledonne/vim-cmake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'haya14busa/incsearch.vim'
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'psliwka/vim-smoothie'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/vcscommand.vim'
Plug 'mhinz/vim-signify'
call plug#end()

""""""""""""""""""
"  Motion remap  "
""""""""""""""""""

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

"""""""""""""""""
"  VimStartify  "
"""""""""""""""""
" {{{ "
" NOTE: specific for my personal computer
let g:startify_bookmarks = [ '~/.config/nvim', '~/.vim', '~/term-5', '~/term-4',
            \ '~/term-3', '~/term-2', '~/term-1', '~/term-all', '~/personal']
" }}} "
""""""""""""""""
"  ArgTextObj  "
""""""""""""""""
"{{{
let g:argtextobj_pairs="(:),<:>,{:}"
"}}}

"""""""""""""""""""""
"  HighlightedYank  "
"""""""""""""""""""""
 au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=750}

"""""""""""""
"  Airline  "
"""""""""""""
"{{{

let g:airline#extensions#keymap#enabled = 1 "показывать текущий маппинг
let g:airline#extensions#branch#enabled = 1
let g:airline_section_y = ""  " by default does something
let g:airline_section_z = "Ln:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode

"}}}
"""""""""""""""
"  IncSearch  "
"""""""""""""""
" {{{
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
" }}}
"""""""""""""""
"  UltiSnips  "
"""""""""""""""

let g:UltiSnipsExpandTrigger="<Tab>"

"kostil"
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

""""""""""""
"  VimTeX  "
""""""""""""
" {{{
let g:tex_flavor='pdfLaTeX'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
" for some reason the following line break gui:
" hi Conceal ctermbg=none
hi clear Conceal
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
" https://www.reddit.com/r/vim/comments/6j0hx9/trying_to_compile_a_tex_file_and_open_the_pdf_in/
" <localleader>ll - to open the pdf

autocmd FileType tex nnoremap <buffer><F8> :VimtexCompile<CR>
autocmd FileType tex nnoremap <buffer><F6> :VimtexView<CR>
" }}}
"""""""""""""
"  fzf.vim  "
"""""""""""""
" {{{
nnoremap <silent> ,c :Commands<CR>
nnoremap <silent> ,f :Files<CR>
nnoremap <silent> ,h :Helptags<CR>
nnoremap <silent> ,b :Buffers<CR>
nnoremap <silent> ,s :Snippets<CR>
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
" }}}
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

colorscheme onehalfdark
set wildmenu
nnoremap Y v$y

nnoremap <ScrollWheelUp> <C-Y>
nnoremap <S-ScrollWheelUp> <C-U>
nnoremap <ScrollWheelDown> <C-E>
nnoremap <S-ScrollWheelDown> <C-D>

"search and replace the selection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Learn VimScript the hard way                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight trailing spaces and TODOs:
match Error /\v\s+$/
2match Underlined /\vTODO[^.]*/
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
" nnoremap <leader>n :cnext<cr>
" nnoremap <leader>p :cprevious<cr>


"""""""""
"  Ale  "
"""""""""
" {{{
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_info = 'ii'
let g:ale_sign_style_error = 'st'
let g:ale_sign_style_warning = 'st'
" let g:airline#extensions#ale#enabled=1

" do not move to ftplugin, it won't work!
" let g:ale_completion_enabled = 1

let g:ale_cursor_detail=0

let g:ale_set_highlights=0

" let g:ale_completion_enabled=1

let g:ale_linters= {
            \ 'python' : ['flake8'],
            \ 'cpp' : ['clangd', 'clang-tidy'],
            \ }

" }}}

""""""""""""""""""""""""""""""""
"  Risky non-portable comands  "
""""""""""""""""""""""""""""""""

set mouse=a
