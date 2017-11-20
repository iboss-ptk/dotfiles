#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/supanat/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
bindkey -v
# End of lines configured by zsh-newuser-install

# setup JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/Users/supanat/Library/Android/sdk
export PATH=$PATH:/Applications/Emacs.app/Contents/MacOS/bin/:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# set default editor and visual to neovim
export EDITOR="nvim"
export VISUAL="nvim"

# nvim alias
alias n=nvim

# Ctrl-z to go back to vim instead of fg<CR>
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

bindkey -M viins 'jk' vi-cmd-mode

# vim config shortcut
alias vimc='nvim ~/.vimrc.local'
alias vimplug='nvim ~/.vimrc.bundles.local'

# zsh config shortcut
alias zrc='vim ~/.zshrc'

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# clear alias
alias c=clear

# git status alias
alias gst='git status'

# export current user bin
export PATH=/Users/supanat/.local/bin:/Users/$USER/bin:$PATH
export PATH="$HOME/Library/Haskell/bin:$PATH"

# theme
prompt agnoster

