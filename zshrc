# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh
HOMEBREW_HOME=/usr/local/bin

ZSH_THEME="agnoster" #Nice prompt maybe a little busy
#ZSH_THEME="honukai" #Nice prompt maybe a little busy

plugins=(osx brew vagrant zsh-completions gem)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

set -o vi

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export EDITOR="mvim -f"

# fastlane variables
export DELIVER_USER="ebruning@gmail.com"
export FASTLANE_TEAM_ID="GEF98ZHGFB"
export XCODE_INSTALL_PASSWORD=
export XCODE_INSTALL_USER=ebruning@gmail.com
export GIT_URL="git://git@bitbucket.org:kofax/match.git"

# android variables
export ANDROID_SDK="/Users/ethan/Library/Android/sdk"	
export ANDROID_SDK_HOME="$HOME/"

export PATH="$HOME/bin:/usr/local/bin:$HOME/.rbenv/bin:$HOME/.cask/bin:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH"
fpath=(/usr/local/share/zsh-completions $fpath)

# Alias
[ -f "$HOMEBREW_HOME/mvim" ] && alias v="vimer -t"
[ -d "$HOME/Applications/Atom.app" ] && alias a=atom
[ -f "$HOMEBREW_HOME/hub" ] && alias git=hub
# [ -f "$HOMEBREW_HOME/emacs" ] && alias e=emacs
[ -f "$HOMEBREW_HOME/emacs" ] && alias e='open /Applications/Emacs.app $1'

unsetopt correctall

# RBENV
# eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function xc {
    xcode_proj=`find . -name "*.xc*" -d 1 | sort -r | head -1`

    if [[ `echo -n $xcode_proj | wc -m` == 0 ]]
    then
        echo "No xcworkspace/xcodeproj file found in the current directory."
    else
        open "$xcode_proj"
    fi
}

function distribute {
  ipa build

  # TODO: check if build succeeds before uploading
  ipa distribute
}

function dnsflush {
  sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
}

function jsonpp () { cat "$@" | python -mjson.tool | pygmentize -l json  }
