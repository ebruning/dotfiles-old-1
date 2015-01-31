# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="minimal"
# ZSH_THEME="sorin"
# ZSH_THEME="simple"
ZSH_THEME="kolo"
# ZSH_THEME="avit"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(osx git bundler brew gem github grails ruby pod)
plugins=(osx brew)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

set -o vi

export PATH="$HOME/bin:/usr/local/bin:$HOME/.rbenv/bin:$HOME/bin/android-ndk-r9:$HOME/.cask/bin:$HOME/bin/sdk/tools:$HOME/bin/sdk/platform-tools:$PATH"
export PROJECTS="$HOME/Dropbox/Projects"
export MOBILE="$HOME/Dropbox/Mobile"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export GROOVY_HOME="$HOME/sdk/groovy-1.8.6"
export GRAILS_HOME="$HOME/sdk/grails-2.0.3"
export NDK_MODULE_PATH=.
export ANDROID_SDK_HOME="/Users/ethan/bin/sdk"
export ANDROID_SDK="/Users/ethan/bin/sdk"
export EDITOR="mvim -f"
export ANDROID_SDK_HOME="/Users/ethan"


# Alias
[ -f "/usr/local/bin/mvim" ] && alias e=mvim 
# [ -f "/Applications/Atom.app" ] && alias a=atom 
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

function jsonpp () { cat "$@" | python -mjson.tool | pygmentize -l json  }

# Shenzhen settings
source /Users/ethan/Dropbox/AppData/testflight.sh

