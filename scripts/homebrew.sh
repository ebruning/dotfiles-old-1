#!/bin/bash

brew update
brew upgrade

# TAPS=(
#     homebrew/dupes
#     homebrew/versions
# )
# brew tap ${TAPS[@]}

FORMULAS=(
  python 
  ant
  autoconf
  automake
  brew-cask
  cmake
  colordiff
  cscope
  ffmpeg
  freetype
  gdbm
  git
  heroku-toolbelt
  hub
  imagemagick
  jpeg
  lame
  libtool
  libvo-aacenc
  libxml2
  mackup
  # brew 'macvim', args: ['--env-std',  '--override-system-vim']
  mono
  node
  p7zip
  par2
  pcre
  pkg-config
  rbenv
  readline
  ruby-build
  ssh-copy-id
  sqlite
  unrar
  x264
  xctool
  xvid
  xz
  youtube-dl
  zsh
)

brew install ${FORMULAS[@]}

brew cleanup
