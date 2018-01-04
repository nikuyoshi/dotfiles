#!/usr/bin/env bash
CURRENTDIR=`pwd`
VIMSETTINGDIR=${HOME}/.vim
VIMCOLORDIR=${VIMSETTINGDIR}/colors

if [ ! -f ${HOME}/_vimrc ]; then
  ln -s ${CURRENTDIR}/_vimrc ${HOME}/_vimrc
fi
if [ ! -f ${HOME}/_gvimrc ]; then
  ln -s ${CURRENTDIR}/_gvimrc ${HOME}/_gvimrc
fi
if [ ! -d ${VIMCOLORDIR} ]; then
  mkdir -p ${VIMCOLORDIR}
fi
if [ ! -f ${VIMCOLORDIR} ]; then
  ln -s ${CURRENTDIR}/molokai/colors/molokai.vim ${VIMCOLORDIR}
fi
