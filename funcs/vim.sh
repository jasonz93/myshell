function vim {
    echo 'Configuring vim...'
    # Install Vundle
    if [ ! -f ~/.vim/bundle/Vundle.vim/README.md ]; then
        echo "Installing Vundle..."
        mkdir -p ~/.vim/bundle
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi

    # Install dein
    if [ ! -f ~/.vim/bundle/dein.vim/README.md ]; then
        echo "Installing dein..."
        mkdir -p ~/.vim/bundle
        git clone https://github.com/Shougo/dein.vim ~/.vim/bundle/dein.vim
    fi

    # Install vim-instant-markdown
    #if node -v; then
    #    echo "Node.JS detected, installing vim-instant-markdown"
    #    if ! npm ls -g|grep instant-markdown-d; then
    #        npm install -g instant-markdown-d
    #    fi
    #fi

    # Install markdown-preview
    pip install markdown pygments

    # Install node-inspector
    if node -v; then
        echo "Node.JS detected, installing node-inspector, you can use 'node-debug {your script or entry}' to debug you Node.JS script"
        if ! npm ls -g|grep node-inspector; then
            npm install -g node-inspector
        fi
    fi

    echo "Overwriting .vimrc"
    cat vimrc > ~/.vimrc
    vi +PluginInstall +qall
}

