#!/usr/bin/env bash

set -eu

DOTFILESDIR=${HOME}/dev/workspace/dotfiles
VIMSETTINGDIR=${HOME}/.vim
VIMCOLORDIR=${VIMSETTINGDIR}/colors

declare -a dotfolders=(
  '.config/fish/'
  '.config/omf/'
  '.vim/colors'
)

declare -a dotfiles=(
  '_vimrc'
  '_gvimrc'
  '.pecorc'
  '.gitignore'
  '.zshrc'
  '.iterm2-profiles'
  '.config/fish/config.fish'
  '.config/omf/theme'
)

for dotfolder in "${dotfolders[@]}"
do
  if [ -d ${HOME}/"${dotfolder}" ]; then
    echo Skipped: ${HOME}/"${dotfolder}" exist
  else
    echo Create folder: ${HOME}/"${dotfolder}"
    mkdir -p ${HOME}/"${dotfolder}"
  fi
done
echo "Finished creating ${#dotfolders[@]} folders"

for dotfile in "${dotfiles[@]}"
do
  if [ -f ${HOME}/"${dotfile}" ]; then
    echo Skipped: ${HOME}/"${dotfile}" exists
  else
    echo Create symbolic link: From: ${DOTFILESDIR}/"${dotfile}", To: ${HOME}/"${dotfile}"
    ln -sf ${DOTFILESDIR}/"${dotfile}" ${HOME}/"${dotfile}"
  fi
done
echo "Finished linking ${#dotfiles[@]} files"

if [ -f ${VIMCOLORDIR}/molokai.vim ]; then
  echo Skipped: ${VIMCOLORDIR}/molokai.vim exists
else 
  echo Create symbolic link: From: ${DOTFILESDIR}/molokai/colors/molokai.vim, To: ${VIMCOLORDIR}
  ln -sf ${DOTFILESDIR}/molokai/colors/molokai.vim ${VIMCOLORDIR}
  echo "finished linking molokai.vim"
fi