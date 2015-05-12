# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh
HOMEBREW_HOME=/usr/local/bin

ZSH_THEME="agnoster" #Nice prompt maybe a little busy

plugins=(osx brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

set -o vi

export PATH="$HOME/bin:/usr/local/bin:$HOME/.rbenv/bin:$HOME/bin/android-ndk-r9:$HOME/.cask/bin:$HOME/bin/sdk/tools:$HOME/bin/sdk/platform-tools:$PATH"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export EDITOR="mvim -f"

# fastlane variables
export DELIVER_USER="ebruning@gmail.com"
export FASTLANE_TEAM_ID="GEF98ZHGFB"

# Alias
[ -f "/usr/local/bin/mvim" ] && alias e=mvim
[ -d "$HOME/Applications/Atom.app" ] && alias a=atom
[ -f "$HOMEBREW_HOME/hub" ] && alias git=hub

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
