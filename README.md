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
- **Notifikasi**: dunst
- **Shell**: zsh + [Oh My Zsh](https://ohmyz.sh/) + [Starship](https://starship.rs/) prompt

## Struktur

Dotfiles ini di-manage pakai [GNU Stow](https://www.gnu.org/software/stow/), tiap folder di root adalah satu "package":

```
dotfiles/
├── alacritty/.config/alacritty
├── dunst/.config/dunst
├── i3/.config/i3
├── picom/.config/picom
├── polybar/.config/polybar
├── rofi/.config/rofi
└── zsh/.zshrc
```

## Instalasi (cara cepat)

```bash
git clone https://github.com/afoodcraft-png/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

`install.sh` otomatis akan:
1. Install package inti lewat `pacman` (i3, polybar, rofi, alacritty, picom, feh, dunst, zsh, starship)
2. Install Oh My Zsh (kalau belum ada) + plugin `zsh-autosuggestions` & `zsh-syntax-highlighting`
3. Backup config lama yang bentrok ke `~/.config-backup-<tanggal>`
4. Stow semua dotfiles ke `$HOME`
5. Tanya apakah mau set zsh jadi default shell

> ⚠️ **Belum pernah dites di fresh install 100% otomatis dari awal sampai akhir.** Kalau ada error pas jalanin, kirim output-nya — kemungkinan besar cuma dependency yang kurang.

## Instalasi manual (kalau mau kontrol tiap langkah)

1. Install stow: `sudo pacman -S stow`
2. Symlink konfigurasi yang mau dipakai:
   ```bash
   stow alacritty
   stow i3
   stow picom
   stow polybar
   stow rofi
   stow dunst
   stow zsh
   ```
   Atau sekaligus semua: `stow */`
3. Kalau ada file yang bentrok (misal `.zshrc` bawaan sistem), backup dulu sebelum stow:
   ```bash
   mv ~/.zshrc ~/.zshrc.bak
   stow zsh
   ```
4. Install Oh My Zsh + plugin secara manual (lihat isi `install.sh` bagian "Setting up Oh My Zsh" kalau mau contoh command-nya), lalu install `starship` (`sudo pacman -S starship`) — `.zshrc` di repo ini butuh keduanya supaya prompt-nya kebentuk.

## Dependency opsional (AUR)

Beberapa baris `exec` di `i3/.config/i3/config` manggil program yang **nggak** ada di repo resmi Arch, jadi harus install manual pakai AUR helper (`yay`/`paru`) kalau mau semuanya jalan:

- `autotiling`
- `thunar` (file manager)
- `blueman-applet` (Bluetooth tray)
- `cbatticon` (battery indicator)
- `caffeine-indicator`
- `python-pywal` (`wal -R` buat re-apply color scheme)

Kalau nggak di-install, i3 cuma diem-diem gagal jalanin baris `exec` itu tanpa bikin crash — jadi aman untuk skip kalau nggak butuh, tinggal comment/hapus baris terkait di `i3/.config/i3/config`.

## Wallpaper

Path wallpaper di-hardcode di i3 config: `~/Pictures/wallpapers/nazuna.jpg`.

## Update konfigurasi

Edit file langsung di folder repo (misal `i3/.config/i3/config`), karena sudah symlink ke `~/.config/i3/config`. Setelah edit:

```bash
cd ~/dotfiles
git add .
git commit -m "update: deskripsi perubahan"
git push
```

## Lisensi

MIT — silakan pakai/modifikasi sesuka hati.
