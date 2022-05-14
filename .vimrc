" plugin
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'keith/swift.vim'
Plugin 'lervag/vimtex'
Plugin 'valloric/youcompleteme'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'mattn/emmet-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'avakhov/vim-yaml'
Plugin 'aserebryakov/vim-todo-lists'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'tomlion/vim-solidity'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>t :TagbarToggle<CR>
nmap <silent> <leader>m :w<CR>:make<CR>
nmap <silent> <leader>p :w<CR>:!pdflatex % && rm %<.aux %<.out %<.log && open %<.pdf<CR><CR>
nmap <silent> <leader>f :w<CR>:FormatCode<CR>

" tab
set tabstop=4 softtabstop=4 shiftwidth=4 smarttab
set expandtab

set nu
set hlsearch    " highlight search result

set pastetoggle=<C-b>
set noswapfile
set smartcase

set mouse=a
set ttymouse=xterm2

set colorcolumn=80
set ignorecase

"** Appearance **"
syntax on
set t_Co=256

set background=dark
colorscheme jellybeans

" Airline theme (https://github.com/vim-airline/vim-airline/wiki/Screenshots)
" NOTE: lightline can be an alternative which is lighter than airline
let g:airline_theme='angr'

"** NREDTree tab **"
" Start NERDTree
" autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

" close nerdtree is it's the last file in buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

nmap <silent> <leader><tab> :w<CR>:!reindent %<CR>:e<CR>

" youcompleteme
let g:ycm_confirm_extra_conf = 0 
map <C-]> :YcmCompleter GoToImprecise<CR>

" make youcompleteme work with eclimd
let g:EclimCompletionMethod = 'omnifunc'

" set shorter timeout to speed up ESC responses
set timeoutlen=1000 ttimeoutlen=0

" fixes the backspace not working issue in Python
set backspace=indent,eol,start

" ejs
au BufNewFile,BufRead *.ejs set filetype=html

" inserts python breakpoint
map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>

" ale linters
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'c': ['cpplint'],
\   'markdown': ['prettier'],
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
            \'python': ['autopep8', 'yapf']
            \}

let g:ale_completion_enabled = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:vimtex_compiler_latexmk = {'callback' : 0}

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

set tabstop=4 shiftwidth=4 expandtab
