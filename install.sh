#!/bin/bash

# Script created by Anderson Ibarra

# This Script is made to simplify the installation of the required tools
# to be a web developer using Neovim, iterm2, zsh and tmux. 

# This is a first version, and I hope it works well. 

# Variables
DOTFILES=$HOME/.dotfiles
EMAIL=anderson.ibarra@mercadolibre.com.co
NAME=anibarrao


# Install tmux
Install_Tmux(){
    echo "Installing tmux..."
    sleep 0.5
    echo ""
    brew install tmux
}

# Install iterm2
Install_iTerm2(){
    echo "Installing iterm2..."
    sleep 0.5
    echo ""
    brew install iterm2
}

# Install Neovim
Install_vim(){
    echo "Installing Neovim..."
    sleep 0.5
    echo ""
    brew install neovim
}


# Install Git
Install_Git(){
    echo "" 
    echo "Installing Git"
    brew install git
    sleep 0.5
    echo ""
    echo "Making initial configurations"
    git config --global user.email $EMAIL
    git config --global user.name "$NAME"
    git config --global init.defaultBranch main
}

# Install Homebrew
Install_Homebrew(){
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "export PATH=$PATH:/opt/homebrew/bin" >> ~/.bash_profile
    source ~/.bash_profile
}

# Symbolic links
symbolic_links(){
    if [ -d $DOTFILES ]; then
        echo "Removing previous configuration files for bash and zsh"
        rm -rf $HOME/.bash* $HOME/.zsh* && echo "Files erased"
        echo ""
        echo "Creating symbolic links for zshrc"
        if [ -f $DOTFILES/zsh/zshrc ]; then
            ln -nfs $DOTFILES/zsh/zshrc $HOME/.zshrc
            source ~/.zshrc
        fi
        echo "Removing previous configuration files for nvim"
        rm -rf $HOME/.config/nvim 
        echo ""
        echo "Creating symbolic link for nvim configuration files"
        if [ -f $DOTFILES/zsh/zshrc ]; then
            ln -nfs $DOTFILES/nvim $HOME/.config/nvim
        fi
        echo ""
    else
        git clone git@github.com:anibarrao/dotfiles.git ~/.dotfiles
        symbolic_links
    fi
}

# Main Menu
Menu(){
    echo "Welcome to this set up script, please choose an option to select"\
    "what you want to do."
    
    echo ""
    echo "1) Install Homebrew"
    echo "2) Install git"
    echo "3) Install Neovim"
    echo "4) Install iterm2"
    echo "5) Install tmux"
    echo "6) Creation of symbolic links"
    echo "7) Make initial configurations (Brew, Git, iterm2, tmux and the creation of symbolic links"
    echo "8) Install all the required packages for developing (without text editor)"
    echo "9) Install and set up Neovim"
    echo "10) Check compliances"
    echo "11) Exit"
    echo ""
    echo "Please choose an option"
}

# Menu
option=0
until [ $option -eq 10 ]
do
    case $option in
        1) 
            Install_Homebrew
            Menu
            ;;
        2) 
            Install_Git
            sleep 0.5
            clear
            Menu
            ;;
        3) 
            Install_vim
            sleep 0.5
            clear
            Menu
            ;;
        4)
            Install_iTerm2
            sleep 0.5
            clear
            Menu
            ;;
        5)
            Install_Tmux
            sleep 0.5
            clear
            Menu
            ;;
        6)
            symbolic_links
            sleep 1
            clear
            echo "Symbolink links created"
            sleep 1
            clear
        	Menu
            ;;
        7)
            Install_Homebrew
            Install_Git
            Install_vim
            Install_iTerm2
            Install_Tmux
            symbolic_links
            sleep 0.5
            echo ""
            echo "Installation of the initial configurations succeded"
            sleep 1
            clear
        	Menu
            ;;
        8)
            clear
            echo $option
        	Menu
            ;;
        9)
            clear
            echo $option
        	Menu
            ;;
        10)
            clear
            echo $option
        	Menu
            ;;
        *)
            clear
        	Menu
            ;;
    esac
    read option
done

if [ $option -eq 9 ]; then
    clear
fi

#EOF

