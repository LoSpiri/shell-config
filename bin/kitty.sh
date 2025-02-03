#!/bin/bash

# BEGIN CONFIG BY DOCS >>>
if command -v kitty.app >/dev/null 2>&1; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
    # Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in your system-wide PATH)
    sudo ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten /usr/local/bin/
    # Place the kitty.desktop file somewhere it can be found by the OS
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
    # Update the paths to the kitty and its icon in the kitty desktop file(s)
    sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
    # Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
    echo 'kitty.desktop' > ~/.config/xdg-terminals.list
else
    echo "Kitty is already installed. Skipping."
fi
# <<< END CONFIG BY DOCS

# kitty.conf
KITTY_CONFIG=~/.config/kitty/kitty.conf
WALLPAPER_DIR=~/pictures/wallpapers
WALLPAPER_FILE=musashi-katana.jpg
WALLPAPER_SOURCE=./resources/$WALLPAPER_FILE
if [ ! -e "$KITTY_CONFIG" ]; then
    cp ./dotfiles/kitty.conf "$KITTY_CONFIG"
    echo "Copied .kitty.conf to home directory."
    if [ ! -d "$WALLPAPER_DIR" ]; then
        mkdir -p "$WALLPAPER_DIR"
        echo "Created wallpapers directory: $WALLPAPER_DIR"
    fi
    if [ -e "$WALLPAPER_SOURCE" ]; then
        cp "$WALLPAPER_SOURCE" "$WALLPAPER_DIR"
        echo "Copied $WALLPAPER_FILE to $WALLPAPER_DIR."
    else
        echo "Wallpaper $WALLPAPER_FILE already exists. Skipping copy."
    fi
else
    echo "kitty.conf already exists. Skipping copy."
fi

echo "----------------"