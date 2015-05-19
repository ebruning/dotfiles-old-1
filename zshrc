# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh
HOMEBREW_HOME=/usr/local/bin

ZSH_THEME="agnoster" #Nice prompt maybe a little busy

plugins=(osx brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

set -o vi

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export EDITOR="mvim -f"

# fastlane variables
export DELIVER_USER="ebruning@gmail.com"
export FASTLANE_TEAM_ID="GEF98ZHGFB"

# android variables
export ANDROID_SDK="/Users/ethan/bin/adt-bundle-mac-x86_64-20140702/sdk"	
export ANDROID_SDK_HOME=$ANDROID_SDK

export PATH="$HOME/bin:/usr/local/bin:$HOME/.rbenv/bin:$HOME/.cask/bin:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH"

# Alias
[ -f "$HOMEBREW_HOME/mvim" ] && alias e=mvim
[ -d "$HOME/Applications/Atom.app" ] && alias a=atom
[ -f "$HOMEBREW_HOME/hub" ] && alias git=hub
[ -f "$HOMEBREW_HOME/emacs" ] && alias sp=emacs

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
  sudo discoveryutil mdnsflushcache
}

function jsonpp () { cat "$@" | python -mjson.tool | pygmentize -l json  }
