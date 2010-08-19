##### Alot of this is taken from http://github.com/adamv/dotfiles
## Editors
export EDITOR='mate'
export GIT_EDITOR='mate -wl1'

## Path
#export PATH=~/bin:~/bin/depot_tools:$PATH
export PATH=/Users/ebruning/bin:/Users/ebruning/bin/depot_tools:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/X11/bin

## History control
export HISTCONTROL=ignoreboth
shopt -s histappend

##Git Settings
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

export PS1='\u@\w $(__git_ps1)$ '

## Enable colors
export LSCOLORS=hxfxcxdxbxegedabagHxHx

alias ls="ls -G"
alias ll="ls -l -h"
alias la="ls -a"
alias lla="ls -a -l"
alias hub=git

## Tab Completions
set completion-ignore-case On

## Chrome functions
function build_chrome {
	cd ~/Development/Projects/Google/Chrome/src/build
	xcodebuild -project all.xcodeproj -configuration Debug -target All
}

## Media Jukebox functions
function update_movies {
	cd ~/moviejukebox
	sh MovieJukebox.sh movies.xml -o /Volumes/Videos 
}

function update_porn {
	cd ~/moviejukebox
	sh MovieJukebox.sh porn.xml -o /Volumes/Porn
}
