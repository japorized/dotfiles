#!/usr/bin/env sh

echo "Install pure zsh? (Y/n)"
read answer
if [ ! "$answer" = "n" ]; then
  echo "Installing pure zsh"
  git clone https://github.com/sindresorhus/pure $HOME/.config/pure
  ln -fs $HOME/.config/pure/pure.zsh $HOME/.bin/fpath/prompt_pure_setup
  ln -fs $HOME/.config/pure/async.zsh $HOME/.bin/fpath/async
fi

echo "Enable nextcloud.service? (Y/n)"
read answer
if [ ! "$answer" = "n" ]; then
  systemctl --user enable nextcloud.service
  systemctl --user start nextcloud.service
fi

echo "Enable redshift.service? (Y/n)"
read answer
if [ ! "$answer" = "n" ]; then
  systemctl --user enable geoclue-agent.service
  systemctl --user start geoclue-agent.service
  systemctl --user enable redshift.service
  systemctl --user start redshift.service
fi

echo "Setup ~/.fonts directory? (Y/n)"
read answer
if [ ! "$answer" = "n" ]; then
  mkdir -p $HOME/.fonts/OTF $HOME/.fonts/TTF
  mkfontdir $HOME/.fonts/OTF
  mkfontdir $HOME/.fonts/TTF
  mkfontscale $HOME/.fonts/OTF
  mkfontscale $HOME/.fonts/TTF
fi
