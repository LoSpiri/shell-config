#!/bin/bash

if ! command -v conda &> /dev/null; then
    curl -fsSL -o /tmp/miniconda-install.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash /tmp/miniconda-install.sh
    source ~/.bashrc
    conda create -n misc 
else
    echo "Conda is already installed. Skipping."
    echo "Conda version: $(conda --version)"
fi

echo "----------------"