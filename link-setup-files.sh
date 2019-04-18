#!/bin/sh

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [ ! -L "${HOME}/.zshrc" ]; then
  ln -s "${SCRIPTPATH}/.zshrc" "${HOME}"
fi
if [ ! -L "${HOME}/.zshenv" ]; then
  ln -s "${SCRIPTPATH}/.zshenv" "${HOME}"
fi

if [ ! -d "${HOME}/.spacemacs.d" ]; then
  "Adding folder: ${HOME}/.spacemacs.d"
  mkdir -p "${HOME}/.spacemacs.d"
fi
if [[ -d "${HOME}/.spacemacs.d" &&  ! -L "${HOME}/.spacemacs.d/init.el" ]]; then
  ln -s "${SCRIPTPATH}/init.el" "${HOME}/.spacemacs.d"
fi

if [ ! -d "${HOME}/.config/nvim" ]; then
  echo "Adding folder: ${HOME}/.config/nvim"
  mkdir -p "${HOME}/.config/nvim"
fi
if [[ -d "${HOME}/.config/nvim" && ! -L "${HOME}/.config/nvim/init.vim" ]]; then
  ln -s "${SCRIPTPATH}/init.vim" "${HOME}/.config/nvim"
fi
