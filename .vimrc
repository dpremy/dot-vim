" Disable vi compatibility mode as plugins and other
"  features in this configuration require the iMproved featureset
set nocompatible

" File Encoding Settings
" -------------------------------------------------------------------------------------
  " Properly detect fileencodings
  " Based on http://stackoverflow.com/questions/5477565/how-to-setup-vim-properly-for-editing-in-utf-8
  if has('multi_byte')
    if &termencoding ==# ''
      let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
  endif

  " Set utf-8 Encoding
  scriptencoding utf-8

  " Set a custom mapleader
  let mapleader=' '

" Git detection for vundle plugins
" -------------------------------------------------------------------------------------
  " Update $PATH on Windows if git can be found, allowing for vundle plugins to be installed
    if has('win32') || has ('win64')

      " standard git install directories
      let gitdir='C:\Program Files (x86)\Git\bin'
      let gitdiralt1='C:\Program Files\Git\bin'
      " portable git directory for vim and neovim
      let gitdiralt2=$VIM.'\..\PortableGit\bin'
      let gitdiralt3=$VIM.'\..\..\..\PortableGit\bin'

      if isdirectory(gitdir)
        let $PATH.=';' .gitdir
      elseif isdirectory(gitdiralt1)
        let $PATH.=';' . gitdiralt1
      elseif isdirectory(gitdiralt2)
        let $PATH.=';' . gitdiralt2
      elseif isdirectory(gitdiralt3)
        let $PATH.=';' . gitdiralt3
      endif

      " additional portable vim-helpers directory
      let helpersdir=$VIM.'\..\vim-helpers'
      let helpersdir1=$VIM.'\..\..\..\vim-helpers'

      if isdirectory(helpersdir)
        let $PATH.=';' .helpersdir
      elseif isdirectory(helpersdir1)
        let $PATH.=';' .helpersdir1
      endif
    endif

" Vundle Installation
" -------------------------------------------------------------------------------------
  " To manually install Vundle use:
  "  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  " disable filetype detection, required for Vundle plugin installation.
  "  filetype detection is re-enabled after Vundle
  filetype off

  " set the runtime path to include Vundle and initialize
  set runtimepath+=~/.vim/bundle/Vundle.vim
  silent! call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "  call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  silent! Plugin 'VundleVim/Vundle.vim'

  " plugins
    " vim configuration
    silent! Plugin 'vim-airline/vim-airline'
    silent! Plugin 'vim-airline/vim-airline-themes'
    silent! Plugin 'tpope/vim-fugitive'
    silent! Plugin 'tpope/vim-sensible'
    silent! Plugin 'godlygeek/tabular'
    silent! Plugin 'ntpeters/vim-better-whitespace'
    silent! Plugin 'Raimondi/delimitMate'
    silent! Plugin 'guns/xterm-color-table.vim'
    silent! Plugin 'google/vim-searchindex.git'
    silent! Plugin 'catppuccin/nvim'
    silent! Plugin 'Yggdroot/indentLine'
    silent! Plugin 'preservim/nerdcommenter'
    silent! Plugin 'ctrlpvim/ctrlp.vim'
    silent! Plugin 'tacahiroy/ctrlp-funky'
    silent! Plugin 'junegunn/fzf'
    silent! Plugin 'junegunn/fzf.vim'
    silent! Plugin 'nanotee/zoxide.vim'

    " if vim-nix starts having syntax highlighting issues
    " see https://nicknovitski.com/vim-nix-syntax
    silent! Plugin 'LnL7/vim-nix'

    " file syntax
    silent! Plugin 'sheerun/vim-polyglot'

    " file linter
    if v:version >= 800
      silent! Plugin 'dense-analysis/ale'
    else
      silent! Plugin 'vim-syntastic/syntastic'
    endif

    " Source Local Vundle Plugins
    " -------------------------------------------------------------------------------------
      " Source the ~/.vundle_local file if it exists
      if filereadable(glob('~/.vundle_local'))
        source ~/.vundle_local
      endif

  " All of your Plugins must be added before the following line
  silent! call vundle#end()

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

  let g:ale_fixers = {
  \  '*': ['remove_trailing_lines'],
  \  'sh': ['shfmt']
  \}
  let g:ale_sh_shfmt_options = '-sr -kp -ns -s -i 2 -ci -p'

  let g:airline_powerline_fonts = 1
  let g:airline#extensions#ale#enabled = 1
  let g:airline_detect_spelllang=0

  let g:indentLine_bgcolor_term = 'none'
  let g:indentLine_fileTypeExclude = ['help']

  let g:ctrlp_max_history = 0
  let g:ctrlp_funky_matchtype = 'path'
  let g:ctrlp_mruf_exclude = '.*/tmp/.*\|.*/temp/.*\|.*/.git/.*'
  let g:ctrlp_extensions = ['funky']

  let g:NERDSpaceDelims = 1
  let g:NERDDefaultAlign = 'left'

  " polyglot language pack options
  let g:ansible_unindent_after_newline = 1

  " Detect if we are in vi, or if airline isn't installed, so we can enable the showmode only when required. Disable showmode when in vim and airline is available.
  if !has('compatible') && !isdirectory($HOME.'/.vim/bundle/vim-airline')
    set showmode
  else
    set noshowmode
  endif

" Built-in Plugin Options
" -------------------------------------------------------------------------------------
  " Configure vim netrw file browser
  let g:netrw_banner=0
  let g:netrw_liststyle=3

" VIM Options
" -------------------------------------------------------------------------------------
  " Turn on syntax highlighting
  syntax on

  " Turn on cursor line highlighting
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

  " Enable modeline checking of files and look for modelines in the first 5 lines
  set modeline
  set modelines=5

  " Disable sounds on most errors
  silent! set noerrorbells
  silent! set novisualbell
  silent! set belloff+=esc,backspace,cursor,insertmode,error

  " Tab options
  set tabstop=2
  set shiftwidth=2
  set shiftround
  set softtabstop=2
  set expandtab
  set autoindent smartindent
  set smarttab

  " Window split directions
  set splitbelow
  set splitright

  " Don't fold by default, fold based on indent, and no deeper than 3 levels
  silent! set nofoldenable
  silent! set foldmethod=indent
  silent! set foldnestmax=10

  " Disable line wrapping
  set nowrap

  " Wrap lines at convenient points
  set linebreak

  " Prevent two spaces after .?! when joining lines
  set nojoinspaces

  " Enable tab-completion for all file related tasks, enables searching of files in subfolders
  set path=.,**

  " Toggle paste mode on and off
  map <silent> <leader>pp :setlocal paste!<cr>

  " Line number options
    " Configure hybrid line numbers. Shows current cursor line number and relative numbers above and below current line for fast motion.
    set number
    set relativenumber

    " Toggle between hybrid line numbers when in Normal mode, and simple line numbers when in Insert mode
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &number | set relativenumber   | endif
      autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &number | set norelativenumber | endif
    augroup END

    " Create function to toggle number and relativenumber
    function! NumberToggle()
      if(&number == 1)
        set nonumber norelativenumber
      else
        set number relativenumber
      endif
    endfunc

    " Toggle line numbers with Ctrl+l
    nnoremap <silent> <C-l> :call NumberToggle()<cr>

  " Wildmode options
    " make cmdline tab completion similar to bash
    set wildmode=list:longest,full

    " ignore case when using wildmode
    set wildignorecase

    " Enable ctrl-n and ctrl-p to scroll thru matches
    set wildmenu

    " Files to ignore when tab completing
    set wildignore=*.swp,*.bak,*.tmp,*.temp,*.cache,*.dll,*.exe,*~
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
  silent! set mouse+=a

  " neovim doesn't require ttymouse, but vim does
  if !has('nvim')
    set ttymouse=xterm2
  endif

  " Enable system clipboard support if available
  if has('clipboard')
    set clipboard^=unnamed,unnamedplus
  endif

  " Enable faster redraw in tty
  set ttyfast

  " Swap config
    " Create protected user swap directory
    if !isdirectory($HOME.'/.vim/swap')
      call mkdir($HOME.'/.vim/swap', 'p', 0750)
    endif

    " Set the swap directory
    set directory=~/.vim/swap/

  " Backup config
    " Create protected user backup directory
    if !isdirectory($HOME.'/.vim/backup')
      call mkdir($HOME.'/.vim/backup', 'p', 0750)
    endif

    " Set the backup directory
    set backupdir=~/.vim/backup/

    " Save undo files on file close
    set backup

  " Undo config
    " Create protected user undo directory
    if !isdirectory($HOME.'/.vim/undo')
      call mkdir($HOME.'/.vim/undo', 'p', 0750)
    endif

    " Set the undo directory
    set undodir=~/.vim/undo

    " Save undo files on file close
    set undofile

    " Set undo levels to be saved
    set undolevels=1000

    " Set number of lines to save for undo
    set undoreload=10000

  " Configure vimdiff
  if &diff
    set diffopt=internal,filler,vertical,context:3
    highlight! link DiffText MatchParen
  endif

" Custom Key Mappings
" -------------------------------------------------------------------------------------

  " Reload ~/.vimrc
  nnoremap <leader>R :source ~/.vimrc<CR>

  " Disable 'Q' in normal mode. I don't use Ex mode.
  nmap Q <Nop>

  " Indent lines without losing the current selection
  xnoremap <  <gv
  xnoremap >  >gv

  " Open folds and center text when searching
  nnoremap n nzvzz
  nnoremap N Nzvzz

  " Make 'Y' behave like the other capitals
  nnoremap Y y$

  " List buffers and then populate the buffer prompt
  nnoremap gb :ls<CR>:b<Space>

  " Setup window keybindings similar to those in dpremy/dot-tmux
    " Show keyboard shortcuts
    nnoremap <silent> <leader>? :map<CR>

    " Change to last active window
    nnoremap <silent> <leader>l <C-W><C-P>

    " Switch to horizontal windows
    nnoremap <silent> <leader>h :windo wincmd K<CR>

    " Switch to vertical windows
    nnoremap <silent> <leader>v :windo wincmd H<CR>

    " Use | and - to split windows
    nnoremap <leader><Bar> <C-W>v<C-W><Right>
    nnoremap <leader>-     <C-W>s<C-W><Down>

    " Move current tab to the left 1
    map <silent> <leader>< :execute ":silent! tabmove" tabpagenr()-2<CR>
    " Move current tab to the right 1
    map <silent> <leader>> :execute ":silent! tabmove" tabpagenr()+1<CR>

    " Switch windows with arrow keys
    nnoremap <leader><Up>    <C-W><Up>
    nnoremap <leader><Down>  <C-W><Down>
    nnoremap <leader><Left>  <C-W><Left>
    nnoremap <leader><Right> <C-W><Right>

    " Use Ctrl+d to close the active window (keeps buffers open)
    map <C-d> <C-W>c

    " 'zoom' in to a window by making the window its max size
    let g:window_is_zoomed = 0
    function! ZoomWindowToggle()
      if g:window_is_zoomed
      execute "normal \<c-w>="
      let g:window_is_zoomed = 0
      else
        execute ':vertical resize'
        execute ':resize'
        let g:window_is_zoomed = 1
      endif
    endfunction
    nnoremap <silent> <leader>z :call ZoomWindowToggle()<CR>

  " CtrlP Bindings
  nnoremap <C-o> :CtrlPMRUFiles<CR>
  nnoremap <C-b> :CtrlPBuffer<CR>
  nnoremap <C-f> :CtrlPFunky<CR>

  " Open highlighted file, even if it doesn't exist
  map gf :edit <cfile><CR>

  " Add current config as modeline to the top of file
  function! PrependModeline()
    let l:modeline = printf(' vim: set syn=%s ts=%d sw=%d tw=%d %set %swrap %sspell %sro:', &syntax, &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no', &wrap ? '' : 'no', &spell ? '' : 'no', &readonly ? '' : 'no')
    let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
    call append(line('^'), l:modeline)
  endfunction
  map <silent> <leader>ml :call PrependModeline()<CR>

  " Turn off search highlighting
  map <silent> <leader>nh :nohlsearch<CR>

  " Simplify help navigation
  augroup navhelp
    autocmd!
    autocmd FileType help nnoremap <buffer> <CR> <C-]>
    autocmd FileType help nnoremap <buffer> <BS> <C-T>
    autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
    autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>
    autocmd FileType help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
    autocmd FileType help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
  augroup END

  " Configure F5 for various commands
  augroup f5binding
    autocmd!
    autocmd FileType markdown nmap <silent> <F5> :!glow %<CR>
    autocmd FileType yaml.docker-compose nmap <silent> <F5> :!docker-compose -f '%:p' down; docker-compose -f '%:p' up -d<CR>
    autocmd FileType sh nmap <silent> <F5> :!sh '%:p'<CR>
    autocmd FileType dosbatch nmap <silent> <F5> :!"%:p"<CR>
  augroup END

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

  " load the desert colorscheme in case catppuccin is not installed
  colorscheme desert

  " silently attempt to load catppuccin, if installed
  silent! colorscheme catppuccin-frappe

  " set airline to match the loaded colorscheme
  if g:colors_name ==# 'catppuccin-frappe'
    let g:airline_theme='catppuccin'
  else
    let g:airline_theme='desertink'
  endif

" Spell Options
" -------------------------------------------------------------------------------------
  " Check for VIM spell feature and configure it
  if has('spell')
    set spelllang=en_us

    " toggle spelling with F7
    map <silent> <F7> :setlocal spell!<CR>

    " select best match with z= and limit to top 10 suggestions
    set spellsuggest=best,10

    " set spelling highlight to no highlight and red text
    highlight SpellBad ctermfg=red ctermbg=NONE
    highlight SpellLocal ctermfg=red ctermbg=NONE
    highlight SpellCap ctermfg=red ctermbg=NONE
    highlight SpellRare ctermfg=red ctermbg=NONE

    " enable spelling by default on specified file type
    augroup enablespell
      autocmd!
      autocmd BufRead,BufNewFile *.txt setlocal spell
      autocmd BufRead,BufNewFile *.md setlocal spell
    augroup END
  endif

  " Prevent loading of CSApprox if there is no gui support
  if !has('gui')
    let g:CSApprox_loaded = 1
  endif

" Large File Options
" -------------------------------------------------------------------------------------
  " check for files larger than 10mb
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    autocmd!
    autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
  augroup END

  function! LargeFile()
    " disable syntax highlighting etc
    set eventignore+=FileType
    " disable line numbers
    set nonumber
    " disable spellcheck
    set nospell
    " save memory by unloading buffer when hidden
    setlocal bufhidden=unload
    " is read-only (write with :w new_filename)
    setlocal buftype=nowrite
    " disable undo
    setlocal undolevels=-1
    " register autocmd to LargeFile augroup to display message that options have been disabled
    autocmd LargeFile VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . "MB, some options have been disabled (see .vimrc for details)."
  endfunction

" Terminal Options
" -------------------------------------------------------------------------------------
  " Resolve issue with vi/vim in Windows Terminal not having the correct Insert cursor
  " https://github.com/microsoft/terminal/issues/4335
  " https://vim.fandom.com/wiki/Configuring_the_cursor
  " 2 solid block
  " 6 solid vertical bar (282 or above support)
  if &term =~ '^xterm'
    " normal mode
    let &t_EI .= "\<Esc>[2 q"
    " insert mode
    let &t_SI .= "\<Esc>[6 q"
  endif

" -------------------------------------------------------------------------------------
" Source the ~/.vimrc_local file if it exists
if filereadable(glob('~/.vimrc_local'))
  source ~/.vimrc_local
endif

" vim: set syn=vim ts=2 sw=2 tw=0 et nowrap spell ro:
