#!/bin/sh
( xrandr --output eDP1 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output DP1 --off --output DP1-1 --mode 1920x1080 --pos 3840x0 --rotate normal --output DP1-2 --off --output DP1-3 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off && sleep 1s )
