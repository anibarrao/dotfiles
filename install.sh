#!/bin/bash

# Script created by Anderson Ibarra

# This Script is made to simplify the installation of the required tools
# to be a web developer using Neovim, iterm2, zsh and tmux. 

# This is a first version, and I hope it works well. 

# Variables
DOTFILES=$HOME/.dotfiles

# Symbolic links
symbolic_links(){
    echo "Removing previous configuration files for bash and zsh"
    rm -rf $HOME/.bash* $HOME/.zsh* && echo "Files erased"
    echo ""
    echo "Creating symbolic links for zshrc"
    if [ -f $DOTFILES/zsh/zshrc ]; then
        ln -nfs $DOTFILES/zsh/zshrc $HOME/.zshrc
    fi
    echo "Removing previous configuration files for nvim"
    rm -rf $HOME/.config/nvim 
    echo ""
    echo "Creating symbolic link for nvim configuration files"
    if [ -f $DOTFILES/zsh/zshrc ]; then
        ln -nfs $DOTFILES/nvim $HOME/.config/nvim
    fi
    echo ""
}

# Main Menu
Menu(){
    echo "Welcome to this set up script, please choose an option to select"\
    "what you want to do."
    
    echo ""
    echo "1) Creation of symbolic links"
    echo "2) First step installation (Homebrew, git)"
    echo "3) Install all the required packages for developing (without text editor)"
    echo "4) Install and set up Neovim"
    echo "5) Check compliances"
    echo "6) Exit"
    echo ""
    echo "Please choose an option"
}

# Menu
option=0
until [ $option -eq 6 ]
do
    case $option in
        1) 
            symbolic_links
            sleep 1
            clear
            echo "Symbolink links created"
            sleep 1
            clear
        	Menu
            ;;
        2)
            clear
            echo $option
        	Menu
            ;;
        3)
            clear
            echo $option
        	Menu
            ;;
        4)
            clear
            echo $option
        	Menu
            ;;
        5)
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

if [ $option -eq 6 ]; then
    clear
fi

#EOF

