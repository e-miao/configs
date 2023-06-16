#!/usr/bin/env bash

function base_soft(){
    sudo apt update 
    sudo apt install git curl wget zsh vim -y 
    sudo apt install gnome-tweaks flameshot -y
    sudo apt install -f
}

function theme_install(){
    echo "set theme start ...."
    mkdir -p ~/.themes/
    mkdir -p ~/tmp/
    wget -O ~/tmp/nordic.tar.xz https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic-darker.tar.xz
    tar -xf ~/tmp/nordic.tar.xz -C ~/.themes/

    git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git ~/tmp/WhiteSur-gtk-theme
    cd ~/tmp/WhiteSur-gtk-theme && sh install.sh

    git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git ~/tmp/WhiteSur-icon-theme
    cd ~/tmp/WhiteSur-icon-theme && sh install.sh

    git clone https://github.com/vinceliuice/Qogir-theme.git ~/tmp/Qogir-theme
    cd ~/tmp/Qogir-theme && sudo sh install.sh
    
    gsettings set org.gnome.desktop.interface gtk-theme "Nordic Dark"
    gsettings set org.gnome.desktop.interface gtk-theme "Qogir"

    #rm -rf ~/tmp/*

    #gsettings set org.gnome.desktop.wm.preferences theme "Nordic Dark"
    #gsettings set org.gnome.desktop.wm.preferences theme "Qogir"
}

function fonts_ohmyzsh_install(){
    mkdir -p ~/.fonts
    unzip Source_Code_Pro.zip -d ~/.fonts/

    mkdir -p ~/.fonts/MesloLGS_NF

    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O "~/.fonts/MesloLGS_NF/MesloLGS NF Italic.ttf"
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O "~/.fonts/MesloLGS_NF/MesloLGS NF Bold.ttf"
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O "~/.fonts/MesloLGS_NF/MesloLGS NF Bold Italic.ttf"
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O "~/.fonts/MesloLGS_NF/MesloLGS NF Regular.ttf"

    
    # install p10k
    sudo apt install zsh -y
    
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

}



base_soft
theme_install
fonts_ohmyzsh_install