#!/bin/bash

USER_DIRS_CONFIG=~/.config/user-dirs.dirs
if [ -f "./dotfiles/user-dirs.dirs" ]; then
    if [ ! -e "$USER_DIRS_CONFIG" ]; then
        cp ./dotfiles/user-dirs.dirs ~/.config/
        echo "Copied user-dirs.dirs configuration."
    else
        echo "user-dirs.dirs already exists. Skipping copy."
    fi
else
    echo "Dotfile user-dirs.dirs not found. Skipping."
fi

for dir in ~/Desktop ~/Music ~/Public ~/Templates ~/Videos; do
    if [ -d "$dir" ]; then
        rm -r "$dir"
        echo "Removed $dir."
    else
        echo "$dir does not exist. Skipping removal."
    fi
done

if [ -d ~/Downloads ]; then
    if [ ! -d ~/downloads ]; then
        mv ~/Downloads ~/downloads
        echo "Renamed Downloads to downloads."
    else
        echo "downloads directory already exists. Skipping rename."
    fi
else
    echo "Downloads directory does not exist. Skipping rename."
fi

if [ -d ~/Pictures ]; then
    if [ ! -d ~/pictures ]; then
        mv ~/Pictures ~/pictures
        echo "Renamed Pictures to pictures."
    else
        echo "pictures directory already exists. Skipping rename."
    fi
else
    echo "Pictures directory does not exist. Skipping rename."
fi

if [ -d ~/Documents ]; then
    if [ ! -d ~/documents ]; then
        mv ~/Documents ~/documents
        echo "Renamed Documents to documents."
    else
        echo "documents directory already exists. Skipping rename."
    fi
else
    echo "Documents directory does not exist. Skipping rename."
fi

echo "----------------"