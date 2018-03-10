#!/bin/bash

dotfiles_install() {
  set -e
  set -u
  
  DRY_RUN=${1:-}

  bashit_install
  tpm_install
  spacevim_install
  vscode_install
  brew_install
  dotfiles_symlink
}

dotfiles_symlink() {
  # Create symlinks for all files except those in $IGNORE_FILES
  for FILE in $(dotfiles_dir)/.*; do
    BASE_FILENAME=$(basename $FILE)
    if [ $BASE_FILENAME != "." ] && [ $BASE_FILENAME != ".." ]; then
      create_symlink $FILE $HOME/$BASE_FILENAME
    fi
  done
}

dotfiles_update() {
  bashit_update
  tpm_update
  spacevim_update
  brew_update
}