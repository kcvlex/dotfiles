function install(){
    sudo pacman -S zsh \
                   git \
                   xorg-xinit \
                   i3 \
                   dmenu \
                   rxvt-unicode \
                   neovim \
                   tmux \
                   ttf-dejavu \
                   firefox
}

function symbolic_link(){
    mkdir -p $HOME/.config/i3
    mkdir -p $HOME/.config/nvim
    
    ln -s ./.Xmodmap $HOME/.Xmodmap
    ln -s ./.Xresources $HOME/.Xresources
    ln -s ./.gitconfig $HOME/.gitconfig
    ln -s ./.i3 $HOME/.config/i3
    ln -s ./.tmux.conf $HOME/.tmux.conf
    ln -s ./.vimrc $HOME/.config/nvim/init.vim
    ln -s ./.xinitrc $HOME/.xinitrc
    ln -s ./.xprofile $HOME/.xprofile
    ln -s ./.zshrc $HOME/.zshrc
}

function execution(){
    xmodmap $HOME/.Xmodmap
    xrdb -load $HOME/.Xresources
    source .zshrc
}

install
symbolic_lint
execution
