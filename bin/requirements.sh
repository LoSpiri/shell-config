#!/bin/bash

echo "Installing Visual Studio Code..."
if ! command -v code &> /dev/null; then
    sudo snap install --classic code
else
    echo "Visual Studio Code is already installed. Skipping."
fi

echo "Installing curl and neofetch..."
if ! dpkg -l | grep -q curl; then
    sudo apt install -y curl
else
    echo "curl is already installed. Skipping."
fi

if ! dpkg -l | grep -q neofetch; then
    sudo apt install -y neofetch
else
    echo "neofetch is already installed. Skipping."
fi

echo "----------------"