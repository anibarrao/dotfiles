#!/bin/bash

# Script created by Anderson Ibarra

# This Script is made to simplify the installation of the required tools
# to be a web developer using Neovim, iterm2, zsh and tmux. 

# This is a first version, and I hope it works well. 

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
            clear
            echo $option
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

