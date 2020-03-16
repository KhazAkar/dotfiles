#!/bin/env tclsh
# Set path to software to mounting software and for file manager
set mounts "udisksctl"
set mount " mount -b"
set unmount " unmount -b"
set filemanager "xfe"
# List needed packages
package require Tk
# List all external HDD's and pendrives 
set lstdev [glob -nocomplain -directory /dev/ {sd??}]
# List their names
set devname [glob -nocomplain -tails -path /dev/disk/by-label/ *] 
# Create MenuButton
ttk::menubutton .listdevices -menu .listdevices.menu -text "Select drive"
menu .listdevices.menu
.listdevices.menu add command -label "[lindex $devname 0] - [lindex $lstdev 0]" -command {set getdev "[lindex $devname 0] - [lindex $lstdev 0]"}
.listdevices.menu add command -label "[lindex $devname 1] - [lindex $lstdev 1]" -command {set getdev "[lindex $devname 1] - [lindex $lstdev 1]"}
#.listdevices.menu add command -label "[lindex $devname 2] - [lindex $lstdev 2]" -command {set getdev "[lindex $devname 2] - [lindex $lstdev 2]"}
# Pack UI
pack .listdevices
# Still packing UI...
pack [label .devlabel -textvariable getdev -font {Helvetica -16 bold} -height 3 -width 15 ]
pack [button .mount -text "Mount drive" -command "exec $mounts$mount [lindex $lstdev 0]"]
pack [button .unmount -text "Unmount drive" -command "exec $mounts$unmount [lindex $lstdev 0]"]
pack [button .xfe -text "Open X File Manager" -command {exec $filemanager &}]
