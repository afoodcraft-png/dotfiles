#!/bin/bash

echo "==> Installing packages..."
sudo pacman -S --needed git stow i3 polybar rofi alacritty picom nitrogen dunst

echo "==> Removing existing configs..."
rm -rf ~/.config/i3
rm -rf ~/.config/polybar
rm -rf ~/.config/rofi
rm -rf ~/.config/alacritty
rm -rf ~/.config/picom
rm -f ~/.zshrc

echo "==> Stowing dotfiles..."
cd ~/dotfiles

stow i3
stow polybar
stow rofi
stow alacritty
stow picom
stow zsh

echo "==> Done! Please restart your session."


