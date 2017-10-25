#!/bin/bash

echo 'Installing xcode cli tools'
/usr/bin/xcode-select --install

CONFIG=$HOME/.config

if [ -d $CONFIG ]; then
  echo 'Creating ~/.config'
  mkdir ~/.config
fi


