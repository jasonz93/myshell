function nvm {
    if [ -d ~/.nvm ]; then
        echo 'nvm detected, apply settings'
        case `echo $SHELL|awk -F/ '{print $NF}'` in
        zsh)
            echo 'zsh detected.'
            local PROFILE=.zprofile
            ;;
        bash)
            echo 'bash detected.'
            local PROFILE=.bash_profile
            ;;
        *)
            echo 'cannot detect current shell'
            ;;
        esac
        if [ $PROFILE ]; then
            if `diff nvm.profile ~/$PROFILE|grep -q \<`; then
                echo "Adding nvm settings to $PROFILE"
                cat nvm.profile >> ~/$PROFILE
            else
                echo "nvm settings exist, ignore."
            fi
        fi
    fi
}

