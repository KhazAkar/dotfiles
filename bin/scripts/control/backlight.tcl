#!/usr/bin/env tclsh
if {[lindex $argv 0] == "inc"} {
	exec xbacklight -inc [lindex $argv 1]
	exec notify-send "Status podświetlenia" "[exec xbacklight -get]%"
}
if {[lindex $argv 0] == "dec"} {
	exec xbacklight -dec [lindex $argv 1]
	exec notify-send "Status podświetlenia" "[exec xbacklight -get]%"
}
if {[lindex $argv 0] == "set"} {
	exec xbacklight -set [lindex $argv 1]
	exec notify-send "Status podświetlenia" "[exec xbacklight -get]%"
}
