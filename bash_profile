#!/bin/bash
#
# A lot (most) of this is taken from
# Ryan Tomayko <http://tomayko.com/about>
# and
# http://github.com/adamv/dotfiles

# the basics
: ${HOME=~}
: ${UNAME=$(uname)}

# complete hostnames from this file
: ${HOSTFILE=~/.ssh/known_hosts}

# ----------------------------------------------------------------------
#  SHELL OPTIONS
# ----------------------------------------------------------------------

# notify of bg job completion immediately
set -o notify

# disable core dumps
ulimit -S -c 0

# default umask
umask 0022

# turn off bell
set bell-style bell

# bring in system bashrc
test -r /etc/bashrc &&
      . /etc/bashrc

# git prompt
GIT_PS1_SHOWDIRTYSTATE=true

# ----------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------

# set PATH variable, didn't load PATH from system as paths were getting
# out of order, should change this to myPath:SysPath
export PATH=/Users/ebruning/bin:/Users/ebruning/bin/depot_tools:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/X11/bin

# Added for RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# ----------------------------------------------------------------------
# ENVIRONMENT CONFIGURATION
# ----------------------------------------------------------------------

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

# always use PASSIVE mode ftp
: ${FTP_PASSIVE:=1}
export FTP_PASSIVE

# ignore backups, CVS directories, python bytecode, vim swap files
FIGNORE="~:CVS:#:.pyc:.swp:.swa:apache-solr-*"
HISTCONTROL=ignoreboth

# ----------------------------------------------------------------------
# PAGER / EDITOR
# ----------------------------------------------------------------------

# Sets the default editor
if [ -f /Applications/TextMate.app/Contents/Resources/mate ]
then
	export EDITOR='mate'
	export GIT_EDITOR='mate -wl1'
else
	export EDITOR='vi'
	export GIT_EDITOR='vi'
fi

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

# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------

RED="\[\033[0;31m\]"
BROWN="\[\033[0;33m\]"
GREY="\[\033[0;97m\]"
BLUE="\[\033[0;34m\]"
PURPLE='\e[0;35m'
PS_CLEAR="\[\033[0m\]"
SCREEN_ESC="\[\033k\033\134\]"

prompt_color() {
    #PS1="${GREY}[${COLOR1}\u${GREY}:${PURPLE}\w${COLOR1}\$(__git_ps1)${GREY}]${COLOR2}$P${PS_CLEAR} "
	PS1="\w\$(__git_ps1)$P${PS_CLEAR}: "
	PS2="\[[33;1m\]continue \[[0m[1m\]> "
}

# ----------------------------------------------------------------------
# MACOS X / DARWIN SPECIFIC
# ----------------------------------------------------------------------

if [ "$UNAME" = Darwin ]; then
    # setup java environment. puke.
    JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
    ANT_HOME="/Developer/Java/Ant"
    export ANT_HOME JAVA_HOME
fi

# ----------------------------------------------------------------------
# ALIASES / FUNCTIONS
# ----------------------------------------------------------------------

# Directory aliases
alias ls="ls -G"
alias ll="ls -l -h"
alias la="ls -a"
alias lla="ls -a -l"

# Git aliases
alias hub=git

alias top=htop
alias listen="sudo lsof -i -P |grep -i \"listen\""

# ----------------------------------------------------------------------
# BASH COMPLETION
# ----------------------------------------------------------------------

for file in /usr/local/etc/bash_completion.d/*
	do {
		source $file
	}
done

# override and disable tilde expansion
_expand() {
    return 0
}

# -------------------------------------------------------------------
# USER SHELL ENVIRONMENT
# -------------------------------------------------------------------

export NODE_PATH=/usr/local/lib/node

# Use the color prompt by default when interactive
test -n "$PS1" &&
prompt_color
