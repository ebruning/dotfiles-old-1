#!/bin/bash

function export {
  echo "exporting plugins"
  apm list --installed --bare > $HOME/dotfiles/package-list.txt
}

function import {
  echo "importing plugins"
  apm install --packages-file $HOME/dotfiles/package-list.txt
}

while [ "$1" != "" ]; do
  PARAM=`echo $1 | awk -F= '{print $1}'`
  case $PARAM in
    --export)
      export
      exit
      ;;
    --import)
      import
      exit
      ;;
    *)
      echo "Unknown command. --export or --import"
      exit 1
      ;;
  esac
  shift
done
