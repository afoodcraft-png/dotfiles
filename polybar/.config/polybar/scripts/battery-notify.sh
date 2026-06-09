#!/bin/bash
# Notifikasi baterai otomatis

BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [ "$STATUS" = "Discharging" ]; then
    if [ "$BATTERY" -le 10 ]; then
        notify-send -u critical "󰁺 Baterai Kritis!" "Sisa $BATTERY% — segera charge!" 
    elif [ "$BATTERY" -le 20 ]; then
        notify-send -u normal "󰁻 Baterai Lemah" "Sisa $BATTERY%"
    fi
fi

if [ "$STATUS" = "Full" ]; then
    notify-send -u low "󰁹 Baterai Penuh" "Bisa dicabut chargernya"
fi
