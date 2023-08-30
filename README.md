# dpremy vi, vim, and neovim config file

## Purpose

This repository contains the dotfile and config I use with vi, vim, and neovim. It is desinged to work with [dotfiler](https://github.com/svetlyak40wt/dotfiler), but can easily be used without it.

## Installation

```shell
# if you don't already have dotfiler, clone it to your home directory
git clone -q https://github.com/svetlyak40wt/dotfiler ~/.files

# add this repo to dotfiler
~/.files/bin/dot add https://gitlab.com/dpremy/dot-vim.git

# update the symlinks in your home directory
~/.files/bin/dot --skip-pull update
```

## Usage

See [vim_cheatsheet.pdf](./cheatsheets/vim_cheatsheet.pdf) for some of the most common key bindings. [.vimrc](.vimrc) also has comments and may be worth reviewing.