#!/bin/bash

echo "==> Installing packages..."
sudo pacman -S --needed git stow i3 polybar rofi alacritty picom nitrogen dunst

echo "==> Stowing dotfiles..."
cd ~/dotfiles

stow i3
stow polybar
stow rofi
stow alacritty
stow picom
stow zsh

echo "==> Done! Please restart your session."
