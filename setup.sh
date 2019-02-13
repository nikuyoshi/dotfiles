#!/usr/bin/env bash
CURRENTDIR=`pwd`
VIMSETTINGDIR=${HOME}/.vim
VIMCOLORDIR=${VIMSETTINGDIR}/colors

declare -a dotfiles=(
  '_vimrc'
  '_gvimrc'
  '.pecorc'
  '.gitignore'
  '.zshrc'
)

for dotfile in "${dotfiles[@]}"
do
  if [ ! -f ${HOME}/"${dotfile}" ]; then
    ln -sf ${CURRENTDIR}/"${dotfile}" ${HOME}/"${dotfile}"
  fi
done
echo "finished linking ${#dotfiles[@]} files"

if [ ! -d ${VIMCOLORDIR} ]; then
  mkdir -p ${VIMCOLORDIR}
fi
echo "finished creating ${VIMCOLORDIR}"

if [ ! -f ${VIMCOLORDIR} ]; then
  ln -sf ${CURRENTDIR}/molokai/colors/molokai.vim ${VIMCOLORDIR}
fi
echo "finished linking molokai.vim"
