#!/bin/bash
# This directory is supporsed to be in $HOME as .dotfiles
DOTFILES="$HOME"/.dotfiles
cd "$HOME"

# set editor configuration files
ln -s "$DOTFILES"/_vimrc _vimrc
