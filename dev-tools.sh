#!/bin/bash

# Install GCC

Install_gcc(){
    brew install gcc
}

### Install SDKMAN
Install_SDKMAN ()
{
    curl "https://get.sdkman.io/" | bash && \
    source ~/.sdkman/bin/sdkman-init.sh
    source ~/.bash_profile 
}

### Install Dev_Tools
Install_DevTools ()
{
    JavaVersion=$(sdk list java|grep "11.*-zulu"|tr -s " "|head -n 1|awk '{ print $8 }')
    
    sdk install java $JavaVersion & \

    sdk install gradle 3.5 & \

    #sdk install maven 3.5.4 & \

    sdk install grails 2.5.3 && \

    sdk install grails 2.5.4 go version
    

}

### Instalar Docker
Install_Docker ()
{
    brew install docker
}

### Instalar Python3
Install_Python3 ()
{
    brew install python3
}

###Install Go
Install_Go ()
{
    #installing Go
    brew install go
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bash_profile 
    source ~/.bash_profile 
    go version
    if [[ "$?" == 0 ]];
    then
        echo "Go Instalado correctamente"
    else
        echo "Error al instalar Go"
    fi
}

#Install Nvm
Install_NVM ()
{
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    source ~/.bash_profile 
}

#Install Node
Install_Node ()
{
    brew install node
    nvm install node
    brew install npm
}

#INSTALLING RVM AND RUBY
Install_Ruby ()
{
    echo "Installing RVM and Ruby"
    curl -sSL https://get.rvm.io | bash -s stable --ruby
    rvm install 2.7
    source ~/.bash_profile
}

#installing KIBANA AND ELASTIC SEARCH
Install_Elastic ()
{
    echo "Installing Kibana Full"
    brew tap elastic/tap
    brew install elastic/tap/kibana-full

    echo "Installing Elastic Search"
    brew install elastic/tap/elasticsearch-full
    
    JAVA_PATH=$(/usr/libexec/java_home)
    echo "export ES_JAVA_HOME=$JAVA_PATH" >> ~/.bash_profile
    echo "export JAVA_HOME=$JAVA_PATH" >> ~/.bash_profile
    source ~/.bash_profile
}

##installing tools
Install_tools ()
{
    echo "Installing REDIS"
    brew install redis

    echo "Downloads VirtualBox"
    curl -o vbox.dmg  https://download.virtualbox.org/virtualbox/6.1.16/VirtualBox-6.1.16-140961-OSX.dmg
    
    echo "Installing Discord, Zoom, Github"
    brew install --cask zoom github discord
    
    echo "Downloads Maven"
    brew install maven
}

# Install fzf
Install_fzf(){
    brew install fzf
    $(brew --prefix)/opt/fzf/install
}

### Funcion menu
Menu ()
{
    echo ""
	echo "  1) Install all the environment"
	echo "  2) Install SDKMAN"
    echo "  3) Install Docker"
    echo "  4) Install Python3"
    echo "  5) Install Go"
    echo "  6) Install NVM"
    echo "  7) Install Node"
	echo "  8) Install Ruby"
    echo "  9) Install Elastic Search"
    echo "  10) Install gcc"
    echo "  11) Install fzf"
	echo "  12) Exit"
	echo ""
	echo "Choose an option"
}

### Menu Principal
opc=0
until [ $opc -eq 12 ]; do
    case $opc in
        1)  
            Install_SDKMAN
            Install_DevTools 
            Install_Docker
            Install_Python3
            Install_Go
            Install_NVM
            Install_Node
            Install_Ruby
            Install_Elastic
            Install_tools
            Install_gcc
            Install_fzf
            Menu
            ;;
        2)  
            Install_SDKMAN
            Menu
            ;;
        3)
            Install_Docker
            Menu
            ;;
        4)
            Install_Python3
            Menu
            ;;
            
        5)
            Install_Go
            Menu
            ;;
        6)
            Install_NVM
            Menu
            ;;
        7)
            Install_Node
            Menu
            ;;
        8)
            Install_Ruby
            Menu
            ;;
        9)
            Install_Elastic
            Menu
            ;;
        10) 
            Install_gcc
            Menu
            ;;
        11)
            Install_fzf
            Menu
            ;;
        *)
            Menu
            ;;
    esac
    read opc
done

#EOF
