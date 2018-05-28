#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi=/usr/bin/nvim
alias vim=/usr/bin/nvim
alias emacs=/usr/bin/nvim
alias sl=ls
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx
export LC_MESSAGES=en_US.UTF8
