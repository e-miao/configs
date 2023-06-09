#!/usr/bin/env bash


base_path=`pwd`
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
    cd ~/tmp/WhiteSur-gtk-theme && bash install.sh

    git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git ~/tmp/WhiteSur-icon-theme
    cd ~/tmp/WhiteSur-icon-theme && bash install.sh

    git clone https://github.com/vinceliuice/Qogir-theme.git ~/tmp/Qogir-theme
    cd ~/tmp/Qogir-theme && sudo bash install.sh
    
    gsettings set org.gnome.desktop.interface gtk-theme "Nordic Dark"
    gsettings set org.gnome.desktop.interface gtk-theme "Qogir"

    #rm -rf ~/tmp/*

    #gsettings set org.gnome.desktop.wm.preferences theme "Nordic Dark"
    #gsettings set org.gnome.desktop.wm.preferences theme "Qogir"
}

function fonts_ohmyzsh_install(){
    mkdir -p ~/.fonts
    cd $base_path
    tar -zxvf SourceCodePro.tar.gz -C ~/.fonts/

    mkdir -p ~/.fonts/MesloLGS_NF
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.fonts/MesloLGS_NF/  
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.fonts/MesloLGS_NF/  
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.fonts/MesloLGS_NF/  
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.fonts/MesloLGS_NF/

    fc-cache -fv
    
    # install p10k
    sudo apt install zsh -y
    
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    sed -i  "s#ZSH_THEME=\"robbyrussell\"#ZSH_THEME=\"powerlevel10k/powerlevel10k\"#g" ~/.zshrc
}



base_soft
theme_install
fonts_ohmyzsh_install