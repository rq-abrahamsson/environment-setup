# ###########
# All exports
# ###########

# Path to your oh-my-zsh installation.
export ZSH=/Users/robin.abrahamsson/.oh-my-zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export PATH="/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export ALTERNATE_EDITOR=emacs EDITOR=emacsclient VISUAL=emacsclient
# export EDITOR='emacs'

# Add latex to path
export PATH=${PATH}:/usr/local/texlive/2016/bin/x86_64-darwin

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#Add missing color
export TERM=xterm-256color

# Add android stuff to path
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools

# Rearrange so brew path is ok
export PATH=/usr/local/bin:$PATH


#Configure yarn and npm paths
export PATH="$PATH:`/usr/local/bin/yarn`"
alias npm-exec='PATH=$(npm bin):$PATH'
export PATH=./node_modules/.bin:$PATH

export NVM_DIR="/Users/robin.abrahamsson/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="$HOME/.elmenv/bin:$PATH"
eval "$(elmenv init -)"


#Set locale
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

#Configure Leiningen for Clojure
export PATH=~/bin:$PATH

