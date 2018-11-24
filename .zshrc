#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi=/usr/bin/nvim
alias vim=/usr/bin/nvim
alias sl=ls
alias rlwrap=rlwrap -c -q '"' -b "'"'(){}[].,#@;|`"' -m
alias copy='(){cat $1 | xsel --clipboard}'
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx
export LC_MESSAGES=en_US.UTF8

PROMPT="%K{000}%F{040}[%n@%m %1~]%f%k "

# TODO failed.
#source /usr/share/git/completion/git-prompt.sh
#source /usr/share/git/completion/git-completion.zsh
#PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
