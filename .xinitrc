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
syncthing &
sxhkd &
picom &
easyeffects --gapplication-service &
xfce4-clipman &
pipewire & 
wireplumber &

xrandr --output DP-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-2 --off --output HDMI-1 --off --output DP-3 --primary --mode 1920x1080 --pos 0x0 --rotate normal --rate 165 --output HDMI-2 --off --output DP-4 --off --output HDMI-3 --off

exec awesome

armcord &
signal-desktop &
