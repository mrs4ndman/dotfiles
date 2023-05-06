#!/usr/bin/env bash
# EPIC & Blazingly Fast shell script for setting up my environment:
#
# Let's go
# Pending install scripts for: Starship, Ranger & ranger-devicons
# , fzf (GH) / zsh / fish, neovim 0.9.0 (GH),  tmux (GH), codium (flatpak),
# ripgrep (GH), Eshare, powershell, virtualbox, 
#
# 
echo "Instalación completa de setup | Complete setup install"
sleep 1
instalar(){
    echo "Instalar: $0 [-m] [-s] [-c] [-a]"
}
# Case script for options:
while getopts "msc" opt; do
    case ${opt} in
        m ) m_flag=true ;;
        s ) s_flag=true ;;
        a ) m_flag=true ;;
        * ) usage; exit 1 ;;
    esac
done




if [ "$m_flag" = true ]; then
    echo "Comienza la instalación principal de paquetes por APT"
    sleep 1
    echo "\e[1mAVISO\e[0m : Vas a arrancar el script de paquetes. ¿Quieres continuar? (S/N)"
    read -r answer
    if [ "$answer" = "S" ] || [ "$answer" = "s" ]; then
# Main / Important programs / utilities
sudo apt install \
    firefox \
    keepassxc \
    psensor \
    smplayer \
    smplayer-themes \
    solaar \
    bat \
    vim \
    tre-command \
    alacritty \
    neofetch \
    ranger \
    bash-completion \
    zsh \
    fish \
    cava \
    bashtop \
    gnome-tweaks \
    discord \
    flameshot \
    libreoffice &&

# Common apps / packages installation
sudo apt install \
    apt-transport-https \
    cmatrix \
    command-not-found  \
    curl \
    cmake && 
sudo apt install file \
    findutils \
    fish \
    flameshot \
    g++ \
    gawk \
    gcc \
    git \
    gnupg  \
    gparted \
    gpg \
    gufw \
    htop \
    lolcat \
    lshw \
    mawk \
    net-tools \
    nohang \
    nyancat \
    openssl \
    perl \
    pong2 \
    procps &&
    # (only on initial setup (use case on the script)) & refind-theme
    sudo apt install remmina \
    smartmontools \
    speedtest-cli \
    steam \
    sudoku \
    thefuck \
    tilix \
    toilet \
    toilet-fonts \
    tree \
    trash-cli \
    wget \
    yt-dlp \
    zsh \
    # (for smartctl)
    
    else
    echo "Cancelando | Aborting ..."
        exit 0 
    fi
fi

if [ "$s_flag" = true ]; then
    
echo "Comenzando instalación de programas especiales: Spotify, libvirt, . ¿Quieres continuar?(S/N)"

	read -r answer
        sleep 1
        if [ "$answer" = "S" ] || [ "$answer" = "s" ]; then
            echo "Spotify" && curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg &&

		echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list;

		sudo apt update && sudo apt install spotify-client

   	echo "Buscar después en el menú de aplicaciones"

    sleep 1

    echo "Programming packages & needed packages for nvim"
# general stuff
    sudo apt install \
        python3.10-venv \
        golang && 
        sudo apt install tar rar unrar gzip zip ncompress p7zip-full zstd xz-utils \
        sudo apt install clang \
        npm \
        yarn \
        ninja-build \
        cmake \
        gettext \
        python3-dev \
        python3-pip \
        python3 \
        nodejs \
        tmux \
        ruby-full \
        php \
        build-essential \
        default-jdk \
        shellcheck &&
    pip3 install pynvim &&

mkdir -p ~/.config/nvim ~/.config/ranger ~/.config/fish ~/.config/alacritty ~/.config

# starship

    curl -sS https://starship.rs/install.sh | sh &&
    wget https://raw.githubusercontent.com/mrs4ndman/setup/master/.config/starship.toml && mv starship.toml ~/.config/ && cd ~ &&

# typescript

    sudo npm install -g typescript &&
# ranger-devicons

    git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons &&

# fzf git install
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install &&
 
# tmux plugin manager
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &&

# github various configs
    
    wget https://raw.githubusercontent.com/mrs4ndman/setup/master/.config/ranger/rc.conf && mv rc.conf ~/.config/ranger/rc.conf &&

# neovim & packer config

    git clone https://github.com/neovim/neovim &&

    cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && 

    git checkout stable &&

    cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb &&

    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim &&
        echo "Recuerda coger la confi del GitHub" &&

    cd ~

echo "overriding previous configurations: 3 seconds to cancel" &&
    sleep 3 &&
    mkdir tempdir && cd tempdir &&
    wget https://raw.githubusercontent.com/mrs4ndman/setup/master/.bashrc &&
    wget https://raw.githubusercontent.com/mrs4ndman/setup/master/.tmux.conf &&
    wget https://raw.githubusercontent.com/mrs4ndman/setup/master/.vimrc &&
    wget https://raw.githubusercontent.com/mrs4ndman/setup/master/.config/alacritty/alacritty.yml &&
    wget https://raw.githubusercontent.com/mrs4ndman/setup/master/.config/fish/config.fish &&
    wget https://raw.githubusercontent.com/mrs4ndman/setup/master/.zshrc &&
    mv alacritty.yml ~/.config/alacritty/alacritty.yml &&
    mv .bashrc ~/.bashrc &&
    mv .zshrc ~/.zshrc &&
    mv config.fish ~/.config/fish/config.fish &&
    mv .vimrc ~/.vimrc &&
    mv .tmux.conf ~/.tmux.conf &&
    cd ~ && rm -rf tempdir && rm -rf ~/neovim &&
    echo "Ahora fuentes :)"
    sleep 2
    echo "Instalar fuentes de ""https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono""" 
    echo "done! Si hay algo que ha fallado, este mensaje no se ve jeje"
    echo "manually install bat & bat-extras from sharkdp/bat & eth-p/bat-extras"

        fi
fi

