#!/bin/sh

if [ "$(hostname -s)" = "newmachine" ] ; then
  echo "This seems to be a new machine, what is its name? "
  read machine_name

  if [ "$machine_name" != '' ] ; then
    echo "Setting machine name to '$machine_name'"
    sudo scutil --set ComputerName $machine_name
    sudo scutil --set LocalHostName $machine_name
    sudo scutil --set HostName $machine_name
    sudo hostname $machine_name
    sudo diskutil rename / $machine_name
  fi
fi

git clone https://github.com/thoughtbot/laptop.git /tmp/laptop &&
  /tmp/laptop/mac &&
  chsh -s /usr/local/bin/zsh &&
  rcup -d $(dirname $0) &&
  # Run laptop again to ensure any local laptop changes are going in
  /tmp/laptop/mac
