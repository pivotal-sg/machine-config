#!/bin/sh

ln -sv $(dirname $0)/laptop.local $HOME/.laptop.local

laptop_folder=/tmp/laptop
laptop_script=$laptop_folder/mac

if [ ! -x $laptop_script ] ; then
  git clone https://github.com/thoughtbot/laptop.git $laptop_folder
fi

if [ ! -s "$HOME/.zshrc" ] ; then
  echo 'source $HOME/.zshrc.ohmyzsh' > $HOME/.zshrc
fi

sh $laptop_script &&
  rcup -d $(dirname $0) &&
  # Run laptop again to ensure any local laptop changes are going in
  rm -rf $laptop_folder &&
  # This has been the easiest way I've found to keep virtualenvwrapper working
  sudo easy_install virtualenv virtualenvwrapper &&
  # rbenv and pyenv are both installed from brew and will keep conf there
  rm -rf $HOME/.pyenv $HOME/.rbenv
  rm $HOME/.laptop.local
