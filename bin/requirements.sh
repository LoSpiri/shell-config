#!/bin/bash

# vscode
if ! command -v code &> /dev/null; then
    sudo snap install --classic code
else
    echo "Visual Studio Code is already installed. Skipping."
fi

# spotify
if ! command -v spotify &> /dev/null; then
    sudo snap install spotify
else
    echo "Spotify is already installed. Skipping."
fi

# curl
if ! dpkg -l | grep -q curl; then
    sudo apt install -y curl
else
    echo "curl is already installed. Skipping."
fi

# neofetch
if ! dpkg -l | grep -q neofetch; then
    sudo apt install -y neofetch
else
    echo "neofetch is already installed. Skipping."
fi

# vlc
if ! dpkg -l | grep -q vlc; then
    sudo apt install -y vlc
else
    echo "vlc is already installed. Skipping."
fi

# sudo apt install gnome-shell-extension-gpaste

echo "----------------"