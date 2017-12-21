" Vundle config {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate.git'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Color Schemes
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" Basics {{{
" default character encoding
set encoding=utf-8

" enable filetype detection and custom plugin/indent files
filetype plugin indent on

" enable syntax highlighting
syntax enable

" colorscheme
set background=dark
colorscheme molokai
" colorscheme jellybeans
" colorscheme badwolf

" airline plugin theme
let g:airline_theme='molokai'

" use default OS clipboard
set clipboard=unnamed

" set tab prefernces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" wrap lines
set wrap

" set line length
set textwidth=80

" add colored line so I know when line is long
set colorcolumn=80

" something
let delimitMate_expand_cr = 1
" }}}

" UI Config {{{
" show line numbers
set number

" use relative line numbers
set relativenumber

" show last command
set showcmd

" highlight current line
set cursorline

" visual autocomplete for commands
set wildmenu

" highlight matching [{()}]
set showmatch
" }}}

" Searching {{{
" intelligent case-sensitive search
set ignorecase
set smartcase

" global substitutions
set gdefault

" search as characters are entered
set incsearch

" highlight matches
set hlsearch
" }}}

" Folding {{{
" enable folding
set foldenable

" open most folds by default
set foldlevelstart=10

" nested fold max
set foldnestmax=10

" space open/closes folds
" nnoremap <space> za

" fold based on indent level
set foldmethod=indent
" }}}

" Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk


" highlight last inserted text
nnoremap gV `[v`]
" }}}

" Leader {{{
" change leader to comma
let mapleader=","

" toggle off highlight
nnoremap <leader><space> :nohlsearch<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
" }}}

" CtrlP {{{
" order matching files top to bottom
" let g:ctrlp_match_window = 'bottom,order:ttb'

" always open files in new buffers
" let g:ctrlp_switch_buffer = 0

" respect vim working directory changes
" let g:ctrlp_working_path_mode = 0

" find files using ag for better speed
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}

" UltiSnips and YouCompleteMe {{{
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }}}

" Tmux {{{
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" Autogroups {{{
" language-specific settings for certain filetypes/file extensions
augroup configgroup
    autocmd!
    autocmd BufWritePre *.php,*.py,*.js,*.h,*.c,*.java,*.md :call <SID>StripTrailingWhitespaces()
augroup END
" }}}

" Backups {{{
" enable backups
set backup
set writebackup

" don't create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" store backups, undos, and swap files in custom directory
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
" }}}

" Custom Functions {{{
" strips trailing whitespace at the end of files
" is called on buffer write in the autogroup above
function! <SID>StripTrailingWhitespaces()
    " save last search and cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}

" Organization {{{
" check final lines for modeline (file-specific settings)
set modelines=2

" use foldmethod=marker to fold by marker rather than indent and
" use foldlevel=0 to close folds by default
" vim:foldmethod=marker:foldlevel=0
" }}}
