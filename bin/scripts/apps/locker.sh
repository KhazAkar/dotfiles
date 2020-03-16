#!/bin/sh

exec xautolock -detectsleep \
  -time 10 -locker "sh /home/khazakar/bin/scripts/apps/i3lock.sh" \
  -notify 30 \
  -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"
