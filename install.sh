#!/bin/bash
set -e

DOTFILES_DIR="$HOME/dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Error: $DOTFILES_DIR tidak ditemukan. Clone dulu repo dotfiles-nya."
    exit 1
fi

echo "==> Installing packages..."
sudo pacman -S --needed git stow i3 polybar rofi alacritty picom feh dunst zsh starship

echo "==> Setting up Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh sudah ada, skip."
fi

echo "==> Installing zsh plugins (zsh-autosuggestions, zsh-syntax-highlighting)..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
[ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] || \
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
[ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] || \
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

echo "==> Backing up existing configs..."
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

for target in i3 polybar rofi alacritty picom dunst; do
    if [ -e "$HOME/.config/$target" ] && [ ! -L "$HOME/.config/$target" ]; then
        mv "$HOME/.config/$target" "$BACKUP_DIR/"
    fi
done

if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$BACKUP_DIR/"
fi

echo "==> Stowing dotfiles..."
cd "$DOTFILES_DIR"
stow -v i3 polybar rofi alacritty picom dunst zsh

echo "==> Set zsh as default shell? (y/n)"
read -r ans
if [ "$ans" = "y" ]; then
    chsh -s "$(command -v zsh)"
fi

echo "==> Done! Backup lama ada di $BACKUP_DIR"
echo "==> Beberapa program di i3 config (autotiling, thunar, blueman-applet, cbatticon,"
echo "    caffeine-indicator, pywal) ada di AUR, install manual pakai yay/paru kalau perlu."
echo "==> Restart i3 dengan mod+Shift+r, atau reboot supaya shell zsh aktif."
