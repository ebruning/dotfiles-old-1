# Path to your oh-my-zsh configuration.
ZSH=$HOME/Dropbox/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="minimal"
ZSH_THEME="sorin"
#ZSH_THEME="agnoster"

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
plugins=(rvm osx heroku pow git bundler brew gem github grails ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH="$HOME/bin:$HOME/sdk/grails-2.0.3/bin:$HOME/sdks/android-ndk-r8c:$HOME/sdks/android-sdks/platform-tools:$PATH"
export PROJECTS="$HOME/dev"
export MOBILE="$HOME/Dropbox/Mobile"
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export GROOVY_HOME="$HOME/sdk/groovy-1.8.6"
export GRAILS_HOME="$HOME/sdk/grails-2.0.3"
export NDK_MODULE_PATH=.
export ANDROID_SDK_HOME="/Users/ebruning/sdk/android-sdks"

# Alias
alias vi=vim

unsetopt correctall

# boxen settings
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

