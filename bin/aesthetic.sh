#!/bin/bash

# fonts
FONT_DIR=~/.local/share/fonts/
STOP_AND_SET_FONT=1

if [ ! -d "$FONT_DIR" ]; then
    mkdir -p "$FONT_DIR"
    STOP_AND_SET_FONT=0
fi
for font in ../fonts/*; do
    if [ ! -e "$FONT_DIR/$(basename "$font")" ]; then
        cp "$font" "$FONT_DIR"
        echo "Added font: $font"
    fi
done
if [ "$STOP_AND_SET_FONT" -eq 0 ]; then
    echo "Set font from preferences and re-run"
    exit
fi

# copy dotfiles
ZSH_CONFIG=~/.zshrc
P10K_CONFIG=~/.p10k.zsh
if [ ! -e "$ZSH_CONFIG" ]; then
    cp ../dotfiles/.zshrc $ZSH_CONFIG
    echo "Copied .zshrc to home directory."
else
    echo ".zshrc already exists. Skipping copy."
fi

echo "----------------"