#!/usr/bin/env bash
DOTFILESDIR=${HOME}/dev/workspace/dotfiles
VIMSETTINGDIR=${HOME}/.vim
VIMCOLORDIR=${VIMSETTINGDIR}/colors

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

for dotfile in "${dotfiles[@]}"
do
  if [ ! -f ${HOME}/"${dotfile}" ]; then
    ln -sf ${DOTFILESDIR}/"${dotfile}" ${HOME}/"${dotfile}"
  fi
done
echo "finished linking ${#dotfiles[@]} files"

if [ ! -d ${VIMCOLORDIR} ]; then
  mkdir -p ${VIMCOLORDIR}
fi
echo "finished creating ${VIMCOLORDIR}"

if [ ! -f ${VIMCOLORDIR} ]; then
  ln -sf ${DOTFILESDIR}/molokai/colors/molokai.vim ${VIMCOLORDIR}
fi
echo "finished linking molokai.vim"
