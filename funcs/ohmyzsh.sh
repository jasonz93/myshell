function ohmyzsh {
    if [ -d ~/.oh-my-zsh ]; then
        echo 'oh-my-zsh exists, apply settings'
        local H=`echo $HOME|sed 's#/#\\\/#g'`
        sed "s/^\(export ZSH=\).*$/\1$H\/.oh-my-zsh/" .zshrc > ~/.zshrc
    fi
}
