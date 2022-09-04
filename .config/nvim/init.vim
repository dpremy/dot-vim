" load legacy vimrc config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" vim: set syn=vim ts=2 sw=2 tw=0 et nowrap spell ro:
