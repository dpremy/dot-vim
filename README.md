# dpremy vi, vim, and neovim config file

## Purpose

This repository contains the dotfiles and configs I use with vi, vim, and neovim. It is desinged to work with [GNU stow](https://www.gnu.org/software/stow/), but can easily be used without it.

## Installation

```shell
# if you don't already have GNU stow, install stow for your OS

# clone this repo in to a .files directory
git clone -q https://gitlab.com/dpremy/dot-vim.git ~/.files/dot-vim

# use stow to symlink this 'package' in to your home directory
stow -d ~/.files/ -t ~/ -S dot-vim
```

## Usage

See [vim_cheatsheet.pdf](./cheatsheets/vim_cheatsheet.pdf) for some of the most common key bindings. [.vimrc](.vimrc) also has comments and may be worth reviewing.
