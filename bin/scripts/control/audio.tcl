#!/usr/bin/env tclsh
set status [catch {exec pamixer --get-mute}]
if {[lindex $argv 0] == "inc"} {
	exec pamixer -i [lindex $argv 1]
	exec notify-send "Actual volume: " "[exec pamixer --get-volume]%"
}
if {[lindex $argv 0] == "dec"} {
	exec pamixer -d [lindex $argv 1]
	exec notify-send "Actual volume: " "[exec pamixer --get-volume]%"
}
if {([lindex $argv 0] == "tm" && $status == "1")} {
	exec pamixer -t
	exec notify-send "Mute status: " "Muted"
	}
if {([lindex $argv 0] == "tm" && $status == "0")}  {
	exec pamixer -t
	exec notify-send "Mute status: " "Not muted"
	}
