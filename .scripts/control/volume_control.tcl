#!/usr/bin/env tclsh
if {[lindex $argv 0] == "i"} {
	exec pamixer -i [lindex $argv 1]
	exec notify-send "Status głośności" "[exec pamixer --get-volume]%"
}
if {[lindex $argv 0] == "d"} {
	exec pamixer -d [lindex $argv 1]
	exec notify-send "Status głośności" "[exec pamixer --get-volume]%"
}
