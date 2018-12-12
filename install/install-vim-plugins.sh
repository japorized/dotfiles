#!/usr/bin/env bash

mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle
echo "Installing plugins from vim-plugins.txt"
while read repo ; do
  git clone "$repo"
  echo 'Cloned ' $repo
done < vim-plugins.txt

echo "Creating symlinks for slimmed configuration"
mkdir -p $HOME/.vim/slim
cd $HOME/.vim/slim
ln -sf $HOME/.vim/bundle/* $HOME/.vim/slim
rm -f denite.nvim lightline nuake thumbnail.vim tlib_vim vim-addon-mw-utils ultisnips vim-case-convert vim-javascript vim-startify vim-template vim-vue vimagit vimtex
echo "Slim configuration ready. Use svim to specify slim-vim configuration."
