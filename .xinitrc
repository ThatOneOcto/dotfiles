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
pipewire &
wireplumber &

# xrandr --output DP-5 --primary --mode 1920x1080 --rate 165 --pos 0x0 --output HDMI-4 --mode 1920x1080 --pos 1920x0

nvidia-settings --assign "CurrentMetaMode=$(nvidia-settings --query CurrentMetaMode | awk -F'::' '{print $2}' | sed 's/}/, ForceFullCompositionPipeline=On&/g')"


exec awesome
