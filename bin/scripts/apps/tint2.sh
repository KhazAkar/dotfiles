#!/bin/sh
CFGDIR="/home/khazakar/.config/tint2"
tint2 -c $CFGDIR/1stpanel.tint2rc 2> /dev/null &
sleep 1s &
tint2 -c $CFGDIR/2ndpanel.tint2rc 2> /dev/null &


