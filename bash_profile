#!/bin/bash
#
# A lot (most) of this is taken from
# Ryan Tomayko <http://tomayko.com/about>
# and
# http://github.com/adamv/dotfiles

export TERM=xterm-256color

#  SHELL OPTIONS

set -o notify
ulimit -S -c 0
umask 0022
set bell-style bell

# bring in system bashrc
test -r /etc/bashrc &&
      . /etc/bashrc

# git prompt
GIT_PS1_SHOWDIRTYSTATE=true

# ENVIRONMENT CONFIGURATION

# detect interactive shell
case "$-" in
    *i*) INTERACTIVE=yes ;;
    *)   unset INTERACTIVE ;;
esac

# detect login shell
case "$0" in
    -*) LOGIN=yes ;;
    *)  unset LOGIN ;;
esac

# enable en_US locale w/ utf-8 encodings if not already configured
: ${LANG:="en_US.UTF-8"}
: ${LANGUAGE:="en"}
: ${LC_CTYPE:="en_US.UTF-8"}
: ${LC_ALL:="en_US.UTF-8"}
export LANG LANGUAGE LC_CTYPE LC_ALL

# ignore backups, CVS directories, python bytecode, vim swap files
FIGNORE="~:CVS:#:.pyc:.swp:.swa:apache-solr-*"
HISTCONTROL=ignoreboth

# PAGER
if test -n "$(command -v less)" ; then
    PAGER="less -FirSwX"
    MANPAGER="less -FiRswX"
else
    PAGER=more
    MANPAGER="$PAGER"
fi
export PAGER MANPAGER

# Ack
ACK_PAGER="$PAGER"

# Sets the prompt
source ~/.bash/bash.prompt

# General aliases
alias ls="ls -G"
alias ll="ls -l -h"
alias la="ls -a"
alias lla="ls -a -l"
alias listen="sudo lsof -i -P |grep -i \"listen\""

# override and disable tilde expansion
_expand() {
    return 0
}

# Use the color prompt by default when interactive
test -n "$PS1" &&
prompt_color

# Call OS Specific bash commands

if [ $OSTYPE = "darwin10.0" ]; then
	source ~/.bash/bash.mac
elif [ $OSTYPE = "linux-gnu" ]; then
	source ~/.bash/bash.linux
elif [ $OSTYPE = "msys" ]; then
	source ~/.bash/bash.cygwin
else
	echo "unknown"
fi
