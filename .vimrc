" Disable vi compatibility mode as plugins and other
"  features in this configuration require the iMproved featureset
set nocompatible

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

" Vundle Installation
" -------------------------------------------------------------------------------------
  " To manually install Vundle use:
  "  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  " disable filetype detection, required for Vundle plugin installation.
  "  filetype detection is re-enabled after Vundle
  filetype off

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "  call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " plugins
    " vim configuration
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-sensible'
    Plugin 'godlygeek/tabular'
    Plugin 'ntpeters/vim-better-whitespace'
    Plugin 'Raimondi/delimitMate'
    Plugin 'guns/xterm-color-table.vim'
    Plugin 'google/vim-searchindex.git'
    Plugin 'vim-syntastic/syntastic'
    Plugin 'altercation/vim-colors-solarized'

    " file syntax
    Plugin 'PProvost/vim-ps1'
    Plugin 'pearofducks/ansible-vim'

  " All of your Plugins must be added before the following line
  call vundle#end()

  " enable filetype detection for files, plugins, and indentation
  filetype plugin indent on

  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

  " see :h vundle for more details or wiki for FAQ

" Vundle Managed Plugin Options
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

  let g:ansible_unindent_after_newline = 1

" Built-in Plugin Options
" -------------------------------------------------------------------------------------
  " Configure vim netrw file browser
  let g:netrw_banner=0
  let g:netrw_liststyle=3

" VIM Options
" -------------------------------------------------------------------------------------
  " Turn on syntax highlighting
  syntax on

  " Turn on line numbers and cursor line highlighting
  set number
  set cursorline

  " Hide buffers when not displayed
  set hidden

  " Use an open window when switching between buffers
  set switchbuf=useopen

  " Allow backspacing over everything in insert mode
  set backspace=indent,eol,start

  " Set the :cmdline history
  set history=1000

  " Show incomplete cmds in status
  set showcmd

  " Show current mode in status
  set showmode

  " Enable modeline checking of files and look for modelines in the first 5 lines
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

  " Don't fold by default, fold based on indent, and no deeper than 3 levels
  set nofoldenable
  set foldmethod=indent
  set foldnestmax=3

  " Disable line wrapping
  set nowrap

  " Wrap lines at convenient points
  set linebreak

  " Enable tab-completion for all file related tasks, enables searching of files in subfolders
  set path=.,**

  " Wildmode options
    " make cmdline tab completion similar to bash
    set wildmode=list:longest,full

    " ignore case when using wildmode
    set wildignorecase

    " Enable ctrl-n and ctrl-p to scroll thru matches
    set wildmenu

    " Files to ignore when tab completing
    set wildignore=*.swp,*.bak,*.tmp,*.temp,*.cache,*.dll,*~
    set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
    set wildignore+=tags

  " Display tabs and trailing spaces
  set list

  " Set characters to be show for various indentations when no text follows the indentation
  " Note: Leave a trailing space at the end of the tab option ie. 'tab:•\ '
  set listchars=trail:·,nbsp:·,precedes:«,extends:»,tab:•\ 

  " Window scrolling options
    " Keep 3 lines of text on screen when vertically scrolling
    set scrolloff=3

    " Keep 7 chars of text on screen when horizontal scrolling
    set sidescrolloff=7

    " Scroll 1 char at a time when side scrolling
    set sidescroll=1

  " Enable mouse support
  set mouse=a
  set ttymouse=xterm2

  " Directory options
    " Create protected user swap directory
    call system('umask 027; mkdir ~/.vim/swap')

    " Set the backupdir
    set directory=~/.vim/swap/

  " Backup options
    " Create protected user backup directory
    call system('umask 027; mkdir ~/.vim/backup')

    " Set the backupdir
    set backupdir=~/.vim/backup/

    " Save undo files on file close
    set backup

  " Undo options
    " Create protected user undo directory
    call system('umask 027; mkdir ~/.vim/undo')

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

  " List buffers and then populate the buffer prompt
  nnoremap gb :ls<CR>:b<Space>

  " Use | and - to split windows
  map <Bar>   <C-W>v<C-W><Right>
  map -       <C-W>s<C-W><Down>

  " Use Tab and Shift-Tab to switch windows
  map <Tab>   <C-W>w
  map <Esc>[Z <C-W>W

  " Use Ctrl+c to close window
  map <C-c>   <C-W>c

  " Use ml to add current config as modeline to the top of file
  function! PrependModeline()
    let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :", &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    call append(line("^"), l:modeline)
  endfunction
  map ml :call PrependModeline()<CR>

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

" Color Options
" -------------------------------------------------------------------------------------

  " never set t_Co directly, let vim pick up color support from the terminal as designed
  " https://sunaku.github.io/vim-256color-bce.html

  " set vim comment color to dark green, not the default blue, for all colorschemes
  au ColorScheme * highlight Comment ctermfg=darkgreen guifg=#719e07

  " set the line numbers to use the same bg color as vim itself, for all colorschemes
  au ColorScheme * highlight LineNr ctermbg=NONE guibg=NONE

  " set the cursor line numbers to use the a grayfg, for all colorschemes
  au ColorScheme * highlight CursorLineNr ctermfg=12 guifg=gray

  " load the desert colorscheme, and then silently attempt to load solarized if installed
  colorscheme desert
  silent! colorscheme solarized

" Spell Options
" -------------------------------------------------------------------------------------
  " Check for VIM spell feature and configure it
  if has('spell')
    set spelllang=en_us

    " toggle spelling with F7
    map <F7> :setlocal spell!<CR>

    " select best match with z= and limit to top 10 suggestions
    set spellsuggest=best,10

    " set spelling highlight to no highlight and red text
    highlight SpellBad ctermfg=red ctermbg=NONE
    highlight SpellLocal ctermfg=red ctermbg=NONE
    highlight SpellCap ctermfg=red ctermbg=NONE
    highlight SpellRare ctermfg=red ctermbg=NONE

    " enable spelling by default on specified file type
    autocmd BufRead,BufNewFile *.txt setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
  endif

  " Prevent loading of CSApprox if there is no gui support
  if !has("gui")
    let g:CSApprox_loaded = 1
  endif

" Large File Options
" -------------------------------------------------------------------------------------
  " file is large from 10mb
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    au!
    autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
  augroup END

  function! LargeFile()
    " no syntax highlighting etc
    set eventignore+=FileType
    " no line numbers
    set nonumber
    " no spell checking
    set nospell
    " save memory when other file is viewed
    setlocal bufhidden=unload
    " is read-only (write with :w new_filename)
    setlocal buftype=nowrite
    " no undo possible
    setlocal undolevels=-1
    " display message
    autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . "MB, some options have been disabled (see .vimrc for details)."
  endfunction

" Source Local vimrc Configs
" -------------------------------------------------------------------------------------
  " Source the ~/.vimrc_local file if it exists
  if filereadable(glob('~/.vimrc_local'))
    source ~/.vimrc_local
  endif
