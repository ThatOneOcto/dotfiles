#!/bin/bash/

killall xfce4-clipman
killall udiskie
killall pipewire
killall pipewire-pulse
killall wireplumber
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO

xbacklight +100
dunst &
udiskie &
flameshot &
syncthing &
sxhkd &
picom &
easyeffects --gapplication-service &

xrandr --output DP-3 --primary --mode 1920x1080 --rate 165 --pos 0x0 --output DP-1 --mode 1920x1080 --pos 1920x0
exec awesome
