" detect fileencodings properly
" based on http://stackoverflow.com/questions/5477565/how-to-setup-vim-properly-for-editing-in-utf-8
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
endif

scriptencoding utf-8                " set utf-8 encoding

set nocompatible                    " enable VIM options

syntax on                           " turn on syntax highlighting

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
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'Raimondi/delimitMate'
  Plugin 'guns/xterm-color-table.vim'
  Plugin 'henrik/vim-indexed-search'
  Plugin 'scrooloose/syntastic'

  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required - enables filetype detection for files, plugins, and indentation
  " To ignore plugin indent changes, instead use:
  "filetype plugin on

  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

  " see :h vundle for more details or wiki for FAQ
  " Put your non-Plugin stuff after this line
" Vundle Section End

" Plugin options
  let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']
  highlight ExtraWhitespace ctermbg=red

  let g:syntastic_auto_loc_list = 2
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_enable_balloons = 1
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_ignore_files = ['']
  let g:syntastic_loc_list_height = 5
  let g:syntastic_warning_symbol = '✗'
  let g:syntastic_style_error_symbol = '∆'
  let g:syntastic_style_warning_symbol = '∆'

set backspace=indent,eol,start      " allow backspacing over everything in insert mode

set history=1000                    " store lots of :cmdline history

set showcmd                         " show incomplete cmds down the bottom
set showmode                        " show current mode down the bottom

set modeline                        " enable modelines in files
set modelines=5                     " set the number of lines which are checked for a modeline

set incsearch                       " find the next match as we type the search
set hlsearch                        " hilight searches by default

set nowrap                          " dont wrap lines
set linebreak                       " wrap lines at convenient points

set ignorecase                      " ignore case when searching
set smartcase                       " if search uses case override ignorecase

" default tab options
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

set list                            " display tabs and trailing spaces
set listchars=trail:·,nbsp:·,precedes:«,extends:»,tab:•\ 
                                    " leave a trailing space at the end of the
                                    " tab option above 'tab:•\ '

set scrolloff=3                     " keep 3 lines of text on screen when vert scrolling
set sidescrolloff=7                 " keep 7 chars of test on screen when hor scrolling
set sidescroll=1                    " scroll 1 char at a time when side scrolling

set mouse=a                         " enable mouse support
set ttymouse=xterm2

call system('mkdir ~/.vim/undo')    " create undo dir
set undofile                        " save undo file on file close
set undodir=~/.vim/undo             " set the undodir
set undolevels=1000                 " how many undos to save
set undoreload=10000                " number of lines to save for undo

set t_Co=256                        " tell the term it has 256 colors

set hidden                          " hide buffers when not displayed


colorscheme desert                  " use desert which is included with VIM

if has('gui_running')               " set the background color based on gui_running
    set background=light
else
    set background=dark
endif

" check for vim spell feature and turn it on
if has('spell')
  set spelllang=en_us
  " set spelling highlight to no highlight and red text
  highlight SpellBad ctermfg=red ctermbg=NONE
  highlight SpellLocal ctermfg=red ctermbg=NONE
  highlight SpellCap ctermfg=red ctermbg=NONE
  highlight SpellRare ctermfg=red ctermbg=NONE
endif

" dont load csapprox if we no gui support - silences an annoying warning
if !has("gui")
    let g:CSApprox_loaded = 1
endif

" source local vim file if it exists
if filereadable(glob('~/.vimrc_local'))
  source ~/.vimrc_local
endif
