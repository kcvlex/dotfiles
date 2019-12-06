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
alias javaws='_JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=lcd" javaws'
alias rime='~/.local/bin/rime'
alias hatasa='yes'
alias make='CCACHE_DIR=${pwd}/build/ccache make'
alias keepassx="cp Documents/.key.kdb.swap Documents/.key.kdb.swap.swap && cp Documents/key.kdb Documents/.key.kdb.swap && keepassx"
alias unsip-sjis="UNZIPOPT=\"-OCP932\" unzip"
alias eclipse="LANG=C eclipse"

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export DefaultIMModule=fcitx
export LC_MESSAGES=en_US.UTF8
export FT2_SUBPIXEL_HINTING=1
export JAVA_FONTS=/usr/share/fonts/TTF
export JAVA_HOME=/usr/lib/jvm/default

PROMPT="%K{000}%F{040}[%n@%m %1~]%f%k "

autoload -U compinit
compinit

# TODO failed.
#source /usr/share/git/completion/git-prompt.sh
#source /usr/share/git/completion/git-completion.zsh
#PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
