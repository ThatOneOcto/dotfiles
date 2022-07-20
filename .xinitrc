#!/bin/bash/
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto


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
sxhkd &
xfce4-clipman &
wireplumber &
pipewire & 
pipewire-pulse &
feh --bg-tile ~/.local/share/wallpaper/y-so-serious.png

# loops so yeah

#while true; do
       #dbus-launch --sh-syntax --exit-with-session dwm >/dev/null 2>&1
#done

#exec $HOME/.cache/xmonad/xmonad-x86_64-linux
qtile start
