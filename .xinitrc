#polkit agent from lxsession package
lxpolkit &

#network manager applet in the systray
nm-applet &

#Faster key pressing
xset r rate 300 35 &

#change language layout with alt-shift
setxkbmap -option caps:escape,grp:alt_shift_toggle -layout us,ir &

#set the last wallpaper
xwallpaper --zoom ~/Pictures/bg &

#turn the screen saver off
xset s off &

#auto mount
#udiskie -sN &

#turn numlock on
numlockx on &

#run the compositor
#picom --experimental-backend &

#apply the xresources
xrdb .Xresources &

# Statusbar loop
#while true; do
#   xsetroot -name "$(dwm_status)"
#   sleep 1m    # Update time every minute
#done &
#$HOME/Downloads/Programs/dwmblocks/dwmblocks &

#exec dwm
exec awesome
