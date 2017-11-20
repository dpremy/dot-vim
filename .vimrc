" File Encoding Settings
" -------------------------------------------------------------------------------------
  " Properly detect fileencodings
  " Based on http://stackoverflow.com/questions/5477565/how-to-setup-vim-properly-for-editing-in-utf-8
  if has("multi_byte")
    if &termencoding == ""
      let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
  endif

  " Set utf-8 Encoding
  scriptencoding utf-8

" Vundle Section Start
" -------------------------------------------------------------------------------------
  "To install Vundle use:
  " git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  "set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
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

" Plugin Options
" -------------------------------------------------------------------------------------
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

  let g:airline_theme='minimalist'

" VIM Options
" -------------------------------------------------------------------------------------
  " Enable VIM options
  set nocompatible

  " Set the term to 256 colors
  set t_Co=256

  " Turn on syntax highlighting
  syntax on

  " Hide buffers when not displayed
  set hidden

  " Allow backspacing over everything in insert mode
  set backspace=indent,eol,start

  " Set the :cmdline history
  set history=1000

  " Show incomplete cmds in status
  set showcmd

  " Show current mode in status
  set showmode

  " Enable modeline checking of files and look for modelines in the first x lines
  set modeline
  set modelines=5

  " Tab options
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set autoindent smartindent
  set smarttab

  " Window split directions
  set splitbelow
  set splitright

  " Folding options
    " Don't fold by default, fold based on indent, and no deeper than 3 levels
    set nofoldenable
    set foldmethod=indent
    set foldnestmax=3

  " Wildmode options
    " make cmdline tab completion similar to bash
    set wildmode=list:longest,full

    " Enable ctrl-n and ctrl-p to scroll thru matches
    set wildmenu

    " Files to ignore when tab completing
    set wildignore=*.o,*.obj,*~

  " Prevent ~ backup files from being created
  set nobackup

  " Display tabs and trailing spaces
  set list

  " Set characters to be show for various indentations when no text follows the indentation
    " Note: Leave a trailing space at the end of the tab option ie. 'tab:•\ '
  set listchars=trail:·,nbsp:·,precedes:«,extends:»,tab:•\ 

  " Window scrolling options
    " Keep 3 lines of text on screen when vert scrolling
    set scrolloff=3

    " Keep 7 chars of test on screen when hor scrolling
    set sidescrolloff=7

    " Scroll 1 char at a time when side scrolling
    set sidescroll=1

  " Enable mouse support
  set mouse=a
  set ttymouse=xterm2

  " Undo options
    " Create user undo directory
    call system('mkdir ~/.vim/undo')

    " Set the undodir
    set undodir=~/.vim/undo

    " Save undo files on file close
    set undofile

    " Set undo levels to be saved
    set undolevels=1000

    " Set number of lines to save for undo
    set undoreload=10000

" Custom Key Mappings
" -------------------------------------------------------------------------------------
  " Indent lines without losing the current selection
  xnoremap <  <gv
  xnoremap >  >gv

" Search Options
" -------------------------------------------------------------------------------------
  " Find the next search match as it is typed
  set incsearch

  " Highlight searches by default
  set hlsearch

  " Ignore case when searching 
  set ignorecase

  " If search uses case override ignorecase
  set smartcase

  " Disable line wrapping
  set nowrap

  " Wrap lines at convenient points
  set linebreak

" Color Options
" -------------------------------------------------------------------------------------
  colorscheme desert

  " set the background color based on gui_running
  if has('gui_running')
      set background=light
  else
      set background=dark
  endif

" Color Options
" -------------------------------------------------------------------------------------
  " Check for VIM spell feature and turn it on
  if has('spell')
    set spelllang=en_us
    " set spelling highlight to no highlight and red text
    highlight SpellBad ctermfg=red ctermbg=NONE
    highlight SpellLocal ctermfg=red ctermbg=NONE
    highlight SpellCap ctermfg=red ctermbg=NONE
    highlight SpellRare ctermfg=red ctermbg=NONE
  endif

  "  Prevent loading of CSApprox if there is no gui support
  if !has("gui")
      let g:CSApprox_loaded = 1
  endif

" Source Local vimrc Configs
" -------------------------------------------------------------------------------------
  " Source the ~/.vimrc_local file if it exists
  if filereadable(glob('~/.vimrc_local'))
    source ~/.vimrc_local
  endif
