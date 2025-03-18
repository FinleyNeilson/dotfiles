#!/bin/sh

# Restore the background using Nitrogen
nitrogen --restore &

# Start Redshift with the specified location
redshift -l -41.28664:174.77557 &

# Set the display configuration with xrandr
xrandr --output HDMI-2 --off &

# Start BSPWM
exec bspwm
