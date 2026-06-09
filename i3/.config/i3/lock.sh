#!/bin/bash

# Catppuccin Mocha colors
BG="#1e1e2eFF"
BASE="#1e1e2eFF"
SURFACE="#313244FF"
MAUVE="#cba6f7FF"
TEXT="#cdd6f4FF"
SUBTEXT="#a6adc8FF"
RED="#f38ba8FF"
GREEN="#a6e3a1FF"
WRONG="#f38ba8FF"
CLEAR="#cba6f700"

i3lock \
  --nofork \
  --blur 5 \
  \
  --clock \
  --time-str="%I:%M %p" \
  --date-str="%A, %d %B %Y" \
  \
  --time-font="JetBrainsMono Nerd Font" \
  --date-font="JetBrainsMono Nerd Font" \
  --layout-font="JetBrainsMono Nerd Font" \
  --verif-font="JetBrainsMono Nerd Font" \
  --wrong-font="JetBrainsMono Nerd Font" \
  \
  --time-size=64 \
  --date-size=18 \
  \
  --time-color=$TEXT \
  --date-color=$SUBTEXT \
  \
  --inside-color=$BASE \
  --insidever-color=$SURFACE \
  --insidewrong-color=$SURFACE \
  \
  --ring-color=$MAUVE \
  --ringver-color=$GREEN \
  --ringwrong-color=$RED \
  --line-color=$SURFACE \
  \
  --keyhl-color=$MAUVE \
  --bshl-color=$RED \
  \
  --separator-color=$SURFACE \
  \
  --verif-text="verifying..." \
  --wrong-text="wrong password!" \
  --noinput-text="" \
  \
  --verif-color=$GREEN \
  --wrong-color=$RED \
  \
  --radius 120 \
  --ring-width 4 \
  \
  --ind-pos="x+w/2:y+h/2" \
  --time-pos="x+w/2:y+h/2-220" \
  --date-pos="x+w/2:y+h/2-160" \
