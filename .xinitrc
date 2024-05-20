#!/bin/sh

# Restore the background using Nitrogen
nitrogen --restore

redshift -l -41.28664:174.77557 &
xrandr --output HDMI-2 --off
exec bspwm
