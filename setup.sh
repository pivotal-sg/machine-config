#!/bin/sh

laptop_folder=/tmp/laptop
laptop_script=$laptop_folder/mac

if [ ! -x $laptop_script ] ; then
  git clone https://github.com/thoughtbot/laptop.git $laptop_folder
fi

sh $laptop_script &&
  rcup -d $(dirname $0) &&
  # Run laptop again to ensure any local laptop changes are going in
  $laptop_script &&
  rm -rf $laptop_folder &&
  # This has been the easiest way I've found to keep virtualenvwrapper working
  sudo easy_install virtualenvwrapper &&
  # rbenv and pyenv are both installed from brew and will keep conf there
  rm -rf ~/.pyenv ~/.rbenv
