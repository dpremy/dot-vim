# dpremy vi, vim, and neovim config file

## Purpose

This repository contains the dotfiles and configs I use with vi, vim, and neovim. It is designed to work with [GNU stow](https://www.gnu.org/software/stow/), but can easily be used without it.

## Installation

### Linux

```shell
# if you don't already have GNU stow, install stow for your OS

# clone this repo in to a .files directory
git clone -q https://gitlab.com/dpremy/dot-vim.git ~/.files/dot-vim

# use stow to symlink this 'package' in to your home directory
stow -d ~/.files/ -t ~/ -S dot-vim
```

### Windows

- Copy `.vimrc` and `.gvimrc` to `%userprofile%`
- Copy `.config/nvim/init.vim` and `.config/nvim/ginit.vim` to `%localappdata%\nvim\`
- If you have git available on the system, run `git clone https://github.com/gmarik/Vundle.vim.git %userprofile%\.vim\bundle\Vundle.vim`
- In both vim and nvim, run `:PluginInstall`

## Usage

See [vim_cheatsheet.pdf](./cheatsheets/vim_cheatsheet.pdf) for some of the most common key bindings. [.vimrc](.vimrc) also has comments and may be worth reviewing.
