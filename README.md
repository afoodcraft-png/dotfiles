# dotfiles

Konfigurasi Arch Linux + i3 saya. Minimal, terminal-focused, tema **Catppuccin Mocha Mauve**.

## Setup

- **OS**: Arch Linux
- **WM**: i3 (X11)
- **Terminal**: Alacritty
- **Font**: JetBrainsMono Nerd Font
- **Compositor**: picom
- **Bar**: polybar
- **Launcher**: rofi
- **Shell**: zsh

## Struktur

Dotfiles ini di-manage pakai [GNU Stow](https://www.gnu.org/software/stow/), tiap folder di root adalah satu "package":

```
dotfiles/
├── alacritty/.config/alacritty
├── i3/.config/i3
├── picom/.config/picom
├── polybar/.config/polybar
├── rofi/.config/rofi
└── zsh/
```

## Instalasi

1. Clone repo:
   ```bash
   git clone https://github.com/afoodcraft-png/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Install stow (kalau belum ada):
   ```bash
   sudo pacman -S stow
   ```

3. Symlink konfigurasi yang mau dipakai:
   ```bash
   stow alacritty
   stow i3
   stow picom
   stow polybar
   stow rofi
   stow zsh
   ```

   Atau sekaligus semua:
   ```bash
   stow */
   ```

4. Kalau ada file yang bentrok (misal `.zshrc` bawaan sistem), hapus/backup dulu sebelum stow:
   ```bash
   mv ~/.zshrc ~/.zshrc.bak
   stow zsh
   ```

## Update konfigurasi

Edit file langsung di folder repo (misal `i3/.config/i3/config`), karena sudah symlink ke `~/.config/i3/config`. Setelah edit:

```bash
cd ~/dotfiles
git add .
git commit -m "update: deskripsi perubahan"
git push
```

## Screenshot

_(tambahkan screenshot rice di sini)_

## Lisensi

MIT — silakan pakai/modifikasi sesuka hati.
