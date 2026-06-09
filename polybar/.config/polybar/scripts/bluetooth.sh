#!/bin/bash
# ~/.config/polybar/scripts/bluetooth.sh
# Nerd Fonts bluetooth icon untuk Polybar

BT_ICON_ON="󰂯"
BT_ICON_OFF="󰂲"
MAUVE="#cba6f7"
MUTED="#6c7086"

# Cek apakah bluetoothctl ada
if ! command -v bluetoothctl &>/dev/null; then
    echo ""
    exit 0
fi

# Cek status power bluetooth
BT_STATUS=$(bluetoothctl show 2>/dev/null | grep "Powered:" | awk '{print $2}')

if [ "$BT_STATUS" = "yes" ]; then
    # Cek apakah ada device yang terkoneksi
    CONNECTED=$(bluetoothctl info 2>/dev/null | grep "Connected: yes")
    if [ -n "$CONNECTED" ]; then
        DEVICE=$(bluetoothctl info 2>/dev/null | grep "Name:" | awk -F': ' '{print $2}')
        echo "%{F${MAUVE}}${BT_ICON_ON}%{F-} ${DEVICE}"
    else
        echo "%{F${MAUVE}}${BT_ICON_ON}%{F-}"
    fi
else
    # Sembunyiin kalau BT off — uncomment baris bawah kalau mau tetap tampil
    # echo "%{F${MUTED}}${BT_ICON_OFF}%{F-}"
    echo ""
fi
