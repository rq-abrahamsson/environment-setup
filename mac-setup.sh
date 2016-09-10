#!/bin/sh

#Install hombrew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#brew update

#brew install git
#brew install hub
#brew cask install google-chrome

###################
### setup ZSH and oh-my-zsh
###################

#brew install zsh zsh-completions

#curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

#Change shell and you should log in and out after this...
#chsh -s /usr/local/bin/zsh

#echo "    ZSH_THEME=pygmalion
#    plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)
#" >> ~/.zshrc
#    # Add env.sh
#    source ~/Projects/config/env.sh" >> ~/.zshrc

####################
### setup hub
####################
#eval "$(hub alias -s)"

####################
### setup spacemacs
####################
#brew tap d12frosted/emacs-plus
#brew install emacs-plus --with-cocoa --with-gnutls --with-librsvg --with-imagemagick --with-spacemacs-icon
#brew linkapps
#sudo rm /usr/bin/emacs
#sudo rm -rf /usr/share/emacs

#git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
### should remove
#####ln -s .spacemacs-template ~/.spacemacs


###################
### setup Python
###################

brew install python
pip install --upgrade setuptools
pip install --upgrade pip
pip install virtualenv
