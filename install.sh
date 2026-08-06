#!/bin/bash
set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "==> Installing packages..."
sudo pacman -S --needed git stow i3 polybar rofi alacritty picom feh dunst zsh

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Error: $DOTFILES_DIR tidak ditemukan. Clone dulu repo dotfiles-nya."
    exit 1
fi

echo "==> Backing up existing configs..."
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

for target in i3 polybar rofi alacritty picom; do
    if [ -e "$HOME/.config/$target" ] && [ ! -L "$HOME/.config/$target" ]; then
        mv "$HOME/.config/$target" "$BACKUP_DIR/"
    fi
done

if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$BACKUP_DIR/"
fi

echo "==> Stowing dotfiles..."
cd "$DOTFILES_DIR"
stow -v i3 polybar rofi alacritty picom zsh

echo "==> Set zsh as default shell? (y/n)"
read -r ans
if [ "$ans" = "y" ]; then
    chsh -s "$(which zsh)"
fi

echo "==> Done! Backup lama ada di $BACKUP_DIR"
echo "==> Restart i3 dengan mod+Shift+r"
