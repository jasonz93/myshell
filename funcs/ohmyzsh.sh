function ohmyzsh {
    if [ -d ~/.oh-my-zsh ]; then
        echo 'oh-my-zsh exists, apply settings'
        cp -fv .zshrc ~/
    fi
}
