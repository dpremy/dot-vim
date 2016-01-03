set nocompatible " enable VIM options

syntax on        " turn on syntax highlighting

" Vundle Section Start
  "To install Vudle use:
  " git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    " For Windows git and curl are needed within the paths.

  "set the runtime path to include Vundle and initialize
    " Linux Vundle setup
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " Windows Vundle setup
    "set rtp+=~/vimfiles/bundle/Vundle.vim/
    "let path='~/vimfiles/bundle'
    "call vundle#begin(path)

  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'
  Plugin 'bling/vim-airline'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-sensible'
  Plugin 'godlygeek/tabular'

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
" Vundle Section End

set backspace=indent,eol,start      " allow backspacing over everything in insert mode

set history=1000                    " store lots of :cmdline history

set showcmd                         " show incomplete cmds down the bottom
set showmode                        " show current mode down the bottom

set incsearch                       " find the next match as we type the search
set hlsearch                        " hilight searches by default

set nowrap                          " dont wrap lines
set linebreak                       " wrap lines at convenient points

set ignorecase                      " ignore case when searching
set smartcase                       " if search uses case override ignorecase

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent smartindent

set smarttab                        " tab and backspace are smart

set foldmethod=indent               " fold based on indent
set foldnestmax=3                   " deepest fold is 3 level
set nofoldenable                    " dont fold by default

set wildmode=list:longest,full      " make cmdline tab completion similar to bash
set wildmenu                        " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~         " files to ignore when tab completing

set nobackup                        " prevent ~ backup files from being created

" display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set scrolloff=3                     " keep 3 lines of text on screen when vert scrolling
set sidescrolloff=7                 " keep 7 chars of test on screen when hor scrolling
set sidescroll=1                    " scroll 1 char at a time when side scrolling

filetype on                         " enable filetype detection
filetype plugin on                  " enable filetype-specific indenting
filetype indent on                  " enable filetype-specific plugins

set mouse=a                         " enable mouse support
set ttymouse=xterm2

set t_Co=256                        " tell the term it has 256 colors

colorscheme desert                  " included with Windows VIM

set hidden                          " hide buffers when not displayed

" dont load csapprox if we no gui support - silences an annoying warning
if !has("gui")
    let g:CSApprox_loaded = 1
endif

