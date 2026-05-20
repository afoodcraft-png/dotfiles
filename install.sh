#!/bin/bash

echo "==> Installing packages..."
sudo pacman -S --needed git stow i3 polybar rofi alacritty picom feh dunst

echo "==> Removing existing configs..."
rm -rf ~/.config/i3
rm -rf ~/.config/polybar
rm -rf ~/.config/rofi
rm -rf ~/.config/alacritty
rm -rf ~/.config/picom
rm -f ~/.zshrc

echo "==> Stowing dotfiles..."
cd ~/dotfiles
stow i3 polybar rofi alacritty picom zsh

echo "==> Done! Please restart i3 with mod+Shift+r"
