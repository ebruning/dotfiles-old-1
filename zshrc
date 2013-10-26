# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="minimal"
#ZSH_THEME="sorin"
ZSH_THEME="simple"

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
plugins=(osx heroku pow git bundler brew gem github grails ruby pod)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

set -o vi

export PATH="$HOME/bin:/usr/local/bin:$HOME/.rbenv/bin:$HOME/bin/android-ndk-r9:$PATH"
export PROJECTS="$HOME/dev"
export MOBILE="$HOME/Dropbox/Mobile"
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export GROOVY_HOME="$HOME/sdk/groovy-1.8.6"
export GRAILS_HOME="$HOME/sdk/grails-2.0.3"
export NDK_MODULE_PATH=.
export ANDROID_SDK_HOME="/Users/ebruning/sdk/android-sdks"
export EDITOR=vi

export MAC_FRAMEWORK="/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk/System/Library/Frameworks"
export IOS_FRAMEWORK="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.1.sdk/System/Library/Frameworks" 

# Alias
[ -f "/usr/local/bin/mvim" ] && alias e=mvim 
unsetopt correctall

eval "$(rbenv init -)"

function xc {
    xcode_proj=`find . -name "*.xc*" -d 1 | sort -r | head -1`

    if [[ `echo -n $xcode_proj | wc -m` == 0 ]]
    then
        echo "No xcworkspace/xcodeproj file found in the current directory."
    else
        open "$xcode_proj"
    fi
}

# Shenzhen settings
export TESTFLIGHT_API_TOKEN="27180906b18dfd69768b70911d5614c8_MjcxMTQ3MjAxMi0wMS0wOSAxMjo1Nzo0MS4zMjA4NTc"
export TESTFLIGHT_TEAM_TOKEN="3afc0cfd1f1209bc495646515afc875a_MjUwMTY2MjAxMy0wNy0xOCAxNzowMjoxMC41NDQzNDA"
