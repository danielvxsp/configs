#!/bin/bash

create_directory() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        echo "Created directory $1"
    fi
}

create_directory ~/.config
create_directory ~/.local/share/fonts
create_directory ~/.local/lib
create_directory ~/.local/bin

echo "Setting up configs"
mv config/lf-* ~/.local/bin
for dir in config/*; do
    if [ -d "$dir" ]; then
        cp -r "$dir" ~/.config/ && echo "Moved $dir to ~/.config/"
    fi
done

echo "Installing Xresources"
cp -r urxvt/.Xresources ~/ || echo "Failed - .Xresources"
xrdb -load ~/.Xresources

echo "Installing urxvt perl extensions"
cp -r urxvt/perls ~/.local/lib || echo "Failed - perl extensions"

echo "Moving fonts"
cp -r urxvt/fonts/FiraCodeNerdFont-Regular.ttf ~/.local/share/fonts/ || echo "Failed - FiraCodeRegular.ttf"
cp -r urxvt/fonts/FiraCodeNerdFont-Bold.ttf ~/.local/share/fonts/ || echo "Failed - FiraCodeBold.ttf"
cp -r urxvt/fonts/FSEX300.ttf ~/.local/share/fonts/ || echo "Failed - FSEX300.ttf"
echo "Installing fonts"
fc-cache -fv

echo "All operations completed successfully."
