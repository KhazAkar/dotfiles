#!/usr/bin/env tclsh
set status [catch {exec pamixer --get-mute}]
if {$status == "1"} {
	exec pamixer -t
	exec notify-send "Status wyciszenia" "Wyciszone"
	}
if {$status == "0"} {
	exec pamixer -t
	exec notify-send "Status wyciszenia" "Odciszone"
	}
